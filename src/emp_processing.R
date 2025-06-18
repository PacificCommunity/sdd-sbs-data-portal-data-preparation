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
table1 <- read_excel("../data/emp_Data.xlsx", sheet = "table1")

# Reshape from wide to long format
table1_long <- table1 %>%
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "INDUSTRY",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table1_long <- table1_long |>
  select(DATAFLOW, FREQ, REF_AREA, INDICATOR, SEX, INDUSTRY, TRANSFORMATION, TIME_PERIOD, OBS_VALUE,
         UNIT_MEASURE, UNIT_MULT, BASE_PER, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))
  
# Output table1 to output csv file
write.csv(table1_long, "../output/emp/DF_EMP_TABLE1.csv", row.names = FALSE)


#### *********************** IMTS table 2 processing *********************************** ####

# Process table2
table2 <- read_excel("../data/emp_Data.xlsx", sheet = "table2")

# Reshape from wide to long format
table2_long <- table2 %>%
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "INDUSTRY",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table2_long <- table2_long |>
  select(DATAFLOW, FREQ, REF_AREA, INDICATOR, SEX, INDUSTRY, TRANSFORMATION, TIME_PERIOD, OBS_VALUE,
         UNIT_MEASURE, UNIT_MULT, BASE_PER, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

# Output table1 to output csv file
write.csv(table2_long, "../output/emp/DF_EMP_TABLE2.csv", row.names = FALSE)


#### *********************** IMTS table 3 processing *********************************** ####

# Process table3
table3 <- read_excel("../data/emp_Data.xlsx", sheet = "table3")

# Reshape from wide to long format
table3_long <- table3 %>%
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "INDUSTRY",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table3_long <- table3_long |>
  select(DATAFLOW, FREQ, REF_AREA, INDICATOR, SEX, INDUSTRY, TRANSFORMATION, TIME_PERIOD, OBS_VALUE,
         UNIT_MEASURE, UNIT_MULT, BASE_PER, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

# Output table1 to output csv file
write.csv(table3_long, "../output/emp/DF_EMP_TABLE3.csv", row.names = FALSE)


#### *********************** IMTS table 4a processing *********************************** ####

# Process table4
table4a <- read_excel("../data/emp_Data.xlsx", sheet = "table4a")

# Reshape from wide to long format
table4a_long <- table4a %>%
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "INDUSTRY",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table4a_long <- table4a_long |>
  select(DATAFLOW, FREQ, REF_AREA, INDICATOR, SEX, INDUSTRY, TRANSFORMATION, TIME_PERIOD, OBS_VALUE,
         UNIT_MEASURE, UNIT_MULT, BASE_PER, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

# Output table1 to output csv file
write.csv(table3_long, "../output/emp/DF_EMP_TABLE4A.csv", row.names = FALSE)


#### *********************** IMTS table 4b processing *********************************** ####

# Process table4
table4b <- read_excel("../data/emp_Data.xlsx", sheet = "table4b")

# Reshape from wide to long format
table4b_long <- table4b %>%
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "INDUSTRY",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table4b_long <- table4b_long |>
  select(DATAFLOW, FREQ, REF_AREA, INDICATOR, SEX, INDUSTRY, TRANSFORMATION, TIME_PERIOD, OBS_VALUE,
         UNIT_MEASURE, UNIT_MULT, BASE_PER, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

# Output table1 to output csv file
write.csv(table4b_long, "../output/emp/DF_EMP_TABLE4B.csv", row.names = FALSE)


#### *********************** IMTS table 5 processing *********************************** ####

# Process table5
table5 <- read_excel("../data/emp_Data.xlsx", sheet = "table5")

# Reshape from wide to long format
table5_long <- table5 %>%
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "INDUSTRY",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table5_long <- table5_long |>
  select(DATAFLOW, FREQ, REF_AREA, INDICATOR, SEX, INDUSTRY, TRANSFORMATION, TIME_PERIOD, OBS_VALUE,
         UNIT_MEASURE, UNIT_MULT, BASE_PER, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

# Output table1 to output csv file
write.csv(table5_long, "../output/emp/DF_EMP_TABLE5.csv", row.names = FALSE)


#### *********************** IMTS table 6a processing *********************************** ####

# Process table6a
table6a <- read_excel("../data/emp_Data.xlsx", sheet = "table6a")

# Reshape from wide to long format
table6a_long <- table6a %>%
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "INDUSTRY",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table6a_long <- table6a_long |>
  select(DATAFLOW, FREQ, REF_AREA, INDICATOR, SEX, INDUSTRY, TRANSFORMATION, TIME_PERIOD, OBS_VALUE,
         UNIT_MEASURE, UNIT_MULT, BASE_PER, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

# Output table1 to output csv file
write.csv(table6a_long, "../output/emp/DF_EMP_TABLE6A.csv", row.names = FALSE)


#### *********************** IMTS table 6b processing *********************************** ####

# Process table6b
table6b <- read_excel("../data/emp_Data.xlsx", sheet = "table6b")

# Reshape from wide to long format
table6b_long <- table6b %>%
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "INDUSTRY",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table6b_long <- table6b_long |>
  select(DATAFLOW, FREQ, REF_AREA, INDICATOR, SEX, INDUSTRY, TRANSFORMATION, TIME_PERIOD, OBS_VALUE,
         UNIT_MEASURE, UNIT_MULT, BASE_PER, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

# Output table1 to output csv file
write.csv(table6b_long, "../output/emp/DF_EMP_TABLE6B.csv", row.names = FALSE)


#### *********************** IMTS table 7 processing *********************************** ####

# Process table7
table7 <- read_excel("../data/emp_Data.xlsx", sheet = "table7")

# Reshape from wide to long format
table7_long <- table7 %>%
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "INDUSTRY",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table7_long <- table7_long |>
  select(DATAFLOW, FREQ, REF_AREA, INDICATOR, SEX, INDUSTRY, TRANSFORMATION, TIME_PERIOD, OBS_VALUE,
         UNIT_MEASURE, UNIT_MULT, BASE_PER, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

# Output table1 to output csv file
write.csv(table7_long, "../output/emp/DF_EMP_TABLE7.csv", row.names = FALSE)


#### *********************** IMTS table 8a processing *********************************** ####

# Process table8a
table8a <- read_excel("../data/emp_Data.xlsx", sheet = "table8a")

# Reshape from wide to long format
table8a_long <- table8a %>%
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "INDUSTRY",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table8a_long <- table8a_long |>
  select(DATAFLOW, FREQ, REF_AREA, INDICATOR, SEX, INDUSTRY, TRANSFORMATION, TIME_PERIOD, OBS_VALUE,
         UNIT_MEASURE, UNIT_MULT, BASE_PER, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

# Output table1 to output csv file
write.csv(table8a_long, "../output/emp/DF_EMP_TABLE8A.csv", row.names = FALSE)


#### *********************** IMTS table 8b processing *********************************** ####

# Process table8b
table8b <- read_excel("../data/emp_Data.xlsx", sheet = "table8b")

# Reshape from wide to long format
table8b_long <- table8b %>%
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "INDUSTRY",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table8b_long <- table8b_long |>
  select(DATAFLOW, FREQ, REF_AREA, INDICATOR, SEX, INDUSTRY, TRANSFORMATION, TIME_PERIOD, OBS_VALUE,
         UNIT_MEASURE, UNIT_MULT, BASE_PER, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

# Output table1 to output csv file
write.csv(table8b_long, "../output/emp/DF_EMP_TABLE8B.csv", row.names = FALSE)


#### *********************** IMTS table 9 processing *********************************** ####

# Process table8b
table9 <- read_excel("../data/emp_Data.xlsx", sheet = "table9")

# Reshape from wide to long format
table9_long <- table9 %>%
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "INDUSTRY",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table9_long <- table9_long |>
  select(DATAFLOW, FREQ, REF_AREA, INDICATOR, SEX, INDUSTRY, TRANSFORMATION, TIME_PERIOD, OBS_VALUE,
         UNIT_MEASURE, UNIT_MULT, BASE_PER, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

# Output table1 to output csv file
write.csv(table9_long, "../output/emp/DF_EMP_TABLE9.csv", row.names = FALSE)


#### *********************** IMTS table 10a processing *********************************** ####

# Process table8b
table10a <- read_excel("../data/emp_Data.xlsx", sheet = "table10a")

# Reshape from wide to long format
table10a_long <- table10a %>%
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "INDUSTRY",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table10a_long <- table10a_long |>
  select(DATAFLOW, FREQ, REF_AREA, INDICATOR, SEX, INDUSTRY, TRANSFORMATION, TIME_PERIOD, OBS_VALUE,
         UNIT_MEASURE, UNIT_MULT, BASE_PER, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

# Output table1 to output csv file
write.csv(table10a_long, "../output/emp/DF_EMP_TABLE10A.csv", row.names = FALSE)


#### *********************** IMTS table 10b processing *********************************** ####

# Process table10b
table10b <- read_excel("../data/emp_Data.xlsx", sheet = "table10b")

# Reshape from wide to long format
table10b_long <- table10b %>%
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "INDUSTRY",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table10b_long <- table10b_long |>
  select(DATAFLOW, FREQ, REF_AREA, INDICATOR, SEX, INDUSTRY, TRANSFORMATION, TIME_PERIOD, OBS_VALUE,
         UNIT_MEASURE, UNIT_MULT, BASE_PER, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

# Output table10b to output csv file
write.csv(table10b_long, "../output/emp/DF_EMP_TABLE10B.csv", row.names = FALSE)
