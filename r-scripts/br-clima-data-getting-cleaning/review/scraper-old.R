library(httr)
library(XML)

userAgent = 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0'

## 1 - Load "Esta�ao" list

estacoes = read.csv("lista-estacoes.csv", sep = ";", header = TRUE)

names(estacoes) = c("ID", "DESCRICAO", "CODIGO")

## 2 - Authenticate and get cookie

url = "http://www.inmet.gov.br"
path_auth = "projetos/rede/pesquisa/inicio.php"

login = list(
        mUsuario = ""
        ,mGerModulo = ""
        ,mCod = "<insert your email"
        ,mSenha  = "<insert your password>"
        ,mGerModulo = "PES"
        ,btnProcesso = "+Acessar+"
)

handle_auth <- handle(url)

response <- POST(handle = handle_auth, path = path_auth, body = login, config = user_agent(userAgent))

cookie = "PHPSESSID=<insert your authenticated cookie>"

## 3 - pass cookie and request data while iterating through Estacao list


path_query = "projetos/rede/pesquisa/gera_serie_txt_mensal.php"

query = list(
        mRelEstacao=82294
        ,btnProcesso="serie"
        ,mRelDtInicio="01/01/2000"
        ,mRelDtFim="22/04/2015"
        ,mAtributos=",,,,,1,1,,,1,,1,1,,1,,"
)

handle_query <- handle(url)

html <- GET(handle = handle_query, path = path_query, query = query)


## 4 - Normalize the data response

#tmp = readLines("temp.tmp")
#df = append(read.csv(text = tmp, skip = 47, sep = ";", header = TRUE, nrows = length(x)-49))




