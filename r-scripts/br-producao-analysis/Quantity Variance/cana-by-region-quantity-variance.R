##
## Question: Does the sugar kane production by region increased or decreased since 2000 until 2015?
##

library(data.table)
library(ggplot2)

# importing the csv dataset to data table 

dt = as.data.table(read.csv("../../../data/BR - producao/cana/producao_cana_regiao.csv"
                                  , sep = ","
                                  , header = TRUE
                                  , dec = "."))

pd = position_dodge(.1) # position adjustments - Adjust position by dodging overlaps to the side.

# Plotting Área em Produção de Cana de Açucar por Região ("Area" / "regiao")

qplot(Safra
      , Area
      , data = dt
      , color=regiao
      , ylab = "Área (mil hectares)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Área em Produção de Cana de Açucar por Região - Safras de 2005/06 a 2014/15")

ggsave(filename = "AreaProducao.png", device = png, width = 1200, height = 500, limitsize = FALSE)

# Plotting Produtividade de Cana de Açucar por Região ("Produtividade" / "regiao")

qplot(Safra
      , Produtividade/1000
      , data = dt
      , color=regiao
      , ylab = "Produtividade (Ton / ha)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Produtividade de Cana de Açucar por Região - Safras de 2005/06 a 2014/15")

ggsave(filename = "Produtividade.png", device = png, width = 1200, height = 500, limitsize = FALSE)

# Plotting Produção de Cana de Açucar por Região ("Produção" / "regiao")

qplot(Safra
      , Produção/1000
      , data = dt
      , color=regiao
      , ylab = "Produção (milhões de toneladas)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Produção de Cana de Açucar por Região - Safras de 2005/06 a 2014/15")

ggsave(filename = "Producao.png", device = png, bg = "transparent", width = 1200, height = 500, limitsize = FALSE)

# Plotting Produção de Açucar por Região ("Açucar" / "regiao")

qplot(Safra
      , Açucar/1000
      , data = dt
      , color=regiao
      , ylab = "Produção (milhões de toneladas)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Produção de Açucar por Região - Safras de 2005/06 a 2014/15")

ggsave(filename = "ProducAcucar.png", device = png, bg = "transparent", width = 1200, height = 500, limitsize = FALSE)

# Plotting Produção de Etano Total por Região ("Etanol.Total" / "regiao")

qplot(Safra
      , Etanol.Total/1000000
      , data = dt
      , color=regiao
      , ylab = "Produção (bilhões de litros)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Produção de Etanol Total por Região - Safras de 2005/06 a 2014/15")

ggsave(filename = "ProducEtanolTotal.png", device = png, bg = "transparent", width = 1200, height = 500, limitsize = FALSE)

# Plotting Produção de Etano Anidro por Região ("Etanol.Anidro" / "regiao")

qplot(Safra
      , Etanol.Anidro/1000000
      , data = dt
      , color=regiao
      , ylab = "Produção (bilhões de litros)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Produção de Etanol Anidro por Região - Safras de 2005/06 a 2014/15")

ggsave(filename = "ProducEtanolAnidro.png", device = png, bg = "transparent", width = 1200, height = 500, limitsize = FALSE)

# Plotting Produção de Etano Hidratado por Região ("Etanol.Hidratado" / "regiao")

qplot(Safra
      , Etanol.Hidratado/1000000
      , data = dt
      , color=regiao
      , ylab = "Produção (bilhões de litros)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Produção de Etanol Hidratado por Região - Safras de 2005/06 a 2014/15")

ggsave(filename = "ProducEtanolHidratado.png", device = png, bg = "transparent", width = 1200, height = 500, limitsize = FALSE)
