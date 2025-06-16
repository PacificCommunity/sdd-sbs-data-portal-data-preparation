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

table1 <- read_excel("data/naData.xlsx", sheet = "table1")

table1_long <- table1 %>%
  pivot_longer(
    cols = c("2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023"),
    names_to = "TIME_PERIOD",
    values_to = "OBS_VALUE"
  )


#Output table in csv format
write.csv(table1_long, "output/na/DF_NA_TABLE1.csv", row.names = FALSE)
