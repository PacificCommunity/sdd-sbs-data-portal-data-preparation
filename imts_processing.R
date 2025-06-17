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

# Process table1a
table1a <- read_excel("data/imts_Data.xlsx", sheet = "table1a")

# Reshape from wide to long format
table1a_long <- table1a %>%
  pivot_longer(
    cols = c(X, M, B),
    names_to = "TRADE_FLOW",
    values_to = "OBS_VALUE"
  )

# Process table1b
table1b <- read_excel("data/imts_Data.xlsx", sheet = "table1b")

# Reshape from wide to long format
table1b_long <- table1b %>%
  pivot_longer(
    cols = c(X, M, B),
    names_to = "TRADE_FLOW",
    values_to = "OBS_VALUE"
  )

# Combining the 2 tables together
table1_final <- rbind(table1a_long, table1b_long)

# Re-order the columns in the proper order
table1_final <- table1_final |>
  select(DATAFLOW, FREQ, REF_AREA, TRADE_FLOW, COMMODITY, COUNTERPART_AREA, TRANSFORMATION, TIME_PERIOD,
         OBS_VALUE, UNIT_MEASURE, UNIT_MULT, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

#Output table1 to csv output
write.csv(table1_final, "output/imts/DF_IMTS_TABLE1.csv")


#### *********************** IMTS table 2 processing *********************************** ####

# Process table2a
table2a <- read_excel("data/imts_Data.xlsx", sheet = "table2a")

# Reshape from wide to long format
table2a_long <- table2a %>%
  mutate(across(starts_with("HS_"):`_T`, as.numeric)) %>%
  pivot_longer(
    cols = starts_with("HS_"):`_T`,
    names_to = "COMMODITY",
    values_to = "OBS_VALUE"
  )

# Process table2b
table2b <- read_excel("data/imts_Data.xlsx", sheet = "table2b")

# Reshape from wide to long format
table2b_long <- table2b |>
  mutate(across(starts_with("HS_"):`_T`, as.numeric)) %>%
  pivot_longer(
    cols = starts_with("HS_"):`_T`,
    names_to = "COMMODITY",
    values_to = "OBS_VALUE"
  )

# Combine the two tables

table2_final <- rbind(table2a_long, table2b_long)

# Re-order the columns in the proper order
table2_final <- table2_final |>
  select(DATAFLOW, FREQ, REF_AREA, TRADE_FLOW, COMMODITY, COUNTERPART_AREA, TRANSFORMATION, TIME_PERIOD,
         OBS_VALUE, UNIT_MEASURE, UNIT_MULT, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

#Output table2 to csv output
write.csv(table2_final, "output/imts/DF_IMTS_TABLE2.csv")


#### *********************** IMTS table 3 processing *********************************** ####

# Process table3a
table3a <- read_excel("data/imts_Data.xlsx", sheet = "table3a")

# Reshape from wide to long format
table3a_long <- table3a %>%
  mutate(across(starts_with("SITC_"):`_T`, as.numeric)) %>%
  pivot_longer(
    cols = starts_with("SITC_"):`_T`,
    names_to = "COMMODITY",
    values_to = "OBS_VALUE"
  )

# Process table3b
table3b <- read_excel("data/imts_Data.xlsx", sheet = "table3b")

# Reshape from wide to long format
table3b_long <- table3b |>
  mutate(across(starts_with("SITC_"):`_T`, as.numeric)) %>%
  pivot_longer(
    cols = starts_with("SITC_"):`_T`,
    names_to = "COMMODITY",
    values_to = "OBS_VALUE"
  )

# Combine the two tables
table3_final <- rbind(table3a_long, table3b_long)

# Re-order the columns in the proper order
table3_final <- table3_final |>
  select(DATAFLOW, FREQ, REF_AREA, TRADE_FLOW, COMMODITY, COUNTERPART_AREA, TRANSFORMATION, TIME_PERIOD,
         OBS_VALUE, UNIT_MEASURE, UNIT_MULT, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

#Output table2 to csv output
write.csv(table3_final, "output/imts/DF_IMTS_TABLE3.csv")


#### *********************** IMTS table 4 processing *********************************** ####

# Process table4a
table4a <- read_excel("data/imts_Data.xlsx", sheet = "table4a")

# Reshape from wide to long format
table4a_long <- table4a %>%
  pivot_longer(
    cols = AFR:`_T`,
    names_to = "COUNTERPART_AREA",
    values_to = "OBS_VALUE"
  )

# Process table4b
table4b <- read_excel("data/imts_Data.xlsx", sheet = "table4b")

# Reshape from wide to long format
table4b_long <- table4b %>%
  pivot_longer(
    cols = AFR:`_T`,
    names_to = "COUNTERPART_AREA",
    values_to = "OBS_VALUE"
  )

# Combine the two tables
table4_final <- rbind(table4a_long, table4b_long)

# Re-order the columns in the proper order
table4_final <- table4_final |>
  select(DATAFLOW, FREQ, REF_AREA, TRADE_FLOW, COMMODITY, COUNTERPART_AREA, TRANSFORMATION, TIME_PERIOD,
         OBS_VALUE, UNIT_MEASURE, UNIT_MULT, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

#Output table2 to csv output
write.csv(table4_final, "output/imts/DF_IMTS_TABLE4.csv")


#### *********************** IMTS table 5 processing *********************************** ####

# Process table5a
table5a <- read_excel("data/imts_Data.xlsx", sheet = "table5a")

# Reshape from wide to long format
table5a_long <- table5a %>%
  mutate(across(starts_with("HS_"):`_T`, as.numeric)) %>%
  pivot_longer(
    cols = starts_with("HS_"):`_T`,
    names_to = "COMMODITY",
    values_to = "OBS_VALUE"
  )

# Process table5b
table5b <- read_excel("data/imts_Data.xlsx", sheet = "table5b")

# Reshape from wide to long format
table5b_long <- table5b |>
  mutate(across(starts_with("HS_"):`_T`, as.numeric)) %>%
  pivot_longer(
    cols = starts_with("HS_"):`_T`,
    names_to = "COMMODITY",
    values_to = "OBS_VALUE"
  )

# Combine the two tables

table5_final <- rbind(table5a_long, table5b_long)

# Re-order the columns in the proper order
table5_final <- table5_final |>
  select(DATAFLOW, FREQ, REF_AREA, TRADE_FLOW, COMMODITY, COUNTERPART_AREA, TRANSFORMATION, TIME_PERIOD,
         OBS_VALUE, UNIT_MEASURE, UNIT_MULT, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

#Output table2 to csv output
write.csv(table5_final, "output/imts/DF_IMTS_TABLE5.csv")


#### *********************** IMTS table 6 processing *********************************** ####

# Process table6a
table6a <- read_excel("data/imts_Data.xlsx", sheet = "table6a")

# Reshape from wide to long format
table6a_long <- table6a %>%
  mutate(across(starts_with("SITC_"):`_T`, as.numeric)) %>%
  pivot_longer(
    cols = starts_with("SITC_"):`_T`,
    names_to = "COMMODITY",
    values_to = "OBS_VALUE"
  )

# Process table6b
table6b <- read_excel("data/imts_Data.xlsx", sheet = "table6b")

# Reshape from wide to long format
table6b_long <- table6b |>
  mutate(across(starts_with("SITC_"):`_T`, as.numeric)) %>%
  pivot_longer(
    cols = starts_with("SITC_"):`_T`,
    names_to = "COMMODITY",
    values_to = "OBS_VALUE"
  )

# Combine the two tables
table6_final <- rbind(table6a_long, table6b_long)

# Re-order the columns in the proper order
table6_final <- table6_final |>
  select(DATAFLOW, FREQ, REF_AREA, TRADE_FLOW, COMMODITY, COUNTERPART_AREA, TRANSFORMATION, TIME_PERIOD,
         OBS_VALUE, UNIT_MEASURE, UNIT_MULT, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

#Output table6 to csv output
write.csv(table6_final, "output/imts/DF_IMTS_TABLE6.csv")


#### *********************** IMTS table 7 processing *********************************** ####

# Process table7a
table7a <- read_excel("data/imts_Data.xlsx", sheet = "table7a")

# Reshape from wide to long format
table7a_long <- table7a %>%
  pivot_longer(
    cols = AFR:`_T`,
    names_to = "COUNTERPART_AREA",
    values_to = "OBS_VALUE"
  )

# Process table7b
table7b <- read_excel("data/imts_Data.xlsx", sheet = "table7b")

# Reshape from wide to long format
table7b_long <- table7b %>%
  pivot_longer(
    cols = AFR:`_T`,
    names_to = "COUNTERPART_AREA",
    values_to = "OBS_VALUE"
  )

# Combine the two tables
table7_final <- rbind(table7a_long, table7b_long)

# Re-order the columns in the proper order
table7_final <- table7_final |>
  select(DATAFLOW, FREQ, REF_AREA, TRADE_FLOW, COMMODITY, COUNTERPART_AREA, TRANSFORMATION, TIME_PERIOD,
         OBS_VALUE, UNIT_MEASURE, UNIT_MULT, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

#Output table2 to csv output
write.csv(table7_final, "output/imts/DF_IMTS_TABLE7.csv")

