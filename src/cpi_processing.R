#Map working directory
repository <- file.path(dirname(rstudioapi::getSourceEditorContext()$path))
setwd(repository)

#Load required libraries
library(openxlsx)
library(readxl)
library(dplyr)
library(tidyverse)


#### ************************* CPI tables Processing ************************* ####

# Path to your Excel file
file_path <- "../data/cpiData.xlsx"

# Get list of sheet names
sheet_names <- excel_sheets(file_path)

i = 1
numsheet = length(sheet_names)

while (i <= numsheet) {
  # Process tables
  table <- read_excel(file_path, sheet = sheet_names[i])
  # Reshape from wide to long format
  table_long <- table %>%
    pivot_longer(
      cols = -c(DATAFLOW:DECIMALS),
      names_to = "ITEM",
      values_to = "OBS_VALUE"
    )
  
  # Re-order the columns in the proper order
  table_long <- table_long |>
    relocate( ITEM, .before = TRANSFORMATION) |>
    relocate(OBS_VALUE, .before = UNIT_MEASURE) |>
    mutate(across(everything(), ~replace(., is.na(.), "")))
  
  sheetName <- paste0("../output/cpi/",sheet_names[i],".csv")
  
  # Output table1 to output csv file
  write.csv(table_long, sheetName, row.names = FALSE)
  
  i <- i + 1
}
