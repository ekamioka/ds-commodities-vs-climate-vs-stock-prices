##
## Question: Does the coffee production by region increased or decreased since 2000 until 2015?
##

library(data.table)
library(ggplot2)

# importing the csv dataset to data table 

dt_total = as.data.table(read.csv("../../../data/BR - producao/cafe/producao_cafe_regiao.csv"
                            , sep = ","
                            , header = TRUE
                            , dec = "."))
# removing sub-regions

subregions = c("Cerrado"
               , "Planalto"
               , "Atlântico"
               , "Sul e Centro-Oeste"
               , "Triângulo, Alto Paranaiba e Noroeste"
               , "Zona da Mata, Rio Doce e Central"
               , "Norte, Jequitinhonha e Mucuri")

dt = dt_total[(!regiao %in% subregions)] # all regions that are not within subregions list

pd = position_dodge(.1) # position adjustments - Adjust position by dodging overlaps to the side.

# Plotting Área em Produção de Café por Região ("AreaProducao" / "regiao")

qplot(Safra
      , AreaProducao/1000000
      , data = dt
      , color=regiao
      , ylab = "Área (milhões hectares)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Área em Produção de Café por Região - Safras de 2001 a 2015")

ggsave(filename = "AreaProducao.png", device = png, width = 1200, height = 500, limitsize = FALSE)

# Plotting Área em Formação de Café por Região ("AreaFormacao" / "regiao")

qplot(Safra
      , AreaFormacao/1000
      , data = dt
      , color=regiao
      , ylab = "Área (mil hectares)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Área em Formação de Café por Região - Safras de 2001 a 2015")

ggsave(filename = "AreaFormacao.png", device = png, width = 1200, height = 500, limitsize = FALSE)

# Plotting Produtividade de Café por Região ("Produtividade" / "regiao")

qplot(Safra
      , Produtividade
      , data = dt
      , color=regiao
      , ylab = "Produtividade (sacas por hectares)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Produtividade de Café por Região - Safras de 2001 a 2015")

ggsave(filename = "Produtividade.png", device = png, width = 1200, height = 500, limitsize = FALSE)

# Plotting Produção de Café por Região ("Producao" / "regiao")

qplot(Safra
      , Producao/1000
      , data = dt
      , color=regiao
      , ylab = "Produção (milhões sacas beneficiadas)") + 
        geom_line(position=pd,aes(group=regiao)) +
        geom_point() +
        ggtitle("Produção de Café por Região - Safras de 2001 a 2015")

ggsave(filename = "Producao.png", device = png, width = 1200, height = 500, limitsize = FALSE)
