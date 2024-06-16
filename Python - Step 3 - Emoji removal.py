import pandas as pd
import re

def remove_emoji(text):
    emoji_pattern = re.compile("["
                               u"\U0001F600-\U0001F64F"  # emoticons
                               u"\U0001F300-\U0001F5FF"  # symbols and pictograms
                               u"\U0001F680-\U0001F6FF"  # traffic and map symbols
                               u"\U0001F700-\U0001F77F"  # other symbols
                               u"\U0001F780-\U0001F7FF"  
                               u"\U0001F800-\U0001F8FF"  
                               u"\U0001F900-\U0001F9FF"  
                               u"\U0001FA00-\U0001FA6F"  
                               u"\U0001FA70-\U0001FAFF"  
                               u"\U00002702-\U000027B0"  
                               u"\U000024C2-\U0001F251"     
                               "]+", flags=re.UNICODE)
    # Emoji removal
    text_without_emoji = emoji_pattern.sub(r'', text)

    # Removal of excess spaces at the beginning, middle and end of the text
    cleaned_text = ' '.join(text_without_emoji.split())
	
    return cleaned_text
  
def strip_spaces(text):
  # Removal of excess spaces at the beginning and end of the text
  return text.strip()

# Loading the all_jobs.csv file into a pandas DataFrame
df = pd.read_csv("in/tables/all_jobs.csv")

# Looping through the positionName column and applying the remove_emoji function to each position name
df['positionName'] = df['positionName'].apply(remove_emoji)

# Looping through the company column and applying the strip_spaces function to each company name
df['company'] = df['company'].apply(strip_spaces)

# Save the DataFrame to a new CSV file
df.to_csv("out/tables/all_jobs_cleaned.csv", index=False)
