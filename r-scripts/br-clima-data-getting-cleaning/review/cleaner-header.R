library(data.table)

## 1 - Load "Estaçao" list

estacoes = read.csv("../../../data/BR - clima/lista-estacoes.csv", sep = ";", header = TRUE)
names(estacoes) = c("ID", "DESCRICAO", "CODIGO")

codes = "83577"

for(code in codes){
        filename = paste("db/",code,".csv", sep = '') # create a var containing the directory and file based on code of Estação
        tmp = data.table(readLines(filename)) # open the file
        
        ## cleaning the header
        dt_header = tmp[c(37:41),] #
        dt_header = as.data.table(gsub(" ","",dt_header$V1))
        dt_header = strsplit(dt_header$V1, split = ":")
        
        ## cleaning the body
        dt_body = as.data.table(read.csv2(text=readLines(filename)[-(1:47)] # read data from line 48 (useful data) 
                                          , sep = ";"                                     # since the last line in the file and 
                                          , header = TRUE                                 # remove the last line which contains: </pre>
                                          , comment.char = "<")) 
}
