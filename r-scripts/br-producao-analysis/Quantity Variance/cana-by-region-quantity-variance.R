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

# Plotting �rea em Produ��o de Cana de A�ucar por Regi�o ("Area" / "regiao")

qplot(Safra
      , Area
      , data = dt
      , color=regiao
      , ylab = "�rea (mil hectares)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("�rea em Produ��o de Cana de A�ucar por Regi�o - Safras de 2005/06 a 2014/15")

ggsave(filename = "AreaProducao.png", device = png, width = 1200, height = 500, limitsize = FALSE)

# Plotting Produtividade de Cana de A�ucar por Regi�o ("Produtividade" / "regiao")

qplot(Safra
      , Produtividade/1000
      , data = dt
      , color=regiao
      , ylab = "Produtividade (Ton / ha)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Produtividade de Cana de A�ucar por Regi�o - Safras de 2005/06 a 2014/15")

ggsave(filename = "Produtividade.png", device = png, width = 1200, height = 500, limitsize = FALSE)

# Plotting Produ��o de Cana de A�ucar por Regi�o ("Produ��o" / "regiao")

qplot(Safra
      , Produ��o/1000
      , data = dt
      , color=regiao
      , ylab = "Produ��o (milh�es de toneladas)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Produ��o de Cana de A�ucar por Regi�o - Safras de 2005/06 a 2014/15")

ggsave(filename = "Producao.png", device = png, bg = "transparent", width = 1200, height = 500, limitsize = FALSE)

# Plotting Produ��o de A�ucar por Regi�o ("A�ucar" / "regiao")

qplot(Safra
      , A�ucar/1000
      , data = dt
      , color=regiao
      , ylab = "Produ��o (milh�es de toneladas)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Produ��o de A�ucar por Regi�o - Safras de 2005/06 a 2014/15")

ggsave(filename = "ProducAcucar.png", device = png, bg = "transparent", width = 1200, height = 500, limitsize = FALSE)

# Plotting Produ��o de Etano Total por Regi�o ("Etanol.Total" / "regiao")

qplot(Safra
      , Etanol.Total/1000000
      , data = dt
      , color=regiao
      , ylab = "Produ��o (bilh�es de litros)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Produ��o de Etanol Total por Regi�o - Safras de 2005/06 a 2014/15")

ggsave(filename = "ProducEtanolTotal.png", device = png, bg = "transparent", width = 1200, height = 500, limitsize = FALSE)

# Plotting Produ��o de Etano Anidro por Regi�o ("Etanol.Anidro" / "regiao")

qplot(Safra
      , Etanol.Anidro/1000000
      , data = dt
      , color=regiao
      , ylab = "Produ��o (bilh�es de litros)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Produ��o de Etanol Anidro por Regi�o - Safras de 2005/06 a 2014/15")

ggsave(filename = "ProducEtanolAnidro.png", device = png, bg = "transparent", width = 1200, height = 500, limitsize = FALSE)

# Plotting Produ��o de Etano Hidratado por Regi�o ("Etanol.Hidratado" / "regiao")

qplot(Safra
      , Etanol.Hidratado/1000000
      , data = dt
      , color=regiao
      , ylab = "Produ��o (bilh�es de litros)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Produ��o de Etanol Hidratado por Regi�o - Safras de 2005/06 a 2014/15")

ggsave(filename = "ProducEtanolHidratado.png", device = png, bg = "transparent", width = 1200, height = 500, limitsize = FALSE)
