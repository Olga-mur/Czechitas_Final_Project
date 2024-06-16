import pandas as pd
from bs4 import BeautifulSoup

# Loading a CSV file into a pandas DataFrame
df = pd.read_csv("in/tables/jobs_cz_full_text_2024-03-25_to_2024-04-10.csv")#, nrows=100)

# Extracting the position description from the html code
def extract_description(html_content):
  soup = BeautifulSoup(html_content, 'lxml')
  description_div = soup.find('div', class_='RichContent mb-1400') 
  if description_div:
    return description_div.text
  else:
    return None


# Creating a new column with a description and saving it to a new file
df['description'] = df['bodyHtml'].apply(extract_description)
df.to_csv("out/tables/extracted_descriptions.csv", index=False)
