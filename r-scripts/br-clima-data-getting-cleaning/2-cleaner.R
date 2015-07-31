library(data.table)

## Load "Estaçao" list

estacoes = read.csv('../../../data/BR - clima/lista-estacoes.csv', sep = ";", header = TRUE)
names(estacoes) = c("ID", "DESCRICAO", "CODIGO")

## Normalize the data response

dt_total = data.table()

for(code in estacoes$CODIGO){
        filename = paste('../../../data/BR - clima/',code,".csv", sep = '') # create a var containing the directory and file based on Estação code
        
        ## cleaning the body
        dt_tmp = as.data.table(read.csv2(text=readLines(filename)[-(1:47)] # read data from line 48 (useful data) 
                            , sep = ";"                                     # since the last line in the file and 
                            , header = TRUE                                 # remove the last line which contains: </pre>
                            , comment.char = "<"))
        
        dt_total = rbind(dt_total,dt_tmp) # appending the temporary data table to the final full data table
}

write.csv(dt_total, file = './../../data/BR - clima/full_clima.csv')

