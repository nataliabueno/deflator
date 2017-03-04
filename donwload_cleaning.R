###########################
# Downloading IPCA series
# Cleaning and organizing
##########################

library(tidyverse)

#Downloading and unzipping
download.file(url = "ftp://ftp.ibge.gov.br/Precos_Indices_de_Precos_ao_Consumidor/IPCA/Serie_Historica/ipca_SerieHist.zip",
              destfile="~/Dropbox/deflator/ipca_serie.zip", cacheOK=F)

unzip(zipfile="~/Dropbox/deflator/ipca_serie.zip",
      exdir="~/Dropbox/deflator/")

#Cleaning

readxl("~/Dropbox/deflator/ipca_201701SerieHist.xls")
