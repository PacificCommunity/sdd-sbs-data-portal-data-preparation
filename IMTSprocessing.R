#Map working directory
repository <- file.path(dirname(rstudioapi::getSourceEditorContext()$path))
setwd(repository)

#Load required libraries
library(data.table)
library(openxlsx)
library(readxl)
library(dplyr)

#### ********************** IMTS table 2 processing *********************************** #### 

tab2 <- read_excel("data/imtsData.xlsx", sheet = "table2")

colHeader <- colnames(tab2)[3]
selection <- tab2 |> select(HSCode, colHeader)

selection$TIME_PERIOD <- colHeader
colnames(selection)[2] <- "OBS_VALUE"

selection <- merge(selection, hscodes, by = "HSCode")

#Loop to retrieve the rest of the data

index <- 4
total_columns <- ncol(tab2)

while (index <= total_columns) {
  nColhead <- colnames(tab2)[index]
  nextData <- tab2 |> select(HSCode, nColhead)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  nextData <- merge(nextData, hscodes, by = "HSCode")
  selection <- rbind(selection, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selection <- selection |>
  select(-HSCode, -HSchapters) |>
  mutate(DATAFLOW = "SBS:DF_IMTS_TABLE2(1.0)",
         FREQ = ifelse(nchar(Code) == 4, "A", "Q"),
         REF_AREA = "WS",
         TABLE = "IMTS_TABLE2",
         TRADE_FLOW = "X",
         COUNTERPART_AREA = "_T",
         TRANSFORMATION = "N",
         UNIT_MULT = 3,
         UNIT_MEASURE = "WST",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 1
         
  ) |>
  rename(COMMODITY = Code)

#Reorder the columns accordingly

selection <- selection |>
  select(
    DATAFLOW,  
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    TRADE_FLOW,
    COMMODITY,
    COUNTERPART_AREA,
    TRANSFORMATION,
    OBS_VALUE,
    UNIT_MULT,
    UNIT_MEASURE,
    OBS_STATUS,
    COMMENT,
    DECIMAL
  )

tab2b <- read_excel("data/imtsData.xlsx", sheet = "table2b")

colHeader <- colnames(tab2b)[3]
selectionb <- tab2b |> select(HSCode, colHeader)

selectionb$TIME_PERIOD <- colHeader
colnames(selectionb)[2] <- "OBS_VALUE"

selectionb <- merge(selectionb, hscodes, by = "HSCode")

#Loop to retrieve the rest of the data

index <- 4
total_columns <- ncol(tab2b)

while (index <= total_columns) {
  nColhead <- colnames(tab2b)[index]
  nextData <- tab2b |> select(HSCode, nColhead)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  nextData <- merge(nextData, hscodes, by = "HSCode")
  selectionb <- rbind(selectionb, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selectionb <- selectionb |>
  select(-HSCode, -HSchapters) |>
  mutate(DATAFLOW = "SBS:DF_IMTS_TABLE2(1.0)",
         FREQ = "M",
         REF_AREA = "WS",
         TABLE = "IMTS_TABLE2",
         TRADE_FLOW = "X",
         COUNTERPART_AREA = "_T",
         TRANSFORMATION = "G1Y",
         UNIT_MULT = 3,
         UNIT_MEASURE = "PT",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 1
         
  ) |>
  rename(COMMODITY = Code)

#Reorder the columns accordingly

selectionb <- selectionb |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    TRADE_FLOW,
    COMMODITY,
    COUNTERPART_AREA,
    TRANSFORMATION,
    OBS_VALUE,
    UNIT_MULT,
    UNIT_MEASURE,
    OBS_STATUS,
    COMMENT,
    DECIMAL
  )

table2_final <- rbind(selection, selectionb)

#Output table in csv format
write.csv(table2_final, "output/imts/DF_IMTS_TABLE2.csv", row.names = FALSE)


#### ********************** IMTS table 3 processing *********************************** #### 

tab3 <- read_excel("data/imtsData.xlsx", sheet = "table3")

colHeader <- colnames(tab3)[3]
selection <- tab3 |> select(sitcID, colHeader)
selection <- merge(selection, sitc)

selection$TIME_PERIOD <- colHeader
colnames(selection)[2] <- "OBS_VALUE"

#Loop to retrieve the rest of the data

index <- 4
total_columns <- ncol(tab3)

while (index <= total_columns) {
  nColhead <- colnames(tab3)[index]
  nextData <- tab3 |> select(sitcID, nColhead)
  nextData <- merge(nextData, sitc)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selection <- rbind(selection, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selection <- selection |>
  select(-sitcID, -sitcDecs) |>
  mutate(DATAFLOW = "SBS:DF_IMTS_TABLE3(1.0)",
         FREQ = "M",
         REF_AREA = "WS",
         TABLE = "IMTS_TABLE6",
         TRADE_FLOW = "M",
         TRANSFORMATION = "N",
         UNIT_MULT = 3,
         UNIT_MEASURE = "WST",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 1,
         COUNTERPART_AREA = "_T"
         
  ) |>
  rename(COMMODITY = sitcCode,
  )

#Reorder the columns accordingly

selection <- selection |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    TRADE_FLOW,
    COMMODITY,
    COUNTERPART_AREA,
    TRANSFORMATION,
    OBS_VALUE,
    UNIT_MULT,
    UNIT_MEASURE,
    OBS_STATUS,
    COMMENT,
    DECIMAL
  )

#processing table2 b for percentage change 

tab3b <- read_excel("data/imtsData.xlsx", sheet = "table3b")

colHeader <- colnames(tab3b)[3]
selectionb <- tab3b |> select(sitcID, colHeader)
selectionb <- merge(selectionb, sitc)

selectionb$TIME_PERIOD <- colHeader
colnames(selectionb)[2] <- "OBS_VALUE"

#Loop to retrieve the rest of the data

index <- 4
total_columns <- ncol(tab3b)

while (index <= total_columns) {
  nColhead <- colnames(tab3b)[index]
  nextData <- tab3b |> select(sitcID, nColhead)
  nextData <- merge(nextData, sitc)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selectionb <- rbind(selectionb, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selectionb <- selectionb |>
  select(-sitcID, sitcDecs) |>
  mutate(DATAFLOW = "SBS:DF_IMTS_TABLE3(1.0)",
         FREQ = "M",
         REF_AREA = "WS",
         TABLE = "IMTS_TABLE6",
         TRADE_FLOW = "M",
         COUNTERPART_AREA = "_T",
         TRANSFORMATION = "G1Y",
         UNIT_MULT = 3,
         UNIT_MEASURE = "PT",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 1
         
  ) |>
  rename(COMMODITY = sitcCode)

#Reorder the columns accordingly

selectionb <- selectionb |>
  select(
    DATAFLOW,  
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    TRADE_FLOW,
    COMMODITY,
    COUNTERPART_AREA,
    TRANSFORMATION,
    OBS_VALUE,
    UNIT_MULT,
    UNIT_MEASURE,
    OBS_STATUS,
    COMMENT,
    DECIMAL
  )

table3_final <- rbind(selection, selectionb)

#Output table in csv format
write.csv(table3_final, "output/imts/DF_IMTS_TABLE3.csv", row.names = FALSE)


#### ********************** IMTS table 4 processing *********************************** #### 

tab4 <- read_excel("data/imtsData.xlsx", sheet = "table4")

colHeader <- colnames(tab4)[3]
selection <- tab4 |> select(cPartID, colHeader)

selection$TIME_PERIOD <- colHeader
colnames(selection)[2] <- "OBS_VALUE"

index <- 4
total_columns <- ncol(tab4)

while (index <= total_columns) {
  nColhead <- colnames(tab4)[index]
  nextData <- tab4 |> select(cPartID, nColhead)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selection <- rbind(selection, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selection <- selection |>
  mutate(
    DATAFLOW = "SBS:DF_IMTS_TABLE4(1.0)",
    FREQ = "M",
    REF_AREA = "WS",
    TABLE = "IMTS_TABLE4",
    TRADE_FLOW = "X",
    COUNTERPART_AREA = "_T",
    UNIT_MULT = 3,
    UNIT_MEASURE = "WST",
    OBS_STATUS = "",
    COMMENT = "",
    DECIMAL = 1,
    COMMODITY = "_T"
    
  ) |>
  rename(TRANSFORMATION = cPartID,
  )

#Reorder the columns accordingly

selection <- selection |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    TRADE_FLOW,
    COMMODITY,
    COUNTERPART_AREA,
    TRANSFORMATION,
    OBS_VALUE,
    UNIT_MULT,
    UNIT_MEASURE,
    OBS_STATUS,
    COMMENT,
    DECIMAL
  )

#processing table2 b for percentage change 

tab4b <- read_excel("data/imtsData.xlsx", sheet = "table4b")

colHeader <- colnames(tab4b)[3]
selectionb <- tab4b |> select(cPartID, colHeader)

selectionb$TIME_PERIOD <- colHeader
colnames(selectionb)[2] <- "OBS_VALUE"

#Loop to retrieve the rest of the data

index <- 4
total_columns <- ncol(tab4b)

while (index <= total_columns) {
  nColhead <- colnames(tab4b)[index]
  nextData <- tab4b |> select(cPartID, nColhead)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selectionb <- rbind(selectionb, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selectionb <- selectionb |>
  mutate(DATAFLOW = "SBS:DF_IMTS_TABLE4(1.0)",
         FREQ = "M",
         REF_AREA = "WS",
         TABLE = "IMTS_TABLE4",
         TRADE_FLOW = "X",
         COMMODITY = "_T",
         TRANSFORMATION = "G1Y",
         UNIT_MULT = "",
         UNIT_MEASURE = "PT",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 1
         
  ) |>
  rename(COUNTERPART_AREA = cPartID)

#Reorder the columns accordingly

selectionb <- selectionb |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    TRADE_FLOW,
    COMMODITY,
    COUNTERPART_AREA,
    TRANSFORMATION,
    OBS_VALUE,
    UNIT_MULT,
    UNIT_MEASURE,
    OBS_STATUS,
    COMMENT,
    DECIMAL
  )

table4_final <- rbind(selection, selectionb)

#Output table in csv format
write.csv(table4_final, "output/imts/DF_IMTS_TABLE4.csv", row.names = FALSE)


#### ********************** IMTS table 5 processing *********************************** #### 

tab5 <- read_excel("data/imtsData.xlsx", sheet = "table5")

colHeader <- colnames(tab5)[3]
selection <- tab5 |> select(HSCode, colHeader)

selection$TIME_PERIOD <- colHeader
colnames(selection)[2] <- "OBS_VALUE"

#Merge with HSCode listing to get the SDMX HSCodes
selection <- merge(selection, hscodes, by = "HSCode")

#Loop to retrieve the rest of the data

index <- 4
total_columns <- ncol(tab5)

while (index <= total_columns) {
  nColhead <- colnames(tab5)[index]
  nextData <- tab5 |> select(HSCode, nColhead)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  nextData <- merge(nextData, hscodes, by = "HSCode")
  selection <- rbind(selection, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selection <- selection |>
  mutate(
    DATAFLOW = "SBS:DF_IMTS_TABLE5(1.0)",
    FREQ = "M",
    REF_AREA = "WS",
    TABLE = "IMTS_TABLE5",
    TRADE_FLOW = "M",
    COUNTERPART_AREA = "_T",
    UNIT_MULT = 3,
    UNIT_MEASURE = "WST",
    OBS_STATUS = "",
    COMMENT = "",
    DECIMAL = 1,
    TRANSFORMATION = "N"
    
  ) |>
  rename(COMMODITY = Code,
  )

#Reorder the columns accordingly

selection <- selection |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    TRADE_FLOW,
    COMMODITY,
    COUNTERPART_AREA,
    TRANSFORMATION,
    OBS_VALUE,
    UNIT_MULT,
    UNIT_MEASURE,
    OBS_STATUS,
    COMMENT,
    DECIMAL
  )

#processing table2 b for percentage change 

tab5b <- read_excel("data/imtsData.xlsx", sheet = "table5b")

colHeader <- colnames(tab5b)[3]
selectionb <- tab5b |> select(HSCode, colHeader)

selectionb$TIME_PERIOD <- colHeader
colnames(selectionb)[2] <- "OBS_VALUE"

selectionb <- merge(selectionb, hscodes, by = "HSCode")

#Loop to retrieve the rest of the data

index <- 4
total_columns <- ncol(tab5b)

while (index <= total_columns) {
  nColhead <- colnames(tab5b)[index]
  nextData <- tab5b |> select(HSCode, nColhead)
  nextData <- merge(nextData, hscodes)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selectionb <- rbind(selectionb, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selectionb <- selectionb |>
  select(-HSCode, -HSchapters) |>
  mutate(DATAFLOW = "SBS:DF_IMTS_TABLE5(1.0)",
         FREQ = "M",
         REF_AREA = "WS",
         TABLE = "IMTS_TABLE5",
         TRADE_FLOW = "X",
         COUNTERPART_AREA = "_T",
         TRANSFORMATION = "G1Y",
         UNIT_MULT = 3,
         UNIT_MEASURE = "PT",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 1
         
  ) |>
  rename(COMMODITY = Code)

#Reorder the columns accordingly

selectionb <- selectionb |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    TRADE_FLOW,
    COMMODITY,
    COUNTERPART_AREA,
    TRANSFORMATION,
    OBS_VALUE,
    UNIT_MULT,
    UNIT_MEASURE,
    OBS_STATUS,
    COMMENT,
    DECIMAL
  )

table5_final <- rbind(selection, selectionb)

#Output table in csv format
write.csv(table5_final, "output/imts/DF_IMTS_TABLE5.csv", row.names = FALSE)

#### ********************** IMTS table 6 processing *********************************** #### 

tab6 <- read_excel("data/imtsData.xlsx", sheet = "table6")

colHeader <- colnames(tab6)[3]
selection <- tab6 |> select(sitcID, colHeader)
selection <- merge(selection, sitc)

selection$TIME_PERIOD <- colHeader
colnames(selection)[2] <- "OBS_VALUE"

#Loop to retrieve the rest of the data

index <- 4
total_columns <- ncol(tab6)

while (index <= total_columns) {
  nColhead <- colnames(tab6)[index]
  nextData <- tab6 |> select(sitcID, nColhead)
  nextData <- merge(nextData, sitc)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selection <- rbind(selection, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selection <- selection |>
  select(-sitcID, -sitcDecs) |>
  mutate(DATAFLOW = "SBS:DF_IMTS_TABLE6(1.0)",
         FREQ = "M",
         REF_AREA = "WS",
         TABLE = "IMTS_TABLE6",
         TRADE_FLOW = "M",
         TRANSFORMATION = "N",
         UNIT_MULT = 3,
         UNIT_MEASURE = "WST",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 1,
         COUNTERPART_AREA = "_T"
         
  ) |>
  rename(COMMODITY = sitcCode,
  )

#Reorder the columns accordingly

selection <- selection |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    TRADE_FLOW,
    COMMODITY,
    COUNTERPART_AREA,
    TRANSFORMATION,
    OBS_VALUE,
    UNIT_MULT,
    UNIT_MEASURE,
    OBS_STATUS,
    COMMENT,
    DECIMAL
  )

#processing table2 b for percentage change 

tab6b <- read_excel("data/imtsData.xlsx", sheet = "table6b")

colHeader <- colnames(tab6b)[3]
selectionb <- tab6b |> select(sitcID, colHeader)
selectionb <- merge(selectionb, sitc)

selectionb$TIME_PERIOD <- colHeader
colnames(selectionb)[2] <- "OBS_VALUE"

#Loop to retrieve the rest of the data

index <- 4
total_columns <- ncol(tab6b)

while (index <= total_columns) {
  nColhead <- colnames(tab6b)[index]
  nextData <- tab6b |> select(sitcID, nColhead)
  nextData <- merge(nextData, sitc)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selectionb <- rbind(selectionb, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selectionb <- selectionb |>
  select(-sitcID, sitcDecs) |>
  mutate(DATAFLOW = "SBS:DF_IMTS_TABLE6(1.0)",
         FREQ = "M",
         REF_AREA = "WS",
         TABLE = "IMTS_TABLE6",
         TRADE_FLOW = "M",
         COUNTERPART_AREA = "_T",
         TRANSFORMATION = "G1Y",
         UNIT_MULT = 3,
         UNIT_MEASURE = "PT",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 1
         
  ) |>
  rename(COMMODITY = sitcCode)

#Reorder the columns accordingly

selectionb <- selectionb |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    TRADE_FLOW,
    COMMODITY,
    COUNTERPART_AREA,
    TRANSFORMATION,
    OBS_VALUE,
    UNIT_MULT,
    UNIT_MEASURE,
    OBS_STATUS,
    COMMENT,
    DECIMAL
  )

table6_final <- rbind(selection, selectionb)

#Output table in csv format
write.csv(table6_final, "output/imts/DF_IMTS_TABLE6.csv", row.names = FALSE)


#### ********************** IMTS table 7 processing *********************************** #### 

tab7 <- read_excel("data/imtsData.xlsx", sheet = "table7")

colHeader <- colnames(tab7)[3]
selection <- tab7 |> select(cPartID, colHeader)

selection$TIME_PERIOD <- colHeader
colnames(selection)[2] <- "OBS_VALUE"

#Loop to retrieve the rest of the data

index <- 4
total_columns <- ncol(tab7)

while (index <= total_columns) {
  nColhead <- colnames(tab7)[index]
  nextData <- tab7 |> select(cPartID, nColhead)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selection <- rbind(selection, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selection <- selection |>
  mutate(FREQ = "M",
         DATAFLOW = "SBS:DF_IMTS_TABLE7(1.0)",
         REF_AREA = "WS",
         TABLE = "IMTS_TABLE7",
         TRADE_FLOW = "M",
         TRANSFORMATION = "N",
         UNIT_MULT = 3,
         UNIT_MEASURE = "WST",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 1,
         COMMODITY = "_T"
         
  ) |>
  rename(COUNTERPART_AREA = cPartID,
  )

#Reorder the columns accordingly

selection <- selection |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    TRADE_FLOW,
    COMMODITY,
    COUNTERPART_AREA,
    TRANSFORMATION,
    OBS_VALUE,
    UNIT_MULT,
    UNIT_MEASURE,
    OBS_STATUS,
    COMMENT,
    DECIMAL
  )

#processing table2 b for percentage change 

tab7b <- read_excel("data/imtsData.xlsx", sheet = "table7b")

colHeader <- colnames(tab7b)[3]
selectionb <- tab7b |> select(cPartID, colHeader)

selectionb$TIME_PERIOD <- colHeader
colnames(selectionb)[2] <- "OBS_VALUE"

#Loop to retrieve the rest of the data

index <- 4
total_columns <- ncol(tab7b)

while (index <= total_columns) {
  nColhead <- colnames(tab7b)[index]
  nextData <- tab7b |> select(cPartID, nColhead)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selectionb <- rbind(selectionb, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selectionb <- selectionb |>
  mutate(DATAFLOW = "SBS:DF_IMTS_TABLE7(1.0)",
         FREQ = "M",
         REF_AREA = "WS",
         TABLE = "IMTS_TABLE7",
         TRADE_FLOW = "M",
         COMMODITY = "_T",
         TRANSFORMATION = "G1Y",
         UNIT_MULT = 3,
         UNIT_MEASURE = "PT",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 1
         
  ) |>
  rename(COUNTERPART_AREA = cPartID)

#Reorder the columns accordingly

selectionb <- selectionb |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    TRADE_FLOW,
    COMMODITY,
    COUNTERPART_AREA,
    TRANSFORMATION,
    OBS_VALUE,
    UNIT_MULT,
    UNIT_MEASURE,
    OBS_STATUS,
    COMMENT,
    DECIMAL
  )

table7_final <- rbind(selection, selectionb)

#Output table in csv format
write.csv(table7_final, "output/imts/DF_IMTS_TABLE7.csv", row.names = FALSE)
