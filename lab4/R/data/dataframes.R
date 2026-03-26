library("rvest")

#"Украина", "Грузия", "Греция", "Израиль", "Нидерланды", "Катар", "Иородания"
getDataForCountries <- function(countries, years, source_data) {
  result <- c()
  for (year in years) {
    html_page <-read_html(paste(source_data, year, sep = ''))
    nodes <- html_nodes(html_page, 'table')

    table_data_year <- as.data.frame(html_table(nodes[2]))
    table_data_year <- table_data_year[table_data_year$Country %in% countries,]

    result <- append(result, table_data_year)
  }
  
  new_names <- c()
  for (year in years) {
    for (name in unique(names(result))) {
      new_name <- paste(name, year)
      new_names <- append(new_names, new_name)
    }
  }
  names(result) <- new_names
  
  return(result)
}


