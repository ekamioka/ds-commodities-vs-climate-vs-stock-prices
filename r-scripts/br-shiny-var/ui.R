library(shiny)

shinyUI(bootstrapPage(

        div(style="display:inline-block",
        selectInput(inputId = "UF",
                    label = "Escolha o estado:",
                    choices = c("AC","AL","AM","AP","BA","CE","DF"
                                ,"ES","GO","MA","MG","MS","MT","PA"
                                ,"PB","PE","PI","PR","RJ","RN","RO"
                                ,"RR","RS","SC","SE","SP","TO"))
        ),
        div(style="display:inline-block",
        selectInput(inputId = "cultivar",
                    label = "Escolha o cultivar:",
                    choices = c("Algodão", "Café", "Cana", "Milho", "Soja", "Trigo"))
        ),
                    
       plotOutput(outputId = "prod")

#       plotOutput(outputId = "clima")
       
#       plotOutput(outputId = "var")

#        tableOutput(outputId = "main_plot")

#        )
        
))