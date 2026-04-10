from bs4 import BeautifulSoup
from selenium import webdriver

class ApartmentCharacters:
    def __init__(self, link: str, driver):
        driver.get(link)
        source = driver.page_source
        soup = BeautifulSoup(source, 'html.parser')

        self.__dict_charcts = {}
        self.__calculateCharacterFromSource(soup)
    
    def __calculateCharacterFromSource(self, soup: BeautifulSoup):
        #<div data-name="ObjectFactoids"> должно быть в DOM_node
        div_item_charcts = soup.find_all('div', attrs={'data-name' : "ObjectFactoidsItem"})
        for item in div_item_charcts:

            #Класс xa15a2ab7--_10cdd--color_gray60_100 для span с названием характеристики
            name_charct = item.select_one('span.xa15a2ab7--_10cdd--color_gray60_100').text

            value_charct = item.select_one('span.xa15a2ab7--_7735e--color_text-primary-default').text
            self.__dict_charcts[name_charct] = value_charct

    def getCharcters(self):
        return self.__dict_charcts