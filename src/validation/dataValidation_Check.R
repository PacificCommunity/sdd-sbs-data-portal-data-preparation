library(shiny)
library(readxl)
library(openxlsx)
library(readr)
library(dplyr)
library(tidyr)
library(DT)
library(shinyjs)

# Define credentials (in production, use secure authentication)
credentials <- data.frame(
  username = c("admin", "user"),
  password = c("admin123", "user123"),
  stringsAsFactors = FALSE
)

ui <- fluidPage(
  useShinyjs(),
  
  # Login UI
  div(id = "login_page",
      wellPanel(
        textInput("user_name", "Username"),
        passwordInput("password", "Password"),
        actionButton("login_btn", "Log in"),
        verbatimTextOutput("login_status")
      )
  ),
  
  hidden(
    div(id = "main_app",
  titlePanel("SBS Data Portal Data Validation Tool"),
  
  sidebarLayout(
    sidebarPanel(
      fileInput("file", "Upload CSV File", accept = ".csv"),
      actionButton("validate", "Run Validation")
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Data Preview", DTOutput("table")),
        tabPanel("Validation Results", verbatimTextOutput("validation"))
       )
     )
   )
 )
)
)

server <- function(input, output) {
  
  # Login logic
  observeEvent(input$login_btn, {
    user <- input$user_name
    pass <- input$password
    
    valid <- any(credentials$username == user & credentials$password == pass)
    
    if (valid) {
      shinyjs::hide("login_page")
      shinyjs::show("main_app")
    } else {
      output$login_status <- renderText("Invalid credentials. Try again.")
    }
  })
  
  # Reactive to store uploaded data
  data <- reactive({
    req(input$file)
    read_csv(input$file$datapath, show_col_types = FALSE)
  })
  
  # Show table preview
  output$table <- renderDT({
    req(data())
    datatable(data(), options = list(scrollX = TRUE))
  })
  
  # Validation results
  observeEvent(input$validate, {
    output$validation <- renderPrint({
      df <- data()
      
      # Basic checks
      required_cols <- c("DATAFLOW", "FREQ", "REF_AREA", "TIME_PERIOD", "OBS_VALUE", "UNIT_MEASURE")
      missing_cols <- setdiff(required_cols, names(df))
      
      cat("=== SDMX Validation Report ===\n\n")
      
      if (length(missing_cols) > 0) {
        cat("❌ Missing required columns:", paste(missing_cols, collapse = ", "), "\n\n")
      } else {
        cat("✅ All required columns are present.\n\n")
      }
      
      # Check for missing values
      na_counts <- colSums(is.na(df))
      na_report <- na_counts[na_counts > 0]
      
      if (length(na_report) > 0) {
        cat("⚠️ Columns with missing values:\n")
        print(na_report)
        cat("\n")
      } else {
        cat("✅ No missing values detected.\n\n")
      }
      
      # OBS_VALUE should be numeric
      if (!is.numeric(df$OBS_VALUE)) {
        cat("❌ OBS_VALUE is not numeric. It is of type:", class(df$OBS_VALUE), "\n\n")
      } else {
        cat("✅ OBS_VALUE is numeric.\n\n")
      }

      # Duplicate check (based on all columns or a subset)
      if (nrow(df) != nrow(distinct(df))) {
        dup_rows <- df[duplicated(df), ]
        cat("❌ Duplicate rows found:", nrow(dup_rows), "\n\n")
        print(head(dup_rows, 5))
        if (nrow(dup_rows) > 5) cat("...only first 5 duplicates shown\n\n")
      } else {
        cat("✅ No duplicate rows found.\n\n")
      }
      
      # Check that REF_AREA is only "WS"
      if ("REF_AREA" %in% names(df)) {
        invalid_ref_areas <- unique(df$REF_AREA[df$REF_AREA != "WS"])
        if (length(invalid_ref_areas) > 0) {
          cat("❌ Invalid REF_AREA values found:\n")
          print(invalid_ref_areas)
          cat("\n")
        } else {
          cat("✅ All REF_AREA values are 'WS'.\n\n")
        }
      }
      
      # Check that FREQ values are only "A", "Q", or "M"
      if ("FREQ" %in% names(df)) {
        invalid_freq <- unique(df$FREQ[!df$FREQ %in% c("A", "Q", "M")])
        if (length(invalid_freq) > 0) {
          cat("❌ Invalid FREQ values found (allowed: A, Q, M):\n")
          print(invalid_freq)
          cat("\n")
        } else {
          cat("✅ All FREQ values are valid (A, Q, M).\n\n")
        }
      }
      
      # TIME_PERIOD length must be 4 when FREQ is "A"
      if (all(c("FREQ", "TIME_PERIOD") %in% names(df))) {
        invalid_time <- df$TIME_PERIOD[nchar(df$TIME_PERIOD) > 4 & df$FREQ == "A"]
        if (length(invalid_time) > 0) {
          cat("❌ TIME_PERIOD values longer than 4 characters found where FREQ is 'A':\n")
          print(unique(invalid_time))
          cat("\n")
        } else {
          cat("✅ All TIME_PERIOD values are valid for FREQ = 'A'.\n\n")
        }
      }
      
      # Additional TIME_PERIOD format checks for FREQ = Q and M
      if (all(c("FREQ", "TIME_PERIOD") %in% names(df))) {
        
        # Check for FREQ = "Q"
        invalid_q <- df$TIME_PERIOD[df$FREQ == "Q" & !grepl("^\\d{4}-Q[1-4]$", df$TIME_PERIOD)]
        if (length(invalid_q) > 0) {
          cat("❌ Invalid TIME_PERIOD values for FREQ = 'Q' (expected format 'YYYY-Qn'):\n")
          print(unique(invalid_q))
          cat("\n")
        } else {
          cat("✅ All TIME_PERIOD values are valid for FREQ = 'Q'.\n\n")
        }
        
        # Check for FREQ = "M"
        invalid_m <- df$TIME_PERIOD[df$FREQ == "M" & !grepl("^\\d{4}-\\d{2}$", df$TIME_PERIOD)]
        if (length(invalid_m) > 0) {
          cat("❌ Invalid TIME_PERIOD values for FREQ = 'M' (expected format 'YYYY-MM'):\n")
          print(unique(invalid_m))
          cat("\n")
        } else {
          cat("✅ All TIME_PERIOD values are valid for FREQ = 'M'.\n\n")
        }
      }
      
      # Additional custom checks can go here
      
      cat("=== End of Report ===\n")
    })
  })
}

shinyApp(ui, server)