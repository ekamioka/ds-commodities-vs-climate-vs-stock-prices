##
## Question: Does the sugar kane production by UF increased or decreased since 2000 until 2015?
##

library(data.table)
library(ggplot2)

# importing the csv dataset to data table 

dt = as.data.table(read.csv("../../../data/BR - producao/cana/producao_cana_uf.csv"
                            , sep = ","
                            , header = TRUE
                            , dec = "."))

# declaring the region lists for iterative plotting

Norte = c("RR","RO","AC","AM","AP","PA","TO")
Nordeste = c("MA","PI","CE","RN","PB","PE","AL","SE","BA")
Centroeste = c("MT","MS","GO","DF")
Sudeste = c("MG", "ES","RJ","SP")
Sul = c("PR","SC","RS")

regioes = list(Norte,Nordeste,Centroeste,Sudeste,Sul)
regioes_names = list("Norte","Nordeste","Centro Oeste","Sudeste","Sul")

pd = position_dodge(.1) # position adjustments - Adjust position by dodging overlaps to the side.

for(i in 1:length(regioes)){
        # subsetting for the specific region
        dt_tmp = dt[(UF %in% regioes[[i]])]
        
        # Plotting �rea em Produ��o de Cana de A�ucar por Regi�o ("Area" / "regiao")
        
        qplot(Safra
              , Area
              , data = dt_tmp
              , color=UF
              , ylab = "�rea (mil hectares)") + 
                geom_line(position=pd,aes(group=UF)) +
                geom_point() +
                ggtitle(paste(regioes_names[[i]]," - �rea em Produ��o de Cana de A�ucar por Regi�o - Safras de 2005/06 a 2014/15"))
        
        ggsave(filename = paste(regioes_names[[i]],"-AreaProducao.png", sep = ""), device = png, width = 1200, height = 500, limitsize = FALSE)
        
        # Plotting Produtividade de Cana de A�ucar por Regi�o ("Produtividade" / "regiao")
        
        qplot(Safra
              , Produtividade/1000
              , data = dt_tmp
              , color=UF
              , ylab = "Produtividade (Ton / ha)") + 
                geom_line(position=pd,aes(group=UF)) +
                geom_point() +
                ggtitle(paste(regioes_names[[i]]," - Produtividade de Cana de A�ucar por Regi�o - Safras de 2005/06 a 2014/15"))
        
        ggsave(filename = paste(regioes_names[[i]],"-Produtividade.png", sep = ""), device = png, width = 1200, height = 500, limitsize = FALSE)
        
        # Plotting Produ��o de Cana de A�ucar por Regi�o ("Produ��o" / "regiao")
        
        qplot(Safra
              , Produ��o/1000
              , data = dt_tmp
              , color=UF
              , ylab = "Produ��o (milh�es de toneladas)") + 
                geom_line(position=pd,aes(group=UF)) +
                geom_point() +
                ggtitle(paste(regioes_names[[i]]," - Produ��o de Cana de A�ucar por Regi�o - Safras de 2005/06 a 2014/15"))
        
        ggsave(filename = paste(regioes_names[[i]],"-Producao.png", sep = ""), device = png, bg = "transparent", width = 1200, height = 500, limitsize = FALSE)
        
        # Plotting Produ��o de A�ucar por Regi�o ("A�ucar" / "regiao")
        
        qplot(Safra
              , A�ucar/1000
              , data = dt_tmp
              , color=UF
              , ylab = "Produ��o (milh�es de toneladas)") + 
                geom_line(position=pd,aes(group=UF)) +
                geom_point() +
                ggtitle(paste(regioes_names[[i]]," - Produ��o de A�ucar por Regi�o - Safras de 2005/06 a 2014/15"))
        
        ggsave(filename = paste(regioes_names[[i]],"-ProducAcucar.png", sep = ""), device = png, bg = "transparent", width = 1200, height = 500, limitsize = FALSE)
        
        # Plotting Produ��o de Etano Total por Regi�o ("Etanol.Total" / "regiao")
        
        qplot(Safra
              , Etanol.Total/1000000
              , data = dt_tmp
              , color=UF
              , ylab = "Produ��o (bilh�es de litros)") + 
                geom_line(position=pd,aes(group=UF)) +
                geom_point() +
                ggtitle(paste(regioes_names[[i]]," - Produ��o de Etanol Total por Regi�o - Safras de 2005/06 a 2014/15"))
        
        ggsave(filename = paste(regioes_names[[i]],"-ProducEtanolTotal.png", sep = ""), device = png, bg = "transparent", width = 1200, height = 500, limitsize = FALSE)
        
        # Plotting Produ��o de Etano Anidro por Regi�o ("Etanol.Anidro" / "regiao")
        
        qplot(Safra
              , Etanol.Anidro/1000000
              , data = dt_tmp
              , color=UF
              , ylab = "Produ��o (bilh�es de litros)") + 
                geom_line(position=pd,aes(group=UF)) +
                geom_point() +
                ggtitle(paste(regioes_names[[i]]," - Produ��o de Etanol Anidro por Regi�o - Safras de 2005/06 a 2014/15"))
        
        ggsave(filename = paste(regioes_names[[i]],"-ProducEtanolAnidro.png", sep = ""), device = png, bg = "transparent", width = 1200, height = 500, limitsize = FALSE)
        
        # Plotting Produ��o de Etano Hidratado por Regi�o ("Etanol.Hidratado" / "regiao")
        
        qplot(Safra
              , Etanol.Hidratado/1000000
              , data = dt_tmp
              , color=UF
              , ylab = "Produ��o (bilh�es de litros)") + 
                geom_line(position=pd,aes(group=UF)) +
                geom_point() +
                ggtitle(paste(regioes_names[[i]]," - Produ��o de Etanol Hidratado por Regi�o - Safras de 2005/06 a 2014/15"))
        
        ggsave(filename = paste(regioes_names[[i]],"-ProducEtanolHidratado.png", sep = ""), device = png, bg = "transparent", width = 1200, height = 500, limitsize = FALSE)        
}
