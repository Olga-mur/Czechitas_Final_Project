import pandas as pd
import openai
from pinecone import Pinecone, ServerlessSpec
import os

# Loading an API key
openai.api_key = '*******'

# Pinecone initialization with API key entry
pc = Pinecone(api_key='*******')

# Connecting to the index
index = pc.Index('categories')

# Creating an embed from text using the "text-embedding-ada-002" model
# This step calls the OpenAI API and saves the answer in the response variable.
# Note: This response is no longer used in the function, it is left here perhaps for debugging or future extensions.

def get_first_k(text):
  response = openai.embeddings.create(
      input=text,
      model="text-embedding-ada-002"  # embedding model
  )

# Extracting the embedded vector from the API response
# Calling the OpenAI API and this time directly extracting the embedding from the answer.
  xq = openai.embeddings.create(input=text, model="text-embedding-ada-002").data[0].embedding
# Query the index to get the 10 most similar items to the given embedded vector
# Using the extracted embedding vector xq and executing a query the index
# top_k=10 specifies that we want to get the 10 most similar results
# include_metadata=True will ensure that the response includes result metadata
  res = index.query(vector=[xq], top_k=10, include_metadata=True)
  return res

# Loading a CSV file with a skills table into a DataFrame
df = pd.read_csv('in/tables/skills.csv')

# Iterating through each row in the dataframe
for row_index, row in df.iterrows():
    search_term = row['skill']
    matches = get_first_k(search_term)

    score = matches['matches'][0]['score']   # Extracting the score of the most similar result
    name = matches['matches'][0]['metadata']['name']  # Extracting the name of the most similar result from the metadata
    category_id = matches['matches'][0]['metadata']['category_id']   # Extracting the category ID of the most similar result from the metadata

    # Determining parent_category based on score
    if score > 0.42:
        parent_category = "null"  # The score is high enough, the category is unknown
    else:
        parent_category = name  # The score is low, we use the name of the most similar result as the category

    # Updating "parent_category" column
    df.at[row_index, 'parent_category'] = parent_category

# Saving the DataFrame to a new CSV file
df.to_csv('out/tables/skills_parent_category.csv', index=False)
