#Map working directory
repository <- file.path(dirname(rstudioapi::getSourceEditorContext()$path))
setwd(repository)

#Load required libraries
#library(data.table)
library(openxlsx)
library(readxl)
library(dplyr)
library(tidyverse)

#### *********************** IMTS table 1 processing *********************************** ####

# Process table1
table1 <- read_excel("data/emp_Data.xlsx", sheet = "table1")

# Reshape from wide to long format
table1_long <- table1 %>%
  pivot_longer(
    cols = A01:`_T`,
    names_to = "INDUSTRY",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table1_long <- table1_long |>
  select(DATAFLOW, FREQ, REF_AREA, INDICATOR, SEX, INDUSTRY, TRANSFORMATION, TIME_PERIOD, OBS_VALUE,
         UNIT_MEASURE, UNIT_MULT, BASE_PER, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))
  
# Output table1 to output csv file
write.csv(table1_long, "output/emp/DF_EMP_TABLE1.csv", row.names = FALSE)


#### *********************** IMTS table 2 processing *********************************** ####

# Process table2
table2 <- read_excel("data/emp_Data.xlsx", sheet = "table2")

# Reshape from wide to long format
table2_long <- table2 %>%
  pivot_longer(
    cols = A01:`_T`,
    names_to = "INDUSTRY",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table2_long <- table2_long |>
  select(DATAFLOW, FREQ, REF_AREA, INDICATOR, SEX, INDUSTRY, TRANSFORMATION, TIME_PERIOD, OBS_VALUE,
         UNIT_MEASURE, UNIT_MULT, BASE_PER, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

# Output table1 to output csv file
write.csv(table2_long, "output/emp/DF_EMP_TABLE2.csv", row.names = FALSE)


#### *********************** IMTS table 3 processing *********************************** ####

# Process table3
table3 <- read_excel("data/emp_Data.xlsx", sheet = "table3")

# Reshape from wide to long format
table3_long <- table3 %>%
  pivot_longer(
    cols = A01:`_T`,
    names_to = "INDUSTRY",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table3_long <- table3_long |>
  select(DATAFLOW, FREQ, REF_AREA, INDICATOR, SEX, INDUSTRY, TRANSFORMATION, TIME_PERIOD, OBS_VALUE,
         UNIT_MEASURE, UNIT_MULT, BASE_PER, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

# Output table1 to output csv file
write.csv(table3_long, "output/emp/DF_EMP_TABLE3.csv", row.names = FALSE)








