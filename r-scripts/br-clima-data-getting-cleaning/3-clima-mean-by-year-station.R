library(data.table)

## Reading climate station details data 
estacoes = data.table(read.csv2("../../../data/Getting and cleaning/BR - clima/lista-estacoes.csv"
                                , sep = ";"
                                , header = TRUE
                                , stringsAsFactors = FALSE)[,3:4])

## Reading data from csv file to data table structure
dt = data.table(read.csv2(file = "../../../data/Getting and cleaning/BR - clima/full_clima.csv"
                          , sep = ","
                          , header = TRUE
                          , stringsAsFactors = FALSE
                          )[,2:10])

## Merging UF column from station details data
dt = merge(dt, estacoes, by = "Estacao", all = TRUE)

## Converting columns to the correct type - doing separately to increase control
dt$Data = as.Date(dt$Data, format="%d/%m/%Y")
dt$EvapoBHReal = as.numeric(dt$EvapoBHReal)
dt$InsolacaoTotal = as.numeric(dt$InsolacaoTotal)
dt$PrecipitacaoTotal = as.numeric(dt$PrecipitacaoTotal)
dt$PressaoMedia = as.numeric(dt$PressaoMedia)
dt$TempMaximaMedia = as.numeric(dt$TempMaximaMedia)
dt$TempMinimaMedia = as.numeric(dt$TempMinimaMedia)

## Adding a new column containing only the year - used to get the mean/year
dt$Year = year(dt$Data)

## Aggregating all climate measures by UF - used to cross plot with productions data
dt_mean <- data.table(aggregate(. ~ UF + Year
                                , dt
                                , FUN = "mean"
                                , na.rm = TRUE
                                , na.action = NULL)
                      [,c(1:2,6:11)])

## Aggregating all climate measures by UF and breaking with station code and year

dt_mean_uf <- data.table(aggregate(. ~ UF + Estacao + Year
                                , dt
                                , FUN = "mean"
                                , na.rm = TRUE
                                , na.action = NULL)
                                [,c(1:3,6:11)])


# Writing the data table to csv file.
write.csv(dt_mean, file = '../../../data/Analysis/BR - Clima/clima-mean-by-UF.csv')
write.csv(dt_mean_uf, file = '../../../data/Analysis/BR - Clima/clima-mean-by-UF-and-station.csv')