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
table1a <- read_excel("data/gfs_Data.xlsx", sheet = "table1a")

table1a_long <- table1a |>
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "STO",
    values_to = "OBS_VALUE"
  )

# Process table1a
table1b <- read_excel("data/gfs_Data.xlsx", sheet = "table1b")

table1b_long <- table1b |>
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "STO",
    values_to = "OBS_VALUE"
  )
# Combine the two tables together
table1_final <- rbind(table1a_long, table1b_long)

# Re-order the columns in the proper order
table1_final <- table1_final |>
  select(DATAFLOW, FREQ, REF_AREA, STO, TIME_PERIOD, OBS_VALUE, UNIT_MEASURE, UNIT_MULT, OBS_STATUS, COMMENT, DECIMALS, REPYEARSTART) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

#Output table in csv format
write.csv(table1_long, "output/gfs/DF_GFS_TABLE1.csv", row.names = FALSE)


#### *********************** IMTS table 2 processing *********************************** ####
# Process table2
table2 <- read_excel("data/gfs_Data.xlsx", sheet = "table2")

table2_long <- table2 |>
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "STO",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table2_long <- table2_long |>
  select(DATAFLOW, FREQ, REF_AREA, STO, TIME_PERIOD, OBS_VALUE, UNIT_MEASURE, UNIT_MULT, OBS_STATUS, COMMENT, DECIMALS, REPYEARSTART) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))


#Output table in csv format
write.csv(table1_long, "output/gfs/DF_GFS_TABLE2.csv", row.names = FALSE)


#### *********************** IMTS table 3 processing *********************************** ####
# Process table3
table3 <- read_excel("data/gfs_Data.xlsx", sheet = "table3")

table3_long <- table3 |>
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "STO",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table3_long <- table3_long |>
  select(DATAFLOW, FREQ, REF_AREA, STO, TIME_PERIOD, OBS_VALUE, UNIT_MEASURE, UNIT_MULT, OBS_STATUS, COMMENT, DECIMALS, REPYEARSTART) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))


#Output table in csv format
write.csv(table3_long, "output/gfs/DF_GFS_TABLE3.csv", row.names = FALSE)


#### *********************** IMTS table 4 processing *********************************** ####
# Process table4
table4 <- read_excel("data/gfs_Data.xlsx", sheet = "table4")

table4_long <- table4 |>
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "STO",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table4_long <- table4_long |>
  select(DATAFLOW, FREQ, REF_AREA, STO, TIME_PERIOD, OBS_VALUE, UNIT_MEASURE, UNIT_MULT, OBS_STATUS, COMMENT, DECIMALS, REPYEARSTART) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))


#Output table in csv format
write.csv(table4_long, "output/gfs/DF_GFS_TABLE4.csv", row.names = FALSE)


#### *********************** IMTS table 5 processing *********************************** ####
# Process table5
table5 <- read_excel("data/gfs_Data.xlsx", sheet = "table5")

table5_long <- table5 |>
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "STO",
    values_to = "OBS_VALUE"
  )

# Re-order the columns in the proper order
table5_long <- table5_long |>
  select(DATAFLOW, FREQ, REF_AREA, STO, TIME_PERIOD, OBS_VALUE, UNIT_MEASURE, UNIT_MULT, OBS_STATUS, COMMENT, DECIMALS, REPYEARSTART) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))


#Output table in csv format
write.csv(table4_long, "output/gfs/DF_GFS_TABLE5.csv", row.names = FALSE)


#### *********************** IMTS table 6 processing *********************************** ####
# Process table6a
table6a <- read_excel("data/gfs_Data.xlsx", sheet = "table6a")

table6a_long <- table6a |>
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "STO",
    values_to = "OBS_VALUE"
  )

table6b <- read_excel("data/gfs_Data.xlsx", sheet = "table6b")

table6b_long <- table6b |>
  pivot_longer(
    cols = -c(DATAFLOW:TIME_PERIOD),
    names_to = "STO",
    values_to = "OBS_VALUE"
  )

# Combine the tables
table6_final <- rbind(table6a_long, table6b_long)

# Re-order the columns in the proper order
table6_final <- table6_final |>
  select(DATAFLOW, FREQ, REF_AREA, STO, TIME_PERIOD, OBS_VALUE, UNIT_MEASURE, UNIT_MULT, OBS_STATUS, COMMENT, DECIMALS, REPYEARSTART) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))

#Output table in csv format
write.csv(table6_final, "output/gfs/DF_GFS_TABLE6.csv", row.names = FALSE)




