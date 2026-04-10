from selenium.webdriver.common.by import By

class Apartment:
    def __init__(self, apartment):
        self.__link = apartment.find('a').get('href')

        #x31de4314--_7735e--color_text-primary-default класс абзаца <p> с описанием
        p_description = apartment.select_one('p.x31de4314--_7735e--color_text-primary-default')
        self.__description = ""
        if p_description != None:
            self.__description = p_description.text

        #Адресс в <div class='x31de4314--_42135--labels'>
        self.__address = ""
        div_address = apartment.select_one('div.x31de4314--_42135--labels')
        if div_address != None:
            self.__address = div_address.text

        #Цена в <span data-mark="MainPrice"
        self.__cost = None
        span_cost = apartment.find('span', attrs={'data-mark': 'MainPrice'})
        if span_cost != None:
            self.__cost = span_cost.text

    def getLink(self):
        return self.__link

    def getDescription(self):
        return self.__description

    def getCharacters(self):
        pass

    def getAddress(self):
        return self.__address

    def getCost(self):
        return self.__cost

    def getPhoto(self):
        pass
