# Prediction of Animal Shelter Adoption Rates
OLS prediction and LASSO regression model comparison and presentation of data regressors through supervised learning to identify which variables influence high pet adoption rates

*Data set is from Kaggle, but created customized prompt for class project

## Purpose of Research
###### 1. To Understand how does Ordinary Least Squares (OLS) interpret variables that contribute to high or low pet adoption rates.
###### 2. To Understand how does Least Absolute Shrinkage and Selection Operator (LASSO) interpret variables that contribute to high or low pet adoption rates.
###### 3. To compare and understand the results between OLS and LASSO.

## Descriptive Variables

| Variable Name  | Description |
| ------------- |:-------------:|
| PetID      | Unique hash ID of pet profile     |
| AdoptionSpeed      | This is the value to predict. The value is determined by how quickly, if at all, a pet is adopted. The values are determined in the following way: 0 - Pet was adopted on the same day as it was listed. 1 - Pet was adopted between 1 and 7 days (1st week) after being listed. 2 - Pet was adopted between 8 and 30 days (1st month) after being listed. 3 - Pet was adopted between 31 and 90 days (2nd & 3rd month) after being listed. 4 - No adoption after 100 days of being listed. (There are no pets in this dataset that waited between 90 and 100 days).     |
| Name      | Name of pet (Empty if not named)     |
| Age      | Age of pet when listed, in months     |
| Breed1      | Primary breed of pet     |
| Breed2      | Secondary breed of pet     |
| Gender      | Gender of pet (1 = Male, 2 = Female, 3 = Mixed, if profile represents group of pets)     |
| Color1      | Color 1 of pet     |
| Color2      | Color 2 of pet     |
| Color3      | Color 3 of pet     |
| MaturitySize      | Size at maturity (1 = Small, 2 = Medium, 3 = Large, 4 = Extra Large, 0 = Not Specified)     |
| FurLength      | Fur length (1 = Short, 2 = Medium, 3 = Long, 0 = Not Specified)     |
| Vaccinated      | Pet has been vaccinated (1 = Yes, 2 = No, 3 = Not Sure)     |
| Dewormed      | Pet has been dewormed (1 = Yes, 2 = No, 3 = Not Sure)     |
| Sterilized      | Pet has been spayed / neutered (1 = Yes, 2 = No, 3 = Not Sure)     |
| Health      | Health Condition (1 = Healthy, 2 = Minor Injury, 3 = Serious Injury, 0 = Not Specified)     |
| Quantity      | Number of pets represented in profile     |
| Fee      | Adoption fee (0 = Free)     |
| State      | State location in Malaysia      |
| RescuerID      | Unique hash ID of rescuer     |
| VideoAmt      | Total uploaded videos for this pet     |
| PhotoAmt      | Total uploaded photos for this pet     |



## Model Used
**AdoptionSpeed = ??0 + ??1(animaltype) + ??2(age) + ??3(breed1) + ??4(breed2) + ??5(gender) + ??6(color1) + ??7(color2) + ??8(color3) + ??9(maturitysize) + ??10(furlength) + ??11(vaccinated) + ??12(dewormed) + ??13(sterilized) + ??14(health) + ??15(quantity) + ??16(fee) + ??17(state) + ??18(videoamt) + ??19(photoamt) + ??i**

