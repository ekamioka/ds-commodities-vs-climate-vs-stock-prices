library(shiny)
library(data.table)
library(ggplot2)
library(gridExtra)
require(reshape2)
library(GGally)

setwd('/r-scripts/br-producao-analysis/')

dt = data.table(read.csv('../../../data/Analysis/BR - Transforms/all-produc-clima.csv'
                         , sep = ","
                         , header = TRUE
                         , stringsAsFactors = FALSE)[,2:16])

dtx = melt(dt, id = c("UF","Year")) # reshaping the data set from wide to long

dtx$Type =ifelse(substr(dtx$variable, start = 1,stop = 5) == "Produ"
                 ,"Prod" ,"Clima") # classifying if type is Production or Climate

# testing parameters
pd = position_dodge(.1)


shinyServer(function(input, output) {

        output$prod <- renderPlot({

                switch(input$cultivar,
                       "Algod�o" = (col = "ProducCarAlg"),
                       "Caf�" = (col = "ProduCafe"),
                       "Cana" = (col = "ProduCana"),
                       "Milho" = (col = "ProduMilho"),
                       "Soja" = (col = "ProduSoja"),
                       "Trigo" = (col = "ProduTrigo")
                )

                boxplot(x = subset(dtx, Type == "Prod" & UF == input$UF & variable == col)$value)
               # ggplot(data = subset(dtx, Type == "Prod" & UF == input$UF & variable == col), aes(x = value, y = Year)) +
        #               geom_boxplot()# geom_histogram(binwidth=.5, colour="black", fill="white")

#                ggplot(aes(x = Year, y = value), data = subset(dtx, Type == "Prod" & UF == input$UF & variable == col)) +
#                        facet_grid(variable ~ ., scales = "free") +
#                        geom_histogram(stat="identity") +
#                        scale_x_continuous(breaks = c(2000:2015,1000)) +
#                        geom_point() +
#                        ylab("Produ��o (Milh�es de toneladas)") +
#                        ggtitle(paste("Produ��o - ", input$cultivar," - Safras de 2000/01 a 2014/15"))
        })



})
