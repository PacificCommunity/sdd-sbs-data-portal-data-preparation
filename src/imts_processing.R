#Load required libraries
library(openxlsx)
library(readxl)
library(dplyr)
library(tidyverse)

#Map working directory
repository <- file.path(dirname(rstudioapi::getSourceEditorContext()$path))
setwd(repository)

#### *********************** IMTS table 1 processing *********************************** ####

# Process table1a
table1 <- read_excel("../data/imts_Data.xlsx", sheet = "DF_IMTS_TABLE1")

# Reshape from wide to long format
table1_long <- table1 %>%
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "TRADE_FLOW",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table1_final <- table1_long |>
  select(DATAFLOW, FREQ, REF_AREA, TRADE_FLOW, COMMODITY, COUNTERPART_AREA, TRANSFORMATION, TIME_PERIOD,
         OBS_VALUE, UNIT_MEASURE, UNIT_MULT, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

#Output table1 to csv output
write.csv(table1_final, "../output/imts/DF_IMTS_TABLE1.csv", row.names = FALSE)


#### *********************** IMTS table 2 processing *********************************** ####

# Process table2a
table2 <- read_excel("../data/imts_Data.xlsx", sheet = "DF_IMTS_TABLE2")

# Reshape from wide to long format
table2_long <- table2 %>%
  mutate(across(starts_with("HS_"):`_T`, as.numeric)) %>%
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "COMMODITY",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table2_final <- table2_long |>
  select(DATAFLOW, FREQ, REF_AREA, TRADE_FLOW, COMMODITY, COUNTERPART_AREA, TRANSFORMATION, TIME_PERIOD,
         OBS_VALUE, UNIT_MEASURE, UNIT_MULT, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

#Output table2 to csv output
write.csv(table2_final, "../output/imts/DF_IMTS_TABLE2.csv", row.names = FALSE)


#### *********************** IMTS table 3 processing *********************************** ####

# Process table3a
table3 <- read_excel("../data/imts_Data.xlsx", sheet = "DF_IMTS_TABLE3")

# Reshape from wide to long format
table3_long <- table3 %>%
  mutate(across(starts_with("SITC_"):`_T`, as.numeric)) %>%
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "COMMODITY",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table3_final <- table3_long |>
  select(DATAFLOW, FREQ, REF_AREA, TRADE_FLOW, COMMODITY, COUNTERPART_AREA, TRANSFORMATION, TIME_PERIOD,
         OBS_VALUE, UNIT_MEASURE, UNIT_MULT, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

#Output table2 to csv output
write.csv(table3_final, "../output/imts/DF_IMTS_TABLE3.csv", row.names = FALSE)


#### *********************** IMTS table 4 processing *********************************** ####

# Process table4a
table4 <- read_excel("../data/imts_Data.xlsx", sheet = "DF_IMTS_TABLE4")

# Reshape from wide to long format
table4_long <- table4 %>%
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "COUNTERPART_AREA",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table4_final <- table4_long |>
  select(DATAFLOW, FREQ, REF_AREA, TRADE_FLOW, COMMODITY, COUNTERPART_AREA, TRANSFORMATION, TIME_PERIOD,
         OBS_VALUE, UNIT_MEASURE, UNIT_MULT, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

#Output table2 to csv output
write.csv(table4_final, "../output/imts/DF_IMTS_TABLE4.csv", row.names = FALSE)


#### *********************** IMTS table 5 processing *********************************** ####

# Process table5a
table5 <- read_excel("../data/imts_Data.xlsx", sheet = "DF_IMTS_TABLE5")

# Reshape from wide to long format
table5_long <- table5 %>%
  mutate(across(starts_with("HS_"):`_T`, as.numeric)) %>%
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "COMMODITY",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table5_final <- table5_long |>
  select(DATAFLOW, FREQ, REF_AREA, TRADE_FLOW, COMMODITY, COUNTERPART_AREA, TRANSFORMATION, TIME_PERIOD,
         OBS_VALUE, UNIT_MEASURE, UNIT_MULT, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

#Output table2 to csv output
write.csv(table5_final, "../output/imts/DF_IMTS_TABLE5.csv", row.names = FALSE)


#### *********************** IMTS table 6 processing *********************************** ####

# Process table6a
table6 <- read_excel("../data/imts_Data.xlsx", sheet = "DF_IMTS_TABLE6")

# Reshape from wide to long format
table6_long <- table6 %>%
  mutate(across(starts_with("SITC_"):`_T`, as.numeric)) %>%
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "COMMODITY",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table6_final <- table6_long |>
  select(DATAFLOW, FREQ, REF_AREA, TRADE_FLOW, COMMODITY, COUNTERPART_AREA, TRANSFORMATION, TIME_PERIOD,
         OBS_VALUE, UNIT_MEASURE, UNIT_MULT, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

#Output table6 to csv output
write.csv(table6_final, "../output/imts/DF_IMTS_TABLE6.csv", row.names = FALSE)


#### *********************** IMTS table 7 processing *********************************** ####

# Process table7
table7 <- read_excel("../data/imts_Data.xlsx", sheet = "DF_IMTS_TABLE7")

# Reshape from wide to long format
table7_long <- table7 %>%
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "COUNTERPART_AREA",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table7_final <- table7_long |>
  select(DATAFLOW, FREQ, REF_AREA, TRADE_FLOW, COMMODITY, COUNTERPART_AREA, TRANSFORMATION, TIME_PERIOD,
         OBS_VALUE, UNIT_MEASURE, UNIT_MULT, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

#Output table2 to csv output
write.csv(table7_final, "../output/imts/DF_IMTS_TABLE7.csv", row.names = FALSE)
