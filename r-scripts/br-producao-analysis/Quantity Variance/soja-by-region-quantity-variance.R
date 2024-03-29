##
## Question: Does the soy bean production by region increased or decreased since 2000 until 2015?
##

library(data.table)
library(ggplot2)

# importing the csv dataset to data table 

dt = as.data.table(read.csv("../../../data/BR - producao/soja/producao_soja_regiao.csv"
                            , sep = ","
                            , header = TRUE
                            , dec = "."))

pd = position_dodge(.1) # position adjustments - Adjust position by dodging overlaps to the side.

# Plotting �rea Plantada por Regi�o ("Area" / "regiao")

qplot(Safra
      , Area
      , data = dt
      , color=regiao
      , ylab = "�rea (mil hectares)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("�rea Plantada por Regi�o - Safras de 2000/01 a 2014/15")

ggsave(filename = "AreaPlantada.png", device = png, width = 1200, height = 500, limitsize = FALSE)

# Plotting Produtividade de Soja por Regi�o ("Produtividade" / "regiao")

qplot(Safra
      , Produtividade/1000
      , data = dt
      , color=regiao
      , ylab = "Produtividade (Ton / ha)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Produtividade de Soja por Regi�o - Safras de 2000/01 a 2014/15")

ggsave(filename = "Produtividade.png", device = png, width = 1200, height = 500, limitsize = FALSE)

# Plotting Produ��o de Soja por Regi�o ("Producao" / "regiao")

qplot(Safra
      , Producao/1000
      , data = dt
      , color=regiao
      , ylab = "Produ��o (milh�es de toneladas)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Produ��o de Soja por Regi�o - Safras de 2000/01 a 2014/15")

ggsave(filename = "Producao.png", device = png, bg = "transparent", width = 1200, height = 500, limitsize = FALSE)
