# Import the Kaggle API, so you can use the pet description datasets
import kaggle
import zipfile
import pandas as pd
import matplotlib.pyplot as plt
import csv


from kaggle.api.kaggle_api_extended import KaggleApi

# This initializes the API
api = KaggleApi()

# This authenticates the API
api.authenticate()
lis1 = api.competitions_list(search='petfinder-adoption-prediction')
api.competition_download_files('petfinder-adoption-prediction')

# This opens the zip file
with zipfile.ZipFile('petfinder-adoption-prediction.zip', 'r') as vanilla:
    vanilla.extractall()

# Read the CSV file
readData = pd.read.csv('train/train.csv')
print(readData.shape)
print(readData.head(10))

with open('train.csv', newline='') as f:
    reader = csv.reader(f)
    for row in reader:
        print(row)

# Open data in STATA to run OLS and LASSO