library(data.table)

## Reading data from csv file to data table structure
dt = data.table(read.csv2(file = "../../../data/BR - clima/full_clima.csv"
                          , sep = ","
                          , header = TRUE
                          , stringsAsFactors = FALSE
                          )[,2:10])

## Converting columns to the correct type - doing separately to increase control
dt$Data = as.Date(dt$Data, format="%d/%m/%Y")
dt$EvapoBHReal = as.numeric(dt$EvapoBHReal)
dt$InsolacaoTotal = as.numeric(dt$InsolacaoTotal)
dt$PrecipitacaoTotal = as.numeric(dt$PrecipitacaoTotal)
dt$PressaoMedia = as.numeric(dt$PressaoMedia)
dt$TempMaximaMedia = as.numeric(dt$TempMaximaMedia)
dt$TempMinimaMedia = as.numeric(dt$TempMinimaMedia)

# Adding a new column containing only the year - used to get the mean/year
dt$Year = year(dt$Data)

# Aggregating all climate measures by year and station code - used to cross plot with productions data
dt_mean <- data.table(aggregate(. ~ Year + Estacao
                                , dt
                                , FUN = "mean"
                                , na.rm = TRUE
                                , na.action = NULL)
                                [,c(1,2,5:10)])

# Writing the data table to csv file.
write.csv(dt_mean, file = "clima-mean-by-year-station.csv")