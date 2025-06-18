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

table1 <- read_excel("data/cpiData.xlsx", sheet = "table1")

table1_long <- table1 %>%
  pivot_longer(
    cols = -c(DATAFLOW:DECIMALS),
    names_to = "ITEM",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table1_long <- table1_long |>
  select(DATAFLOW, FREQ, REF_AREA, INDICATOR, ITEM, TRANSFORMATION, TIME_PERIOD,
         OBS_VALUE, UNIT_MEASURE, BASE_PER, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

#Output table in csv format
write.csv(table1_long, "output/cpi/DF_CPI_TABLE1.csv", row.names = FALSE)


#### *********************** IMTS table 2 processing *********************************** ####

table2 <- read_excel("data/cpiData.xlsx", sheet = "table2")

table2_long <- table2 %>%
  pivot_longer(
    cols = -c(DATAFLOW:DECIMALS),
    names_to = "ITEM",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table2_long <- table2_long |>
  select(DATAFLOW, FREQ, REF_AREA, INDICATOR, ITEM, TRANSFORMATION, TIME_PERIOD,
         OBS_VALUE, UNIT_MEASURE, BASE_PER, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

#Output table in csv format
write.csv(table2_long, "output/cpi/DF_CPI_TABLE2.csv", row.names = FALSE)


#### *********************** IMTS table 3 processing *********************************** ####

table3 <- read_excel("data/cpiData.xlsx", sheet = "table3")

table3_long <- table3 %>%
  pivot_longer(
    cols = -c(DATAFLOW:DECIMALS),
    names_to = "ITEM",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table3_long <- table3_long |>
  select(DATAFLOW, FREQ, REF_AREA, INDICATOR, ITEM, TRANSFORMATION, TIME_PERIOD,
         OBS_VALUE, UNIT_MEASURE, BASE_PER, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

#Output table in csv format
write.csv(table3_long, "output/cpi/DF_CPI_TABLE3.csv", row.names = FALSE)


#### *********************** IMTS table 4 processing *********************************** ####

table4 <- read_excel("data/cpiData.xlsx", sheet = "table4")

table4_long <- table4 %>%
  pivot_longer(
    cols = -c(DATAFLOW:DECIMALS),
    names_to = "ITEM",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table4_long <- table4_long |>
  select(DATAFLOW, FREQ, REF_AREA, INDICATOR, ITEM, TRANSFORMATION, TIME_PERIOD,
         OBS_VALUE, UNIT_MEASURE, BASE_PER, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

#Output table in csv format
write.csv(table4_long, "output/cpi/DF_CPI_TABLE4.csv", row.names = FALSE)


#### *********************** IMTS table 5 processing *********************************** ####

table5 <- read_excel("data/cpiData.xlsx", sheet = "table5")

table5_long <- table5 %>%
  pivot_longer(
    cols = -c(DATAFLOW:DECIMALS),
    names_to = "ITEM",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table5_long <- table5_long |>
  select(DATAFLOW, FREQ, REF_AREA, INDICATOR, ITEM, TRANSFORMATION, TIME_PERIOD,
         OBS_VALUE, UNIT_MEASURE, BASE_PER, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

#Output table in csv format
write.csv(table5_long, "output/cpi/DF_CPI_TABLE5.csv", row.names = FALSE)


#### *********************** IMTS table 6 processing *********************************** ####

table6 <- read_excel("data/cpiData.xlsx", sheet = "table6")

table6_long <- table6 %>%
  pivot_longer(
    cols = -c(DATAFLOW:DECIMALS),
    names_to = "ITEM",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table6_long <- table6_long |>
  select(DATAFLOW, FREQ, REF_AREA, INDICATOR, ITEM, TRANSFORMATION, TIME_PERIOD,
         OBS_VALUE, UNIT_MEASURE, BASE_PER, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

#Output table in csv format
write.csv(table6_long, "output/cpi/DF_CPI_TABLE6.csv", row.names = FALSE)


#### *********************** IMTS table 7 processing *********************************** ####

table7 <- read_excel("data/cpiData.xlsx", sheet = "table7")

table7_long <- table7 %>%
  pivot_longer(
    cols = -c(DATAFLOW:DECIMALS),
    names_to = "ITEM",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table7_long <- table7_long |>
  select(DATAFLOW, FREQ, REF_AREA, INDICATOR, ITEM, TRANSFORMATION, TIME_PERIOD,
         OBS_VALUE, UNIT_MEASURE, BASE_PER, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

#Output table in csv format
write.csv(table7_long, "output/cpi/DF_CPI_TABLE7.csv", row.names = FALSE)


#### *********************** IMTS table 8 processing *********************************** ####

table8 <- read_excel("data/cpiData.xlsx", sheet = "table8")

table8_long <- table8 %>%
  pivot_longer(
    cols = -c(DATAFLOW:DECIMALS),
    names_to = "ITEM",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table8_long <- table8_long |>
  select(DATAFLOW, FREQ, REF_AREA, INDICATOR, ITEM, TRANSFORMATION, TIME_PERIOD,
         OBS_VALUE, UNIT_MEASURE, BASE_PER, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

#Output table in csv format
write.csv(table8_long, "output/cpi/DF_CPI_TABLE8.csv", row.names = FALSE)
