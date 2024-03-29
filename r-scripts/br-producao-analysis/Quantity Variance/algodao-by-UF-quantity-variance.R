##
## Question: Does the cotton production by UF increased or decreased since 2000 until 2015?
##

library(data.table)
library(ggplot2)

# importing the csv dataset to data table 

dt = as.data.table(read.csv("../../../data/BR - producao/algodao/producao_algodao_uf.csv"
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
        
        # Plotting Produtividade de Algod�o em Caro�o por Regi�o/UF ("ProdutAlgCar" / "regiao")
        
        qplot(Safra
              , ProdutAlgCar
              , data = dt_tmp
              , color=UF
              , ylab = "Produtividade (kg/ha)"
              , ) + 
                geom_line(position=pd,aes(group=UF)) +
                geom_point() +
                ggtitle(paste(regioes_names[[i]]," - Produtividade de Algod�o em Caro�o por Regi�o - Safras de 2000 a 2014"))
        
        ggsave(filename = paste(regioes_names[[i]],"-ProdutAlgCar.png", sep = ""), device = png, width = 1200, height = 500, limitsize = FALSE)
        
        # Plotting Produtividade de Pluma por Regi�o/UF ("ProdutPluma" / "regiao")
        
        qplot(Safra
              , ProdutPluma
              , data = dt_tmp
              , color=UF
              , ylab = "Produtividade (kg/ha)") + 
                geom_line(position=pd,aes(group=UF)) +
                geom_point() +
                ggtitle(paste(regioes_names[[i]]," - Produtividade de Pluma por Regi�o - Safras de 2000 a 2014"))
        
        ggsave(filename = paste(regioes_names[[i]],"-ProdutPluma.png", sep = ""), device = png, width = 1200, height = 500, limitsize = FALSE)

        # Plotting Produtividade de Caro�o de Algod�o por Regi�o/UF ("ProdutCarAlg" / "regiao")
        
        qplot(Safra
              , ProdutCarAlg
              , data = dt_tmp
              , color=UF
              , ylab = "Produtividade (kg/ha)") + 
                geom_line(position=pd,aes(group=UF)) +
                geom_point() +
                ggtitle(paste(regioes_names[[i]]," - Produtividade de Caro�o de Algod�o por Regi�o - Safras de 2000 a 2014"))
        
        ggsave(filename = paste(regioes_names[[i]],"-ProdutCarAlg.png", sep = ""), device = png, width = 1200, height = 500, limitsize = FALSE)

        # Plotting Produ��o de Algod�o em Caro�o por Regi�o/UF ("ProducAlgCar" / "regiao")
        
        qplot(Safra
              , ProducAlgCar
              , data = dt_tmp
              , color=UF
              , ylab = "Produ��o (mil toneladas)") + 
                geom_line(position=pd,aes(group=UF)) +
                geom_point() +
                ggtitle(paste(regioes_names[[i]]," - Produ��o de Algod�o em Caro�o por Regi�o - Safras de 2000 a 2014"))
        
        ggsave(filename = paste(regioes_names[[i]],"-ProducAlgCar.png", sep = ""), device = png, width = 1200, height = 500, limitsize = FALSE)

        # Plotting Produ��o de Pluma por Regi�o/UF ("ProducPluma" / "regiao")
        
        qplot(Safra
              , ProducPluma
              , data = dt_tmp
              , color=UF
              , ylab = "Produ��o (mil toneladas)") + 
                geom_line(position=pd,aes(group=UF)) +
                geom_point() +
                ggtitle(paste(regioes_names[[i]]," - Produ��o de Pluma por Regi�o - Safras de 2000 a 2014"))
        
        ggsave(filename = paste(regioes_names[[i]],"-ProducPluma.png", sep = ""), device = png, width = 1200, height = 500, limitsize = FALSE)

        # Plotting Produ��o de Caro�o de Algod�o por Regi�o ("ProducCarAlg" / "regiao")
        
        qplot(Safra
              , ProducCarAlg
              , data = dt_tmp
              , color=UF
              , ylab = "Produ��o (mil toneladas)") + 
                geom_line(position=pd,aes(group=UF)) +
                geom_point() +
                ggtitle(paste(regioes_names[[i]]," - Produ��o de Caro�o de Algod�o por Regi�o - Safras de 2000 a 2014"))
        
        ggsave(filename = paste(regioes_names[[i]],"-ProducCarAlg.png", sep = ""), device = png, width = 1200, height = 500, limitsize = FALSE)

}
