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
    cols = c("Total", paste0("ITEM_", sprintf("%02d", 1:12))),
    names_to = "ITEM",
    values_to = "OBS_VALUE"
  )

table1_long <- table1_long |>
  mutate(ITEM = ifelse(ITEM == "Total", "_T", ITEM))

#Output table in csv format
write.csv(table1_long, "output/cpi/DF_CPI_TABLE1.csv", row.names = FALSE)


#### *********************** IMTS table 2 processing *********************************** ####

table2 <- read_excel("data/cpiData.xlsx", sheet = "table2")

table2_long <- table2 %>%
  pivot_longer(
    cols = c("Total", paste0("ITEM_", sprintf("%02d", 1:12)[-2])),
    names_to = "ITEM",
    values_to = "OBS_VALUE"
  )

table2_long <- table2_long |>
  mutate(ITEM = ifelse(ITEM == "Total", "_T", ITEM))

#Output table in csv format
write.csv(table2_long, "output/cpi/DF_CPI_TABLE2.csv", row.names = FALSE)


#### *********************** IMTS table 3 processing *********************************** ####

table3 <- read_excel("data/cpiData.xlsx", sheet = "table3")

table3_long <- table3 %>%
  pivot_longer(
    cols = starts_with("ITEM_"),
    names_to = "ITEM",
    values_to = "OBS_VALUE"
  )

#Output table in csv format
write.csv(table3_long, "output/cpi/DF_CPI_TABLE3.csv", row.names = FALSE)


#### *********************** IMTS table 4 processing *********************************** ####

table4 <- read_excel("data/cpiData.xlsx", sheet = "table4")

table4_long <- table4 %>%
  pivot_longer(
    cols = c("Total", paste0("ITEM_", sprintf("%02d", 1:12))),
    names_to = "ITEM",
    values_to = "OBS_VALUE"
  )

table4_long <- table4_long |>
  mutate(ITEM = ifelse(ITEM == "Total", "_T", ITEM))

#Output table in csv format
write.csv(table4_long, "output/cpi/DF_CPI_TABLE1.csv", row.names = FALSE)



