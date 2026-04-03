#html-классы элементов, которые надо спарсить main_col__f5Jmt(в эти DOM-элементы вложены интересующие нас ссылки)
library("rvest")

html_page <- read_html("https://www.culture.ru/museums/institutes/location-krasnodarskiy-kray-krasnodar") #Страница с ссылками

museum_div <- html_nodes(html_page, '.main_col__f5Jmt')

#styles_BaseCard__Title__5Xctv класс блоков, вложенных в блоки museum_div, которые содержат названия музеев 
museums_names <- html_text(
  html_nodes(museum_div, '.styles_BaseCard__Title__5Xctv')
  )

refs_museums <- html_nodes(museum_div, 'a') %>% html_attr("href")

#Получим адреса и описания музеев
cite <- "https://www.culture.ru"


addreses <- c()
info_museums <- c()
for (ref in refs_museums) {
  #styles_place__KMUBA класс обёртки ссылок, содержащих адреса музеев
  museum_page <- read_html(
    paste(cite, ref, sep='')
  )
  Sys.sleep(0.1)
  addres_museum <- html_nodes(museum_page, '.styles_place__KMUBA>a') %>% html_text()
  addreses <- c(addreses, addres_museum)
  
  #Класс блока, содержащего информацию о музее styles_body__WEo9w
  info_museum <- html_nodes(museum_page, '.styles_body__WEo9w') %>% html_text()
  info_museums <-c(info_museums, info_museum)
}

df_museums <- data.frame(
  museums_names, addreses, info_museums, refs_museums
)
write.csv(df_museums, "~/kubsu/big-data/lab4/museum/museums_base.csv")
