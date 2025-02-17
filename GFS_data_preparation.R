#load libraries
library(data.table)
library(dplyr)
library(readxl)

#Directory path
repository <- file.path(dirname(rstudioapi::getSourceEditorContext()$path))
setwd(repository)

#### ********************* Table 2 processing ******************************** ####

tab2 <- read_excel("data/gfsData.xlsx", sheet = "table2")

colHeader <- colnames(tab2)[3]
selection <- tab2 |> select(Code, colHeader)

selection$TIME_PERIOD <- colHeader
colnames(selection)[2] <- "OBS_VALUE"

index <- 4
total_columns <- ncol(tab2)

while (index <= total_columns) {
  nColhead <- colnames(tab2)[index]
  nextData <- tab2 |> select(Code, nColhead)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selection <- rbind(selection, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selection <- selection |>
  mutate(DATAFLOW = "SBS:DF_GFS_TABLE2(1.0)",
         FREQ = ifelse(nchar(TIME_PERIOD)==4,"A","Q"),
         REF_AREA = "WS",
         TABLE = "GFS_TABLE2",
         UNIT_MULT = 3,
         UNIT_MEASURE = "WST",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 1,
         REPYEARSTART = ifelse(nchar(TIME_PERIOD)==4,"--07-01","")
         
  ) |>
  rename(STO = Code)

#Reorder the columns accordingly

selection <- selection |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    STO,
    OBS_VALUE,
    UNIT_MEASURE,
    UNIT_MULT,
    OBS_STATUS,
    COMMENT,
    DECIMAL,
    REPYEARSTART
  )

#Write table to output csv file
write.csv(selection, "output/gfs/DF_GFS_TABLE2.csv", row.names = FALSE)

#### ********************** Table 3 processing ********************************* ####

tab3 <- read_excel("data/gfsData.xlsx", sheet = "table3")

colHeader <- colnames(tab3)[3]
selection <- tab3 |> select(Code, colHeader)

selection$TIME_PERIOD <- colHeader
colnames(selection)[2] <- "OBS_VALUE"

index <- 4
total_columns <- ncol(tab3)

while (index <= total_columns) {
  nColhead <- colnames(tab3)[index]
  nextData <- tab3 |> select(Code, nColhead)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selection <- rbind(selection, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selection <- selection |>
  mutate(DATAFLOW = "SBS:DF_GFS_TABLE3(1.0)",
         FREQ = ifelse(nchar(TIME_PERIOD)==4,"A","Q"),
         REF_AREA = "WS",
         TABLE = "GFS_TABLE3",
         UNIT_MULT = 3,
         UNIT_MEASURE = "WST",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 1,
         REPYEARSTART = ifelse(nchar(TIME_PERIOD)==4,"--07-01","")
         
  ) |>
  rename(STO = Code)

#Reorder the columns accordingly

selection <- selection |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    STO,
    OBS_VALUE,
    UNIT_MEASURE,
    UNIT_MULT,
    OBS_STATUS,
    COMMENT,
    DECIMAL,
    REPYEARSTART
  )

#Write table to output csv file
write.csv(selection, "output/gfs/DF_GFS_TABLE3.csv", row.names = FALSE)

#### ******************** table 4 processing ***************************** ####

tab4 <- read_excel("data/gfsData.xlsx", sheet = "table4")

colHeader <- colnames(tab4)[3]
selection <- tab4 |> select(Code, colHeader)

selection$TIME_PERIOD <- colHeader
colnames(selection)[2] <- "OBS_VALUE"

index <- 4
total_columns <- ncol(tab4)

while (index <= total_columns) {
  nColhead <- colnames(tab4)[index]
  nextData <- tab4 |> select(Code, nColhead)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selection <- rbind(selection, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selection <- selection |>
  mutate(DATAFLOW = "SBS:DF_GFS_TABLE4(1.0)",
         FREQ = ifelse(nchar(TIME_PERIOD)==4,"A","Q"),
         REF_AREA = "WS",
         TABLE = "GFS_TABLE4",
         UNIT_MULT = 3,
         UNIT_MEASURE = "WST",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 1,
         REPYEARSTART = ifelse(nchar(TIME_PERIOD)==4,"--07-01","")
         
  ) |>
  rename(STO = Code)

#Reorder the columns accordingly

selection <- selection |>
  select(
    DATAFLOW,  
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    STO,
    OBS_VALUE,
    UNIT_MEASURE,
    UNIT_MULT,
    OBS_STATUS,
    COMMENT,
    DECIMAL,
    REPYEARSTART
  )

#Write table to output csv file
write.csv(selection, "output/gfs/DF_GFS_TABLE4.csv", row.names = FALSE)

#### ******************** Table 5 processing **************************** ####

tab5 <- read_excel("data/gfsData.xlsx", sheet = "table5")

colHeader <- colnames(tab5)[3]
selection <- tab5 |> select(Code, colHeader)

selection$TIME_PERIOD <- colHeader
colnames(selection)[2] <- "OBS_VALUE"

index <- 4
total_columns <- ncol(tab5)

while (index <= total_columns) {
  nColhead <- colnames(tab5)[index]
  nextData <- tab5 |> select(Code, nColhead)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selection <- rbind(selection, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selection <- selection |>
  mutate(DATAFLOW = "SBS:DF_GFS_TABLE5(1.0)",
         FREQ = ifelse(nchar(TIME_PERIOD)==4,"A","Q"),
         REF_AREA = "WS",
         TABLE = "GFS_TABLE5",
         UNIT_MULT = 3,
         UNIT_MEASURE = "WST",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 1,
         REPYEARSTART = ifelse(nchar(TIME_PERIOD)==4,"--07-01","")
         
  ) |>
  rename(STO = Code)

#Reorder the columns accordingly

selection <- selection |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    STO,
    OBS_VALUE,
    UNIT_MEASURE,
    UNIT_MULT,
    OBS_STATUS,
    COMMENT,
    DECIMAL,
    REPYEARSTART
  )

#Write table to output csv file
write.csv(selection, "output/gfs/DF_GFS_TABLE5.csv", row.names = FALSE)


#### ******************** Table 6 processing **************************** ####

tab6 <- read_excel("data/gfsData.xlsx", sheet = "table6")

colHeader <- colnames(tab6)[3]
selection <- tab6 |> select(Code, colHeader)

selection$TIME_PERIOD <- colHeader
colnames(selection)[2] <- "OBS_VALUE"

index <- 4
total_columns <- ncol(tab6)

while (index <= total_columns) {
  nColhead <- colnames(tab6)[index]
  nextData <- tab6 |> select(Code, nColhead)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selection <- rbind(selection, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selection <- selection |>
  mutate(DATAFLOW = "SBS:DF_GFS_TABLE6(1.0)",
         FREQ = ifelse(nchar(TIME_PERIOD)==4,"A","Q"),
         REF_AREA = "WS",
         TABLE = "GFS_TABLE6",
         UNIT_MULT = 3,
         UNIT_MEASURE = ifelse((Code == "TXGDP" | Code == "TGGDP") & !is.na(OBS_VALUE), "PT", "WST"),
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 1,
         REPYEARSTART = ifelse(nchar(TIME_PERIOD)==4,"--07-01","")
         
  ) |>
  rename(STO = Code)

#Reorder the columns accordingly

selection <- selection |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    STO,
    OBS_VALUE,
    UNIT_MEASURE,
    UNIT_MULT,
    OBS_STATUS,
    COMMENT,
    DECIMAL,
    REPYEARSTART
  )

#Write table to output csv file
write.csv(selection, "output/gfs/DF_GFS_TABLE6.csv", row.names = FALSE)