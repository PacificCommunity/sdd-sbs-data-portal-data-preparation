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

table1a_long <- table1a %>%
  pivot_longer(
    cols = `1`:GDP,
    names_to = "STO",
    values_to = "OBS_VALUE"
  )

# Process table1a
table1b <- read_excel("data/gfs_Data.xlsx", sheet = "table1b")

table1b_long <- table1b %>%
  pivot_longer(
    cols = NOB2GDP:OTH2EXP,
    names_to = "STO",
    values_to = "OBS_VALUE"
  )
# Combine the two tables together
table1_final <- rbind(table1a_long, table1b_long)

# Re-order the columns in the proper order
table1_final <- table1_final |>
  select(DATAFLOW, FREQ, REF_AREA, INDICATOR, ITEM, TRANSFORMATION, TIME_PERIOD,
         OBS_VALUE, UNIT_MEASURE, BASE_PER, OBS_STATUS, COMMENT, DECIMALS) |>
  mutate(across(everything(), ~replace(., is.na(.), "")))


#Output table in csv format
write.csv(table1_long, "output/cpi/DF_CPI_TABLE1.csv", row.names = FALSE)


