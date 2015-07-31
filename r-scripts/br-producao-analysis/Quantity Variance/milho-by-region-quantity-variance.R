##
## Question: Does the corn production by region increased or decreased since 2000 until 2015?
##

library(data.table)
library(ggplot2)

# importing the csv dataset to data table 

dt = as.data.table(read.csv("../../../data/BR - producao/milho/producao_milho_regiao.csv"
                            , sep = ","
                            , header = TRUE
                            , dec = "."))

pd = position_dodge(.1) # position adjustments - Adjust position by dodging overlaps to the side.

# Plotting Área Plantada por Região ("Area" / "regiao")

qplot(Safra
      , Area
      , data = dt
      , color=regiao
      , ylab = "Área (mil hectares)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Área Plantada por Região - Safras de 2000/01 a 2014/15")

ggsave(filename = "AreaPlantada.png", device = png, width = 1200, height = 500, limitsize = FALSE)

# Plotting Produtividade de Milho por Região ("Produtividade" / "regiao")

qplot(Safra
      , Produtividade/1000
      , data = dt
      , color=regiao
      , ylab = "Produtividade (Ton / ha)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Produtividade de Milho por Região - Safras de 2000/01 a 2014/15")

ggsave(filename = "Produtividade.png", device = png, width = 1200, height = 500, limitsize = FALSE)

# Plotting Produção de Milho por Região ("Producao" / "regiao")

qplot(Safra
      , Producao/1000
      , data = dt
      , color=regiao
      , ylab = "Produção (milhões de toneladas)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Produção de Milho por Região - Safras de 2000/01 a 2014/15")

ggsave(filename = "Producao.png", device = png, bg = "transparent", width = 1200, height = 500, limitsize = FALSE)
