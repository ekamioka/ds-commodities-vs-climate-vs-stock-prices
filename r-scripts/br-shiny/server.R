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
                       "Algodão" = (col = "ProducCarAlg"),
                       "Café" = (col = "ProduCafe"),
                       "Cana" = (col = "ProduCana"),
                       "Milho" = (col = "ProduMilho"),
                       "Soja" = (col = "ProduSoja"),
                       "Trigo" = (col = "ProduTrigo")
                )

                ggplot(aes(x = Year, y = value/10^3), data = subset(dtx, Type == "Prod" & UF == input$UF & variable == col)) +
                        facet_grid(variable ~ ., scales = "free") +
                        geom_line() +
                        scale_x_continuous(breaks = c(2000:2015,1000)) +
                        geom_point() +
                        ylab("Produção (Milhões de toneladas)") +
                        ggtitle(paste("Produção - ", input$cultivar," - Safras de 2000/01 a 2014/15"))
        })

        output$clima <- renderPlot({
                ggplot(aes(x = Year, y = value), data = subset(dtx, Type == "Clima" & UF == input$UF)) +
                        facet_grid(variable ~ ., scales = "free_y") +
                        geom_line() +
                        scale_x_continuous(breaks = c(2000:2015,1000)) +
                        geom_point() +
                        ylab("Variáveis de Clima") +
                        ggtitle(paste("Clima - ", input$UF," - Média Anual"))
        })

 #       output$var <- renderPlot({
 #               ggpairs(as.data.table(c(subset(dt, select = 3:8)
 #                                           , subset(dtx, variable == col & UF == input$UF, select = value)))
 #                           , upper = list(params = c(size = 10))
 #                           , lower = list(continuous = "smooth"))
 #       })

})
