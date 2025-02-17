#load libraries
library(data.table)
library(dplyr)
library(readxl)

#Directory path
repository <- file.path(dirname(rstudioapi::getSourceEditorContext()$path))
setwd(repository)

#### ********************* Employment index processing ******************************** ####

empIndex <- read_excel("data/empData.xlsx", sheet = "empIndex")

colHeader <- colnames(empIndex)[3]
selection <- empIndex |> select(Code, colHeader)

selection$TIME_PERIOD <- colHeader
colnames(selection)[2] <- "OBS_VALUE"

index <- 4
total_columns <- ncol(empIndex)

while (index <= total_columns) {
  nColhead <- colnames(empIndex)[index]
  nextData <- empIndex |> select(Code, nColhead)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selection <- rbind(selection, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selection <- selection |>
  mutate(DATAFLOW = "SBS:DF_EMP_TABLE1(1.0)",
         FREQ = ifelse(nchar(TIME_PERIOD)==4,"A","Q"),
         REF_AREA = "WS",
         SEX = "_T",
         TRANSFORMATION = "N",
         INDICATOR = "EMPIDX",
         TABLE = "LMI_TABLE1",
         UNIT_MULT = "",
         UNIT_MEASURE = "INDEX",
         BASE_YEAR = "2013",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 1,
         OBS_VALUE = OBS_VALUE
         
  ) |>
  rename(INDUSTRY = Code)

#Reorder the columns accordingly

selection <- selection |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    INDICATOR,
    INDUSTRY,
    SEX,
    TRANSFORMATION,
    OBS_VALUE,
    UNIT_MEASURE,
    UNIT_MULT,
    OBS_STATUS,
    COMMENT,
    BASE_YEAR,
    DECIMAL,
  )

#Write table to output csv file
write.csv(selection, "output/emp/DF_EMP_TABLE1.csv", row.names = FALSE)

#### ********************** Wage index processing ********************************* ####

wagIndex <- read_excel("data/empData.xlsx", sheet = "wagIndex")

colHeader <- colnames(wagIndex)[3]
selection <- wagIndex |> select(Code, colHeader)

selection$TIME_PERIOD <- colHeader
colnames(selection)[2] <- "OBS_VALUE"

index <- 4
total_columns <- ncol(wagIndex)

while (index <= total_columns) {
  nColhead <- colnames(wagIndex)[index]
  nextData <- wagIndex |> select(Code, nColhead)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selection <- rbind(selection, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selection <- selection |>
  mutate(DATAFLOW = "SBS:DF_EMP_TABLE2(1.0)",
         FREQ = ifelse(nchar(TIME_PERIOD)==4,"A","Q"),
         REF_AREA = "WS",
         SEX = "_T",
         TRANSFORMATION = "N",
         INDICATOR = "WAGIDX",
         TABLE = "LMI_TABLE2",
         UNIT_MULT = "",
         UNIT_MEASURE = "INDEX",
         BASE_YEAR = "2013",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 1,
         OBS_VALUE = OBS_VALUE
         
  ) |>
  rename(INDUSTRY = Code)

#Reorder the columns accordingly

selection <- selection |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    INDICATOR,
    INDUSTRY,
    SEX,
    TRANSFORMATION,
    OBS_VALUE,
    UNIT_MEASURE,
    UNIT_MULT,
    OBS_STATUS,
    COMMENT,
    BASE_YEAR,
    DECIMAL,
  )

#Write table to output csv file
write.csv(selection, "output/emp/DF_EMP_TABLE2.csv", row.names = FALSE)


#### ********************** Total number of employee processing ********************************* ####

totEmp <- read_excel("data/empData.xlsx", sheet = "totEmp")

colHeader <- colnames(totEmp)[3]
selection <- totEmp |> select(Code, colHeader)

selection$TIME_PERIOD <- colHeader
colnames(selection)[2] <- "OBS_VALUE"

index <- 4
total_columns <- ncol(totEmp)

while (index <= total_columns) {
  nColhead <- colnames(totEmp)[index]
  nextData <- totEmp |> select(Code, nColhead)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selection <- rbind(selection, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selection <- selection |>
  mutate(DATAFLOW = "SBS:DF_EMP_TABLE3(1.0)",
         FREQ = ifelse(nchar(TIME_PERIOD)==4,"A","Q"),
         REF_AREA = "WS",
         SEX = "_T",
         TRANSFORMATION = "N",
         INDICATOR = "REGEMP",
         TABLE = "LMI_TABLE3",
         UNIT_MULT = "",
         UNIT_MEASURE = "N",
         BASE_YEAR = "2013",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 0,
         OBS_VALUE = OBS_VALUE
         
  ) |>
  rename(INDUSTRY = Code)

#Reorder the columns accordingly

selection <- selection |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    INDICATOR,
    INDUSTRY,
    SEX,
    TRANSFORMATION,
    OBS_VALUE,
    UNIT_MEASURE,
    UNIT_MULT,
    OBS_STATUS,
    COMMENT,
    BASE_YEAR,
    DECIMAL,
  )

#Write table to output csv file
write.csv(selection, "output/emp/DF_EMP_TABLE3.csv", row.names = FALSE)


#### ********************** Total number of male employees processing ********************************* ####

maleEmp <- read_excel("data/empData.xlsx", sheet = "maleEmp")

colHeader <- colnames(maleEmp)[3]
selection <- maleEmp |> select(Code, colHeader)

selection$TIME_PERIOD <- colHeader
colnames(selection)[2] <- "OBS_VALUE"

index <- 4
total_columns <- ncol(maleEmp)

while (index <= total_columns) {
  nColhead <- colnames(maleEmp)[index]
  nextData <- maleEmp |> select(Code, nColhead)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selection <- rbind(selection, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selection <- selection |>
  mutate(DATAFLOW = "SBS:DF_EMP_TABLE4A(1.0)",
         FREQ = ifelse(nchar(TIME_PERIOD)==4,"A","Q"),
         REF_AREA = "WS",
         SEX = "M",
         TRANSFORMATION = "N",
         INDICATOR = "REGEMP",
         TABLE = "LMI_TABLE4A",
         UNIT_MULT = "",
         UNIT_MEASURE = "N",
         BASE_YEAR = "",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 0,
         OBS_VALUE = OBS_VALUE
         
  ) |>
  rename(INDUSTRY = Code)

#Reorder the columns accordingly

selection <- selection |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    INDICATOR,
    INDUSTRY,
    SEX,
    TRANSFORMATION,
    OBS_VALUE,
    UNIT_MEASURE,
    UNIT_MULT,
    OBS_STATUS,
    COMMENT,
    BASE_YEAR,
    DECIMAL,
  )

#Write table to output csv file
write.csv(selection, "output/emp/DF_EMP_TABLE4A.csv", row.names = FALSE)


#### ********************** Total number of female employees processing ********************************* ####

femaleEmp <- read_excel("data/empData.xlsx", sheet = "femaleEmp")

colHeader <- colnames(femaleEmp)[3]
selection <- femaleEmp |> select(Code, colHeader)

selection$TIME_PERIOD <- colHeader
colnames(selection)[2] <- "OBS_VALUE"

index <- 4
total_columns <- ncol(femaleEmp)

while (index <= total_columns) {
  nColhead <- colnames(femaleEmp)[index]
  nextData <- femaleEmp |> select(Code, nColhead)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selection <- rbind(selection, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selection <- selection |>
  mutate(DATAFLOW = "SBS:DF_EMP_TABLE4B(1.0)",
         FREQ = ifelse(nchar(TIME_PERIOD)==4,"A","Q"),
         REF_AREA = "WS",
         SEX = "F",
         TRANSFORMATION = "N",
         INDICATOR = "REGEMP",
         TABLE = "LMI_TABLE4B",
         UNIT_MULT = "",
         UNIT_MEASURE = "N",
         BASE_YEAR = "",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 0,
         OBS_VALUE = OBS_VALUE
         
  ) |>
  rename(INDUSTRY = Code)

#Reorder the columns accordingly

selection <- selection |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    INDICATOR,
    INDUSTRY,
    SEX,
    TRANSFORMATION,
    OBS_VALUE,
    UNIT_MEASURE,
    UNIT_MULT,
    OBS_STATUS,
    COMMENT,
    BASE_YEAR,
    DECIMAL,
  )

#Write table to output csv file
write.csv(selection, "output/emp/DF_EMP_TABLE4B.csv", row.names = FALSE)


#### ********************** Total male and female wages processing ********************************* ####

totWage <- read_excel("data/empData.xlsx", sheet = "totWage")

colHeader <- colnames(totWage)[3]
selection <- totWage |> select(Code, colHeader)

selection$TIME_PERIOD <- colHeader
colnames(selection)[2] <- "OBS_VALUE"

index <- 4
total_columns <- ncol(totWage)

while (index <= total_columns) {
  nColhead <- colnames(totWage)[index]
  nextData <- totWage |> select(Code, nColhead)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selection <- rbind(selection, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selection <- selection |>
  mutate(DATAFLOW = "SBS:DF_EMP_TABLE5(1.0)",
         FREQ = ifelse(nchar(TIME_PERIOD)==4,"A","Q"),
         REF_AREA = "WS",
         SEX = "_T",
         TRANSFORMATION = "N",
         INDICATOR = "EMPWAG",
         TABLE = "LMI_TABLE5",
         UNIT_MULT = "6",
         UNIT_MEASURE = "WST",
         BASE_YEAR = "",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 1,
         OBS_VALUE = OBS_VALUE
         
  ) |>
  rename(INDUSTRY = Code)

#Reorder the columns accordingly

selection <- selection |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    INDICATOR,
    INDUSTRY,
    SEX,
    TRANSFORMATION,
    OBS_VALUE,
    UNIT_MEASURE,
    UNIT_MULT,
    OBS_STATUS,
    COMMENT,
    BASE_YEAR,
    DECIMAL,
  )

#Write table to output csv file
write.csv(selection, "output/emp/DF_EMP_TABLE5.csv", row.names = FALSE)


#### ********************** Total male wages processing ********************************* ####

maleTotWage <- read_excel("data/empData.xlsx", sheet = "maleTotWage")

colHeader <- colnames(maleTotWage)[3]
selection <- maleTotWage |> select(Code, colHeader)

selection$TIME_PERIOD <- colHeader
colnames(selection)[2] <- "OBS_VALUE"

index <- 4
total_columns <- ncol(maleTotWage)

while (index <= total_columns) {
  nColhead <- colnames(maleTotWage)[index]
  nextData <- maleTotWage |> select(Code, nColhead)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selection <- rbind(selection, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selection <- selection |>
  mutate(DATAFLOW = "SBS:DF_EMP_TABLE6A(1.0)",
         FREQ = ifelse(nchar(TIME_PERIOD)==4,"A","Q"),
         REF_AREA = "WS",
         SEX = "M",
         TRANSFORMATION = "N",
         INDICATOR = "EMPWAG",
         TABLE = "LMI_TABLE6A",
         UNIT_MULT = "6",
         UNIT_MEASURE = "WST",
         BASE_YEAR = "",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 1,
         OBS_VALUE = OBS_VALUE
         
  ) |>
  rename(INDUSTRY = Code)

#Reorder the columns accordingly

selection <- selection |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    INDICATOR,
    INDUSTRY,
    SEX,
    TRANSFORMATION,
    OBS_VALUE,
    UNIT_MEASURE,
    UNIT_MULT,
    OBS_STATUS,
    COMMENT,
    BASE_YEAR,
    DECIMAL,
  )

#Write table to output csv file
write.csv(selection, "output/emp/DF_EMP_TABLE6A.csv", row.names = FALSE)


#### ********************** Total female wages processing ********************************* ####

femaleTotWage <- read_excel("data/empData.xlsx", sheet = "femaleTotWage")

colHeader <- colnames(femaleTotWage)[3]
selection <- femaleTotWage |> select(Code, colHeader)

selection$TIME_PERIOD <- colHeader
colnames(selection)[2] <- "OBS_VALUE"

index <- 4
total_columns <- ncol(femaleTotWage)

while (index <= total_columns) {
  nColhead <- colnames(femaleTotWage)[index]
  nextData <- femaleTotWage |> select(Code, nColhead)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selection <- rbind(selection, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selection <- selection |>
  mutate(DATAFLOW = "SBS:DF_EMP_TABLE6B(1.0)",
         FREQ = ifelse(nchar(TIME_PERIOD)==4,"A","Q"),
         REF_AREA = "WS",
         SEX = "F",
         TRANSFORMATION = "N",
         INDICATOR = "EMPWAG",
         TABLE = "LMI_TABLE6B",
         UNIT_MULT = "6",
         UNIT_MEASURE = "WST",
         BASE_YEAR = "",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 1,
         OBS_VALUE = OBS_VALUE
         
  ) |>
  rename(INDUSTRY = Code)

#Reorder the columns accordingly

selection <- selection |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    INDICATOR,
    INDUSTRY,
    SEX,
    TRANSFORMATION,
    OBS_VALUE,
    UNIT_MEASURE,
    UNIT_MULT,
    OBS_STATUS,
    COMMENT,
    BASE_YEAR,
    DECIMAL,
  )

#Write table to output csv file
write.csv(selection, "output/emp/DF_EMP_TABLE6B.csv", row.names = FALSE)


#### ********************** Total average wages processing ********************************* ####

totAvgWage <- read_excel("data/empData.xlsx", sheet = "totAvgWage")

colHeader <- colnames(totAvgWage)[3]
selection <- totAvgWage |> select(Code, colHeader)

selection$TIME_PERIOD <- colHeader
colnames(selection)[2] <- "OBS_VALUE"

index <- 4
total_columns <- ncol(totAvgWage)

while (index <= total_columns) {
  nColhead <- colnames(totAvgWage)[index]
  nextData <- totAvgWage |> select(Code, nColhead)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selection <- rbind(selection, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selection <- selection |>
  mutate(DATAFLOW = "SBS:DF_EMP_TABLE7(1.0)",
         FREQ = ifelse(nchar(TIME_PERIOD)==4,"A","Q"),
         REF_AREA = "WS",
         SEX = "_T",
         TRANSFORMATION = "N",
         INDICATOR = "AVGWAG",
         TABLE = "LMI_TABLE67",
         UNIT_MULT = "",
         UNIT_MEASURE = "WST",
         BASE_YEAR = "",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 0,
         OBS_VALUE = OBS_VALUE
         
  ) |>
  rename(INDUSTRY = Code)

#Reorder the columns accordingly

selection <- selection |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    INDICATOR,
    INDUSTRY,
    SEX,
    TRANSFORMATION,
    OBS_VALUE,
    UNIT_MEASURE,
    UNIT_MULT,
    OBS_STATUS,
    COMMENT,
    BASE_YEAR,
    DECIMAL,
  )

#Write table to output csv file
write.csv(selection, "output/emp/DF_EMP_TABLE7.csv", row.names = FALSE)


#### ********************** Male average wages processing ********************************* ####

maleAvgWage <- read_excel("data/empData.xlsx", sheet = "maleAvgWage")

colHeader <- colnames(maleAvgWage)[3]
selection <- maleAvgWage |> select(Code, colHeader)

selection$TIME_PERIOD <- colHeader
colnames(selection)[2] <- "OBS_VALUE"

index <- 4
total_columns <- ncol(maleAvgWage)

while (index <= total_columns) {
  nColhead <- colnames(maleAvgWage)[index]
  nextData <- maleAvgWage |> select(Code, nColhead)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selection <- rbind(selection, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selection <- selection |>
  mutate(DATAFLOW = "SBS:DF_EMP_TABLE8A(1.0)",
         FREQ = ifelse(nchar(TIME_PERIOD)==4,"A","Q"),
         REF_AREA = "WS",
         SEX = "M",
         TRANSFORMATION = "N",
         INDICATOR = "AVGWAG",
         TABLE = "LMI_TABLE8A",
         UNIT_MULT = "",
         UNIT_MEASURE = "WST",
         BASE_YEAR = "",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 0,
         OBS_VALUE = OBS_VALUE
         
  ) |>
  rename(INDUSTRY = Code)

#Reorder the columns accordingly

selection <- selection |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    INDICATOR,
    INDUSTRY,
    SEX,
    TRANSFORMATION,
    OBS_VALUE,
    UNIT_MEASURE,
    UNIT_MULT,
    OBS_STATUS,
    COMMENT,
    BASE_YEAR,
    DECIMAL,
  )

#Write table to output csv file
write.csv(selection, "output/emp/DF_EMP_TABLE8A.csv", row.names = FALSE)


#### ********************** Female average wages processing ********************************* ####

femaleAvgWage <- read_excel("data/empData.xlsx", sheet = "femaleAvgWage")

colHeader <- colnames(femaleAvgWage)[3]
selection <- femaleAvgWage |> select(Code, colHeader)

selection$TIME_PERIOD <- colHeader
colnames(selection)[2] <- "OBS_VALUE"

index <- 4
total_columns <- ncol(femaleAvgWage)

while (index <= total_columns) {
  nColhead <- colnames(femaleAvgWage)[index]
  nextData <- femaleAvgWage |> select(Code, nColhead)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selection <- rbind(selection, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selection <- selection |>
  mutate(DATAFLOW = "SBS:DF_EMP_TABLE8B(1.0)",
         FREQ = ifelse(nchar(TIME_PERIOD)==4,"A","Q"),
         REF_AREA = "WS",
         SEX = "F",
         TRANSFORMATION = "N",
         INDICATOR = "AVGWAG",
         TABLE = "LMI_TABLE8B",
         UNIT_MULT = "",
         UNIT_MEASURE = "WST",
         BASE_YEAR = "",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 0,
         OBS_VALUE = OBS_VALUE
         
  ) |>
  rename(INDUSTRY = Code)

#Reorder the columns accordingly

selection <- selection |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    INDICATOR,
    INDUSTRY,
    SEX,
    TRANSFORMATION,
    OBS_VALUE,
    UNIT_MEASURE,
    UNIT_MULT,
    OBS_STATUS,
    COMMENT,
    BASE_YEAR,
    DECIMAL,
  )

#Write table to output csv file
write.csv(selection, "output/emp/DF_EMP_TABLE8B.csv", row.names = FALSE)


#### ********************** Total year by year employment change ********************************* ####

totYearChange <- read_excel("data/empData.xlsx", sheet = "totYearChange")

colHeader <- colnames(totYearChange)[3]
selection <- totYearChange |> select(Code, colHeader)

selection$TIME_PERIOD <- colHeader
colnames(selection)[2] <- "OBS_VALUE"

index <- 4
total_columns <- ncol(totYearChange)

while (index <= total_columns) {
  nColhead <- colnames(totYearChange)[index]
  nextData <- totYearChange |> select(Code, nColhead)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selection <- rbind(selection, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selection <- selection |>
  mutate(DATAFLOW = "SBS:DF_EMP_TABLE9(1.0)",
         FREQ = ifelse(nchar(TIME_PERIOD)==4,"A","Q"),
         REF_AREA = "WS",
         SEX = "_T",
         TRANSFORMATION = "G1Y",
         INDICATOR = "YRPERCHANGE",
         TABLE = "LMI_TABLE9",
         UNIT_MULT = "",
         UNIT_MEASURE = "PT",
         BASE_YEAR = "",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 1,
         OBS_VALUE = OBS_VALUE
         
  ) |>
  rename(INDUSTRY = Code)

#Reorder the columns accordingly

selection <- selection |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    INDICATOR,
    INDUSTRY,
    SEX,
    TRANSFORMATION,
    OBS_VALUE,
    UNIT_MEASURE,
    UNIT_MULT,
    OBS_STATUS,
    COMMENT,
    BASE_YEAR,
    DECIMAL,
  )

#Write table to output csv file
write.csv(selection, "output/emp/DF_EMP_TABLE9.csv", row.names = FALSE)


#### ********************** Male year by year employment change ********************************* ####

maleYearChange <- read_excel("data/empData.xlsx", sheet = "maleYearChange")

colHeader <- colnames(maleYearChange)[3]
selection <- maleYearChange |> select(Code, colHeader)

selection$TIME_PERIOD <- colHeader
colnames(selection)[2] <- "OBS_VALUE"

index <- 4
total_columns <- ncol(maleYearChange)

while (index <= total_columns) {
  nColhead <- colnames(maleYearChange)[index]
  nextData <- maleYearChange |> select(Code, nColhead)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selection <- rbind(selection, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selection <- selection |>
  mutate(DATAFLOW = "SBS:DF_EMP_TABLE10A(1.0)",
         FREQ = ifelse(nchar(TIME_PERIOD)==4,"A","Q"),
         REF_AREA = "WS",
         SEX = "M",
         TRANSFORMATION = "G1Y",
         INDICATOR = "YRPERCHANGE",
         TABLE = "LMI_TABLE10A",
         UNIT_MULT = "",
         UNIT_MEASURE = "PT",
         BASE_YEAR = "",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 1,
         OBS_VALUE = OBS_VALUE
         
  ) |>
  rename(INDUSTRY = Code)

#Reorder the columns accordingly

selection <- selection |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    INDICATOR,
    INDUSTRY,
    SEX,
    TRANSFORMATION,
    OBS_VALUE,
    UNIT_MEASURE,
    UNIT_MULT,
    OBS_STATUS,
    COMMENT,
    BASE_YEAR,
    DECIMAL
  )

#Write table to output csv file
write.csv(selection, "output/emp/DF_EMP_TABLE10A.csv", row.names = FALSE)


#### ********************** Female year by year employment change ********************************* ####

femaleYearChange <- read_excel("data/empData.xlsx", sheet = "femaleYearChange")

colHeader <- colnames(femaleYearChange)[3]
selection <- femaleYearChange |> select(Code, colHeader)

selection$TIME_PERIOD <- colHeader
colnames(selection)[2] <- "OBS_VALUE"

index <- 4
total_columns <- ncol(femaleYearChange)

while (index <= total_columns) {
  nColhead <- colnames(femaleYearChange)[index]
  nextData <- femaleYearChange |> select(Code, nColhead)
  nextData$TIME_PERIOD <- nColhead
  colnames(nextData)[2] <- "OBS_VALUE"
  selection <- rbind(selection, nextData)
  index <- index + 1
  
}

#Add the rest of the columns
selection <- selection |>
  mutate(DATAFLOW = "SBS:DF_EMP_TABLE10B(1.0)",
         FREQ = ifelse(nchar(TIME_PERIOD)==4,"A","Q"),
         REF_AREA = "WS",
         SEX = "F",
         TRANSFORMATION = "G1Y",
         INDICATOR = "YRPERCHANGE",
         TABLE = "LMI_TABLE10B",
         UNIT_MULT = "",
         UNIT_MEASURE = "PT",
         BASE_YEAR = "",
         OBS_STATUS = "",
         COMMENT = "",
         DECIMAL = 1,
         OBS_VALUE = OBS_VALUE
         
  ) |>
  rename(INDUSTRY = Code)

#Reorder the columns accordingly

selection <- selection |>
  select(
    DATAFLOW,
    FREQ,
    TIME_PERIOD,
    REF_AREA,
    TABLE,
    INDICATOR,
    INDUSTRY,
    SEX,
    TRANSFORMATION,
    OBS_VALUE,
    UNIT_MEASURE,
    UNIT_MULT,
    OBS_STATUS,
    COMMENT,
    BASE_YEAR,
    DECIMAL,
  )

#Write table to output csv file
write.csv(selection, "output/emp/DF_EMP_TABLE10B.csv", row.names = FALSE)
