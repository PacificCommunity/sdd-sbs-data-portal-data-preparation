#Map working directory
repository <- file.path(dirname(rstudioapi::getSourceEditorContext()$path))
setwd(repository)

#Load required libraries
#library(data.table)
library(openxlsx)
library(readxl)
library(dplyr)
library(tidyverse)

#### *********************** National Accounts table 1 processing *********************************** ####

table1 <- read_excel("../data/naData.xlsx", sheet = "table1")

table1_long <- table1 %>%
  pivot_longer(
    cols =  -c(DATAFLOW:REPYEARSTART),
    names_to = "TIME_PERIOD",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table1_long <- table1_long |>
  select(DATAFLOW, FREQ, REF_AREA, REF_PERIOD_DETAIL, INDICATOR, INDUSTRY, TIME_PERIOD,
         OBS_VALUE, UNIT_MEASURE, UNIT_MULT, BASE_PER, OBS_STATUS, COMMENT, DECIMALS, REPYEARSTART) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

#Output table in csv format
write.csv(table1_long, "../output/na/DF_NA_A.csv", row.names = FALSE)


#### *********************** National Accounts table 2 processing *********************************** ####

table2 <- read_excel("../data/naData.xlsx", sheet = "table2")

table2_long <- table2 %>%
  pivot_longer(
    cols = -c(DATAFLOW:REPYEARSTART),
    names_to = "TIME_PERIOD",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table2_long <- table2_long |>
  select(DATAFLOW, FREQ, REF_AREA, REF_PERIOD_DETAIL, INDICATOR, INDUSTRY, TIME_PERIOD,
         OBS_VALUE, UNIT_MEASURE, UNIT_MULT, BASE_PER, OBS_STATUS, COMMENT, DECIMALS, REPYEARSTART) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

#Output table in csv format
write.csv(table2_long, "../output/na/DF_NA_Q.csv", row.names = FALSE)


#### *********************** National Accounts table 3 processing *********************************** ####

table3 <- read_excel("../data/naData.xlsx", sheet = "table3")

table3_long <- table3 %>%
  pivot_longer(
    cols = -c(DATAFLOW:REPYEARSTART),         # Match year columns (2013, 2014, ..., 2023)
    names_to = "TIME_PERIOD",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table3_long <- table3_long |>
  select(DATAFLOW, FREQ, REF_AREA, REF_PERIOD_DETAIL, INDICATOR, INDUSTRY, TIME_PERIOD,
         OBS_VALUE, UNIT_MEASURE, UNIT_MULT, BASE_PER, OBS_STATUS, COMMENT, DECIMALS, REPYEARSTART) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

#Output table in csv format
write.csv(table3_long, "../output/na/DF_NA_F07.csv", row.names = FALSE)
