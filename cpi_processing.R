#Map working directory
repository <- file.path(dirname(rstudioapi::getSourceEditorContext()$path))
setwd(repository)

#Load required libraries
library(data.table)
library(openxlsx)
library(readxl)
library(dplyr)
library(tidyverse)


#### *********************** IMTS table 1 processing *********************************** ####

table1 <- read_excel("data/imtsData.xlsx", sheet = "table1")

table1 <- table1 %>%
  pivot_longer(
    cols = c(X, M, TB),
    names_to = "INDICATOR",
    values_to = "OBS_VALUE"
  )

table1b <- read_excel("data/imtsData.xlsx", sheet = "table1b")

table1b <- table1b %>%
  pivot_longer(
    cols = c(X, M, TB),
    names_to = "INDICATOR",
    values_to = "OBS_VALUE"
  )

table1_final <- rbind(table1, table1b)

#Output table in csv format
write.csv(table1_final, "output/imts/DF_IMTS_TABLE1.csv", row.names = FALSE)