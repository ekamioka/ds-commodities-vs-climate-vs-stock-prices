library(data.table)
library(xlsx)
library(reshape2)

xlsfile = "15_04_14_08_42_34_cafetotalseriehist.xls"
sheets = c("AreaProducao", "AreaFormacao", "Produtividade", "Producao")
header = c("UF", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014","2015Prev")
colrange = c(1:16)

for(i in 1:length(sheets)){
        ## read Excel File and set the right field type
        dt = data.table(read.xlsx2(file = xlsfile, sheetIndex = i, header = TRUE, startRow = 6, endRow = 32, colIndex = colrange, colClasses = c("character",rep("numeric",15))))
        setnames(dt, header)
        
        ## melting and changing the columns in rows (each row contains one observation/measure)
        melt = melt(dt, id = "UF", measure.vars = header[-1])
        setnames(melt, c("UF", "Safra", "Area"))
        
        ## merge cleaned and structured data to the final data table
        if(i == 1){
                dt_final = melt
        } else{
                dt_final[,sheets[i]] = melt$Area
        }
}

## subset by regiao and by UF
dt_final$UF = as.character(dt_final$UF)

dt_uf = dt_final[which(nchar(dt_final$UF) == 2),]

dt_regiao = dt_final[which(nchar(dt_final$UF) > 2),]
setnames(dt_regiao, c("regiao", "Safra", sheets))

## export to csv
write.csv(dt_uf, file = "producao_cafe_uf.csv")
write.csv(dt_regiao, file = "producao_cafe_regiao.csv")
