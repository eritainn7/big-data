source("~/kubsu/big-data/lab4/R/data/dataframes.R")

countries <- c("Ukraine", "Georgia", "Greece", "Israel", "Netherlands", "Qatar", "Jordan")
years <- 2014:2026
source_data <- "https://www.numbeo.com/quality-of-life/rankings_by_country.jsp?title=" #После title добавить соответствующий год

#Данные для построения графиков
dataframes_with_indexes <- getDataForCountries(countries, years, source_data) # Получаем данные для построения графиков
dataframes_with_indexes
#Функция для построения графиков изменения индексов стран
generatePlots <- function() {
  
}


