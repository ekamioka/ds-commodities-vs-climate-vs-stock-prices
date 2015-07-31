## � preciso primeiramente fazer o logon na aplica��o web e pegar o cookie para consultar diretamente pelo seguinte link:
## link direto - "http://www.inmet.gov.br/projetos/rede/pesquisa/gera_serie_txt_mensal.php?mRelEstacao=82294&btnProcesso=serie&mRelDtInicio=01/01/2000&mRelDtFim=22/04/2015&mAtributos=,,,,,1,1,,,1,,1,1,,1,,"
## 1 - script para baixar dados meteorol�gicos de todas as esta��es existentes e salvar em arquivos locais
## 2 - Os dados ser�o limpos e normalizados no script cleaner.R

library(httr)
library(XML)

useragent = '-A "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0"'
cookie = "PHPSESSID=<Insert your authenticated cookie>"

url_part1 = 'http://www.inmet.gov.br/projetos/rede/pesquisa/gera_serie_txt_mensal.php?mRelEstacao='
url_part2 = '&btnProcesso=serie&mRelDtInicio=01/01/2000&mRelDtFim=22/04/2015&mAtributos=,,,,,1,1,,,1,,1,1,,1,,'

## Load "Esta�ao" list
estacoes = read.csv('../../../data/BR - clima/lista-estacoes.csv', sep = ";", header = TRUE)

for(code in estacoes$COD){
        url = paste(url_part1,code,url_part2, sep ='')
        html = getURI(url, cookie = cookie)
        write.table(html[], paste('../../../data/BR - clima/',code,".csv", sep = ""))
}
