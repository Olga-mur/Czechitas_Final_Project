import pandas as pd
import openai
from pinecone import Pinecone, ServerlessSpec
import os

# Loading an API key
openai.api_key = '*******'

# Pinecone initialization with API key entry
pc = Pinecone(api_key='*******')

# Definition of index name in the Pinecone vector database
index_name = 'categories'

# Deleting the index if it exists and creating a new one with the specified parameters
if index_name in pc.list_indexes().names():
    pc.delete_index(index_name)

pc.create_index(name=index_name,
                dimension=1536,
                metric='euclidean',
                spec=ServerlessSpec(cloud='aws', region='us-east-1'))

# Connecting to the index
# Initializing the index using the index name
index = pc.Index(index_name)

# List of categories with their names, definitions and IDs
categories = [
    {
        "name": "Artificial Intelligence",
        "definition":
        "artificial intelligence,ai,genai,ml,machine learning,gpt,llm",
        "category_id": 1
    },
    {
        "name": "Programming Languages",
        "definition":
        "programming languages,python,java,javascript,c#,ruby,go,swift,kotlin,php",
        "category_id": 2
    },
    {
        "name": "Web Development",
        "definition":
        "web development,css,html,rest api,https,react,wordpress,angular,node.js,django,flask,bootstrap",
        "category_id": 3
    },
    {
        "name": "Data Engineering & Analysis",
        # The original, more detailed definition is commented out
        # "definition": "data engineering & analysis, data governance, data modelling, data storytelling, snowflake, sql, pandas, etl (extract, transform, load), data pipelines, data cleansing, data integration, data mining, data analysis, olap (online analytical processing)",
        "definition":
        "data engineering & analysis,snowflake,excel,sql,pandas,etl,redis,r,olap",
        "category_id": 4
    },
    {
        "name": "Automation & Testing",
        "definition":
        "automation & testing,api automation,apify,exploratory testing,postman,ui automation,selenium,jenkins,junit",
        "category_id": 5
    },
    {
        "name": "Cyber Security",
        "definition":
        "cyber security,s/mime,ssl/tls,ipsec,dnssec,cia triad,zabbix,mitre att&ck,osint,social engineering,ids,ips,siem",
        "category_id": 6
    },
    {
        "name": "Networking",
        "definition":
        "networking,http,smtp,icmp,tcpdum,wireshark,lan,wan,vpn,dns,tcp/ip,dhcp,iso/osi model",
        "category_id": 7
    },
    {
        "name": "Visualization & Reporting",
        "definition":
        "visualization & reporting,power bi,tableau,google looker studio,google analytics",
        "category_id": 8
    },
    {
        "name": "Big Data & Cloud",
        "definition":
        "big data & cloud,hadoop,apache spark,nosql databases,aws,azure,docker,keboola",
        "category_id": 9
    },
    {
        "name": "Version Control & Collaboration",
        "definition":
        "version control & collaboration,git,mercurial,perforce,cvs,bitkeeper,clearcase,darcs,monotone",
        "category_id": 10
    },
    {
        "name": "Business & Productivity Tools",
        "definition":
        "business & productivity tools,grc,agile,microsoft 365,salesforce,trello,slack,english language",
        "category_id": 11
    },
    {
        # The original name is commented out
        # "name": "Command Line & Scripting",
        "name": "Operating Systems & System Administration",
        "definition":
        "Operating Systems & System Administration,windows, server,linux,VMware,Hyper-V,bash,powershell",
        "category_id": 12
    },
    {
        "name": "UX/UI Design",
        "definition":
        "ux/ui design,figma,sketch,adobe xd,invision,axure rp,balsamiq,canva",
        "category_id": 13
    },
]


# Functions for getting embeddings and preparing data for indexing
def get_embeddings(id, name, definition, category_id):
    # Creating embed from definition using model "text-embedding-ada-002"
    response = openai.embeddings.create(input=definition,
                                        model="text-embedding-ada-002")

    # Extracting embeddings from API response
    embeds = [record.embedding for record in response.data]

    # Preparing metadata for indexing
    meta = [{'name': name,'definition': definition,'category_id': category_id}]
    ids = [str(id)]
    to_upsert = zip(ids, embeds, meta)
    return to_upsert


# Embedding calculation and data preparation for Pinecone
data = []
for idx, category in enumerate(categories):
    embedding = get_embeddings(idx, category['name'], category['definition'],category['category_id'])
    data.extend(embedding)

# Upsert data to Pinecone
index.upsert(vectors=data)

print("Embeddings successfully uploaded to Pinecone!")  #not necessary but just to make sure everything went well
