library("rvest")

#"Украина", "Грузия", "Греция", "Израиль", "Нидерланды", "Катар", "Иородания"
getDataForCountries <- function(countries, years, source_data) {
  result <- c()
  for (year in years) {
    html_page <-read_html(paste(source_data, year, sep = ''))
    nodes <- html_nodes(html_page, 'table')
    
    table_data_year <- as.data.frame(html_table(nodes[2]))
    table_data_year <- table_data_year[table_data_year$Country %in% countries,]
    
    #Добавим к наименованиям год, чтоб не было перекрытий
    
    
    result <- append(result, table_data_year)
  }
 
  return(result)
}

