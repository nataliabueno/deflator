###########################
# Downloading IPCA series
# Cleaning and organizing
##########################

library(readxl)
library(tidyverse)
library(stringr)

#Downloading and unzipping
download.file(url = "ftp://ftp.ibge.gov.br/Precos_Indices_de_Precos_ao_Consumidor/IPCA/Serie_Historica/ipca_SerieHist.zip",
              destfile="~/Dropbox/deflator/ipca_serie.zip", cacheOK=F)

unzip(zipfile="~/Dropbox/deflator/ipca_serie.zip",
      exdir="~/Dropbox/deflator/")

#Cleaning

ipca <- read_excel("~/Dropbox/deflator/ipca_201701SerieHist.xls")
ipca <- ipca[-c(1:6),]
names(ipca) <- c("ano", "mes", "numero_indice", "no_mes", "tres_meses", 
                 "seis_meses", "no_ano", "doze_meses")
ipca$ano <- gsub("Fonte: IBGE, Diretoria de Pesquisas, Coordenação de Índices de Preços, ", 
                 NA, ipca$ano)
ipca$ano <- gsub("SÉRIE HISTÓRICA DO IPCA", 
                 NA, ipca$ano)
ipca$ano <- gsub("ANO", 
                 NA, ipca$ano)
ipca$ano <- gsub("Sistema Nacional de Índices de Preços ao Consumidor.", 
                 NA, ipca$ano)
ipca <- ipca %>% filter(mes != "MÊS") %>% 
        mutate(ano = as.numeric(ano),
               numero_indice = as.numeric(numero_indice),
               no_mes = as.numeric(no_mes),
               tres_meses = as.numeric(tres_meses),
               seis_meses = as.numeric(seis_meses),
               no_ano = as.numeric(no_ano),
               doze_meses = as.numeric(doze_meses))

#Pick month and year for reference
#For exampe, January 2017

ipca <- ipca %>% mutate(deflator = numero_indice/(ipca$numero_indice[nrow(ipca)]))
                                                   

