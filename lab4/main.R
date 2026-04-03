# Получить данные для Украина, Грузия, Греция, Израиль, Нидерланды, Катар, Иордания
source("~/kubsu/big-data/lab4/getDataFromHTML.R")
source("~/kubsu/big-data/lab4/saveDataToCSV.R")
source("~/kubsu/big-data/lab4/isExistsFile.R")

countries <- c("Ukraine", "Georgia", "Greece", "Israel", "Netherlands")
years <- 2014:2026

for (country in countries) {
  for (year in years) {
    if (isExistsFile(country, year) == FALSE) {
      getDataForHTML(country, year) %>% saveDataToCSV(country, year)
    }
  }
}

#Визуализация данных по странам
