import pandas as pd
import os
import shutil

# Loading a CSV file into a pandas DataFrame
df = pd.read_csv("in/tables/all_jobs_cleaned.csv")

# Splitting the DataFrame into smaller parts of 50 rows each
chunks = [df[i:i+50] for i in range(0, len(df), 50)]

# The target folder
output_dir = "/data/out/tables/"


# Saving each section in a separate CSV file in the out/tables output
for i, chunk in enumerate(chunks):
    file_name = f"all_jobs_cleaned_{i+1}.csv"
    file_path = os.path.join(output_dir, file_name)
    chunk.to_csv(file_path, index=False)
