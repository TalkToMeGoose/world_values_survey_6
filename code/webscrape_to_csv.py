''' 

This function scrapes awebpage, turns it into text, 
and saves that as a raw text file.
Then it finds all table data '<td>'.
It replaces the spaces in the "country pair" table data 
with a comma and writes it to a csv.

'''

import re
import requests
import csv
from bs4 import BeautifulSoup

def read_write_text_from_url(url, filename):
    response = requests.get(url)
    soup = BeautifulSoup(response.text, "html.parser")
    soup_str = str(soup)
    with open(filename, 'wt', encoding = 'UTF-8') as textfile:
        textfile.write(soup_str)
    print('Textfile written!')
    return soup_str
        
def find_td_data_from_url(url):
    response = requests.get(url)
    soup = BeautifulSoup(response.text, "html.parser")
    td_data = str(soup.findAll('td'))  
    return td_data

def get_country_year_pairs(text):
    country_year_pairs = []
    for country_year in re.findall('<td>([A-Za-z]+\s\d+)', text):
        country_year_pairs.append(re.sub("\s", ",", country_year))
    return country_year_pairs

def write_csv(filename, text):
    with open(filename, 'wt') as textfile:
        textfile.write('Country,Year\n')
        for pair in text:
            textfile.write(pair + '\n')
    print('.csv written!')
    
# .csv file looks like:
# ```
# Country,Year
# Algeria,2014
# Argentina,2013
# ```

read_write_text_from_url('http://www.worldvaluessurvey.org/AJDocumentation.jsp?CndWAVE=6&COUNTRY=', '../data/raw/WVS_website.txt')
td_data = find_td_data_from_url('http://www.worldvaluessurvey.org/AJDocumentation.jsp?CndWAVE=6&COUNTRY=')
country_year_pairs = get_country_year_pairs(td_data)

write_csv('../data/derived/WVS_country_year.csv', country_year_pairs)