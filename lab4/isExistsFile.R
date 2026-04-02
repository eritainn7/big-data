library(glue)

isExistsFile <- function (country, year) {
  return(
    file.exists(
      glue("~/kubsu/big-data/lab4/data/{country}/{year}.csv")
      )
         )
}