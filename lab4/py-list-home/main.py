from selenium import webdriver
from bs4 import BeautifulSoup
from Apartment import Apartment
from selenium.webdriver.firefox.options import Options
from ApartmentCharactes import ApartmentCharacters

options = Options()
options.add_argument("--headless")

source = "https://krasnodar.cian.ru/cat.php?deal_type=sale&engine_version=2&location%5B0%5D=4820&offer_type=flat&region=4820&source=search_string"
driver = webdriver.Firefox(options=options)
driver.get(source)

#<div class='x31de4314--_5d947--wrapper'></div>
html_source = driver.page_source
soup = BeautifulSoup(html_source, 'html.parser')

apartments = soup.find('div', {'class': 'x31de4314--_5d947--wrapper'})
list_apartments = apartments.find_all('article')

DATA_APARTS = []
for aprt in list_apartments:
    entity_aprt = Apartment(aprt)
    dict_chrcts = ApartmentCharacters(entity_aprt.getLink(), driver).getCharcters()

    DATA_APARTS.append({
        "apartment": entity_aprt,
        "characters": dict_chrcts
    })
    
driver.quit()