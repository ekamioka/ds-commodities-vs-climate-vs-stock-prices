##
## Question: Does the coffee production by UF increased or decreased since 2000 until 2015?
##

library(data.table)
library(ggplot2)

# importing the csv dataset to data table 

dt = as.data.table(read.csv("../../../data/BR - producao/cafe/producao_cafe_uf.csv"
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
        
        # Plotting �rea em Produ��o de Caf� por Regi�o/UF ("AreaProducao" / "regiao")
        
        qplot(Safra
              , Area/1000000
              , data = dt_tmp
              , color=UF
              , ylab = "�rea (milh�es hectares)") + 
                geom_line(position=pd,aes(group=UF)) +
                geom_point() +
                ggtitle(paste(regioes_names[[i]]," - �rea em Produ��o de Caf� por Regi�o - Safras de 2001 a 2015"))
        
        ggsave(filename = paste(regioes_names[[i]],"-AreaProducao.png", sep = ""), device = png, width = 1200, height = 500, limitsize = FALSE)
        
        
        # Plotting �rea em Forma��o de Caf� por Regi�o ("AreaFormacao" / "regiao")
        
        qplot(Safra
              , AreaFormacao/1000
              , data = dt_tmp
              , color=UF
              , ylab = "�rea (mil hectares)") + 
                geom_line(position=pd,aes(group=UF)) +
                geom_point() +
                ggtitle(paste(regioes_names[[i]]," - �rea em Forma��o de Caf� por Regi�o - Safras de 2001 a 2015"))
        
        ggsave(filename = paste(regioes_names[[i]],"-AreaFormacao.png", sep = ""), device = png, width = 1200, height = 500, limitsize = FALSE)
        
        # Plotting Produtividade de Caf� por Regi�o ("Produtividade" / "regiao")
        
        qplot(Safra
              , Produtividade
              , data = dt_tmp
              , color=UF
              , ylab = "Produtividade (sacas por hectares)") + 
                geom_line(position=pd,aes(group=UF)) +
                geom_point() +
                ggtitle(paste(regioes_names[[i]]," - Produtividade de Caf� por Regi�o - Safras de 2001 a 2015"))
        
        ggsave(filename = paste(regioes_names[[i]],"-Produtividade.png", sep = ""), device = png, width = 1200, height = 500, limitsize = FALSE)
        
        # Plotting Produ��o de Caf� por Regi�o ("Producao" / "regiao")
        
        qplot(Safra
              , Producao/1000
              , data = dt_tmp
              , color=UF
              , ylab = "Produ��o (milh�es sacas beneficiadas)") + 
                geom_line(position=pd,aes(group=UF)) +
                geom_point() +
                ggtitle(paste(regioes_names[[i]]," - Produ��o de Caf� por Regi�o - Safras de 2001 a 2015"))
        
        ggsave(filename = paste(regioes_names[[i]],"-Producao.png", sep = ""), device = png, width = 1200, height = 500, limitsize = FALSE)
        
}
