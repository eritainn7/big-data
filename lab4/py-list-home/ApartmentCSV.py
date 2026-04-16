from Apartment import Apartment
import csv

class ApartmentCSV:
    def __init__(self, DATA_APARTS):
        self.__DATA_APARTS = DATA_APARTS
        
    def saveToCSV(self, filename: str):
        with open(f'{filename}.csv', 'w', newline='', encoding='utf-8') as file:
            fieldnames = self.__DATA_APARTS[0].keys()
            writer = csv.DictWriter(file, fieldnames=fieldnames)
            
            writer.writeheader()
            
            writer.writerows(self.__DATA_APARTS)