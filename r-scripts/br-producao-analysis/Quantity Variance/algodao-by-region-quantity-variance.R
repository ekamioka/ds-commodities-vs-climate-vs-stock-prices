##
## Question: Does the cotton production by region increased or decreased since 2000 until 2015?
##

library(data.table)
library(ggplot2)

# importing the csv dataset to data table 

dt = as.data.table(read.csv("../../../data/BR - producao/algodao/producao_algodao_regiao.csv"
                            , sep = ","
                            , header = TRUE
                            , dec = "."))

pd = position_dodge(.1) # position adjustments - Adjust position by dodging overlaps to the side.

# Plotting Produtividade de Algodão em Caroço por Região ("ProdutAlgCar" / "regiao")

png(file = "ProdutAlgCar.png", bg = "transparent", width = 1200, height = 500)
qplot(Safra
      , ProdutAlgCar
      , data = dt
      , color=regiao
      , ylab = "Produtividade (kg/ha)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Produtividade de Algodão em Caroço por Região - Safras de 2000 a 2014")
dev.off()

# Plotting Produtividade de Pluma por Região ("ProdutPluma" / "regiao")

png(file = "ProdutPluma.png", bg = "transparent", width = 1200, height = 500)
qplot(Safra
      , ProdutPluma
      , data = dt
      , color=regiao
      , ylab = "Produtividade (kg/ha)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Produtividade de Pluma por Região - Safras de 2000 a 2014")
dev.off()

# Plotting Produtividade de Caroço de Algodão por Região ("ProdutCarAlg" / "regiao")

png(file = "ProdutCarAlg.png", bg = "transparent", width = 1200, height = 500)
qplot(Safra
      , ProdutCarAlg
      , data = dt
      , color=regiao
      , ylab = "Produtividade (kg/ha)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Produtividade de Caroço de Algodão por Região - Safras de 2000 a 2014")
dev.off()

# Plotting Produção de Algodão em Caroço por Região ("ProducAlgCar" / "regiao")

png(file = "ProducAlgCar.png", bg = "transparent", width = 1200, height = 500)
qplot(Safra
      , ProducAlgCar
      , data = dt
      , color=regiao
      , ylab = "Produção (mil toneladas)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Produção de Algodão em Caroço por Região - Safras de 2000 a 2014")
dev.off()

# Plotting Produção de Pluma por Região ("ProducPluma" / "regiao")

png(file = "ProducPluma.png", bg = "transparent", width = 1200, height = 500)
qplot(Safra
      , ProducPluma
      , data = dt
      , color=regiao
      , ylab = "Produção (mil toneladas)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Produção de Pluma por Região - Safras de 2000 a 2014")
dev.off()

# Plotting Produção de Caroço de Algodão por Região ("ProducCarAlg" / "regiao")

png(file = "ProducCarAlg.png", bg = "transparent", width = 1200, height = 500)
qplot(Safra
      , ProducCarAlg
      , data = dt
      , color=regiao
      , ylab = "Produção (mil toneladas)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Produção de Caroço de Algodão por Região - Safras de 2000 a 2014")
dev.off()