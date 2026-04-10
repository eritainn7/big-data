from selenium.webdriver.common.by import By

class Apartment:
    def __init__(self, apartment):
        self.__link = apartment.find('a').get('href')

        #x31de4314--_7735e--color_text-primary-default класс абзаца <p> с описанием
        self.__description = ""

    def getLink(self):
        return self.__link

    def getDescription(self):
        return self.__description

    def getCharacters(self):
        pass

    def getAddress(self):
        pass

    def getCost(self):
        pass

    def getPhoto(self):
        pass
