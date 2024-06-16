import pandas as pd
import re

# Loading a CSV file into a pandas DataFrame
df = pd.read_csv('in/tables/linkedin-jobs.csv')

# Extracting ID from url line
def extract_id(url):
    match = re.search(r'(\d+)\?', url)
    return match.group(1) if match else None

# Creating a new column with ID and saving it to a new file
df['jobID'] = df['jobUrl'].apply(extract_id)
df.to_csv("out/tables/linkedin_jobs_extracted_id.csv", index=False)
