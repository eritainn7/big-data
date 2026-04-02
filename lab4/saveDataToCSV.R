library(glue)

saveDataToCSV <- function(frame, country, year) {
  path_to_csv <- glue("~/kubsu/big-data/lab4/data/{country}/{year}.csv")
  dir.create(glue("~/kubsu/big-data/lab4/data/{country}/", recursive=TRUE))
  
  write.csv(frame, file=path_to_csv)
}