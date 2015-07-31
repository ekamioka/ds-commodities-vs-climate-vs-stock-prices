------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Dados climatológicos por região.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------
Arquivos:
-------------------------
- lista-estacoes.csv -> lista com todas estações de monitoramento climatológicos
- cod-omm.csv -> subsetting de código de estações de monitoramento
- full_clima -> dados coletados, limpos e tabulados de todas as estações de monitoramento
- <código>.csv -> arquivo bruto coletado da página do INMET

-------------------------
Variáveis consideradas:
-------------------------
- Estação
- Data
- Hora
- Insolação Total (hs)
- Temp Máxima Média(°C)
- Precipitação Total (mm)
- Pressão ATM Média (mbar)
- Evapotranspiração Real BH (mm)
- Temp Mínima Média (°C)

Os scripts para coleta, limpeza e tabulação dos dados estão em: "\r-scripts\br-clima-data-getting"

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Nota para Descriptive/Initial analysis:

Para comparação entre os dados de produção e dados de clima, foi necessário extrair a média de cada variável de clima em relação ao ano todo. Para esta atividade, foram extraídas duas tabelas de dados:
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1.1 Média por UF:
-------------------------
- UF
- Year
- EvapoBHReal (média no ano)
- InsolacaoTotal (média no ano)
- PrecipitacaoTotal (média no ano)
- PressaoMedia (média no ano)
- TempMaximaMedia (média no ano)
- TempMinimaMedia (média no ano)

-------------------------
Extração resumida:
-------------------------
dt_mean
     UF Year EvapoBHReal InsolacaoTotal PrecipitacaoTotal PressaoMedia TempMaximaMedia TempMinimaMedia
  1: AC 2000         NaN       132.7824          166.3583     992.9420        31.82044        21.32057
  2: AL 2000         NaN       208.8873          140.6714     971.2637        29.64094        21.00936
  3: AM 2000         NaN       136.9297          228.6869    1006.4538        32.16108        22.20359
  4: AP 2000         NaN       189.9818          225.1500          NaN        31.29054        24.10500
  5: BA 2000         NaN       207.7721           90.3803     959.8973        29.61604        19.62948
 ---                                                                                                  
412: RS 2015   108.41467       212.2154          139.7977     956.7388        28.74048        18.86796
413: SC 2015   108.01569       184.4167          190.3222     919.8553        27.54109        17.69158
414: SE 2015    35.54162       233.2333           33.8000     995.6868        32.32246        23.21339
415: SP 2015   111.48808       160.0000          171.7083     938.6471        29.82265        19.14246
416: TO 2015   136.40627       153.1133          197.5444     977.6209        31.87839        22.17283
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1.2 Média por UF e estação: (if you need to break the analysis by station code, this is the data set)
-------------------------
- UF
- Estacao
- Year
- EvapoBHReal (média no ano)
- InsolacaoTotal (média no ano)
- PrecipitacaoTotal (média no ano)
- PressaoMedia (média no ano)
- TempMaximaMedia (média no ano)
- TempMinimaMedia (média no ano)

-------------------------
Extração resumida:
-------------------------
dt_mean_uf
      UF Estacao Year EvapoBHReal InsolacaoTotal PrecipitacaoTotal PressaoMedia TempMaximaMedia TempMinimaMedia
   1: RR   82024 2000         NaN       139.7250         161.12500          NaN        32.85642        23.61659
   2: RR   82042 2000         NaN       178.0750         193.58333          NaN        32.95303        22.12780
   3: AM   82067 2000         NaN       123.4750         335.27500     998.9511        32.50524        21.49478
   4: AP   82098 2000         NaN       189.9818         225.15000          NaN        31.29054        24.10500
   5: AM   82106 2000         NaN       132.8833         277.54167    1003.4275        32.42654        21.72892
  ---                                                                                                          
4178: RS   83967 2015   118.24432       215.2667         102.76667          NaN        30.20554        21.07734
4179: RS   83980 2015   100.93895       242.9333          92.26667     985.0358        28.44209        18.54631
4180: RS   83985 2015   114.98221            NaN               NaN          NaN             NaN             NaN
4181: RS   83995 2015         NaN            NaN         181.20000    1011.4500        29.27222        21.49444
4182: RS   83997 2015    87.98386       245.6667          85.70000    1010.4204        27.66302        18.82945

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
