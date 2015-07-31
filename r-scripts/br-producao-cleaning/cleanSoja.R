library(data.table)
library(xlsx)
library(reshape2)

xlsfile = "15_04_13_10_33_54_sojaseriehist.xls"
sheets = c("Area", "Produtividade", "Producao")
header = c("UF", "2000.01", "2001.02", "2002.03", "2003.04", "2004.05", "2005.06", "2006.07", "2007.08", "2008.09", "2009.10", "2010.12", "2011.12", "2012.13", "2013.14", "2014.15Prev")
colrange = c(1,26:40)

for(i in 1:length(sheets)){
        ## read Excel File and set the right field type
        dt = data.table(read.xlsx2(file = xlsfile, sheetIndex = i, header = TRUE, startRow = 6, endRow = 41, colIndex = colrange, colClasses = c("character",rep("numeric",11))))
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
write.csv(dt_uf, file = "producao_soja_uf.csv")
write.csv(dt_regiao, file = "producao_soja_regiao.csv")
