##
## Question: Is there any relashionship between the variables/observations?
##

library(data.table)

# importing the csv dataset to data table 

dt = as.data.table(read.csv("../../../../data/BR - producao/algodao/producao_algodao_regiao.csv"
                            , sep = ","
                            , header = TRUE
                            , dec = "."))
# Subsetting "regiao" and "production" for distance calculation

subdt = dt[Safra == "2000.01"]

subdt = data.table(subdt$regiao, subdt$ProducCarAlg)

# Calculating the euclidean distance considered through regiao and production

distdt = dist(subdt)

# Clustering the regiao and production based on distance calculated

clustdt = hclust(distdt)

# plotting

plot(clustdt, labels = paste(subdt$V1,"\r\n",subdt$V2,"(k tons)"), main = "Produção de Caroço de Algodão - Safra 2000/01")

##
## Answer: Between the variables/observations there is the relationship of production groups.
##