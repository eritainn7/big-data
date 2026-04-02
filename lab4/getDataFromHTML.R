library("rvest")

getDataForHTML <- function(country, year) {
  page <- read_html(paste("https://www.numbeo.com/quality-of-life/rankings_by_country.jsp?title=", year, sep=''))
  nodes <- html_nodes(page, 'table')
  
  table_data_year <- as.data.frame(html_table(nodes[2]))
  table_data_year <- table_data_year[table_data_year$Country %in% country,]
  
  return(table_data_year)
}
