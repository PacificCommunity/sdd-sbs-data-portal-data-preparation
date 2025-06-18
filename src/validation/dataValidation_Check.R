library(shiny)
library(readr)
library(dplyr)
library(DT)

ui <- fluidPage(
  titlePanel("SDMX Data Validation Tool"),
  
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

server <- function(input, output) {
  
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
      required_cols <- c("DATAFLOW", "FREQ", "REF_AREA", "TIME_PERIOD", "OBS_VALUE")
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
            
      # Additional custom checks can go here
      
      cat("=== End of Report ===\n")
    })
  })
}

shinyApp(ui, server)