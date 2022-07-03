*Emily Huang
*Professor McLaughlin and Professor Kim
*Big Data & Machine Learning Final Project
*12 May 2022

*cd "C:\Users\Emilyemlz\PycharmProjects\ECO 485 - Big Data & Machine Learning\bigDataMachineLearningProject"

*cd "C:\Users\Emilyemlz\PycharmProjects\ECO 485 - Big Data & Machine Learning\bigDataMachineLearningProject\test"

cd "C:\Users\Emilyemlz\PycharmProjects\ECO 485 - Big Data & Machine Learning\bigDataMachineLearningProject\train"

set more off

//close existing log files running in the background
capture log close

//command to start a log file
log using EmilyHuangBigDataPetAdoption.log, replace

*import delimited test, clear

import delimited train, clear

*Emily!! Make labels for these variables!

*splitsample, generate(sample) nsplit(2)

*tabulate sample
*Group 1 is our training data set
*Group 2 is our testing data set

rename type animaltype

label define animaltype 1 "Dog" 2 "Cat"
label define gender 1 "Male" 2 "Female" 3 "Mixed"
label define MaturitySize 1 "Small" 2 "Medium" 3 "Large" 4 "Extra Large" 0 "Not Specified"
label define FurLength 1 "Short" 2 "Medium" 3 "Long" 4 "Not Specified"
label define Vaccinated 1 "Yes" 2 "No" 3 "Not Sure"
label define Dewormed 1 "Yes" 2 "No" 3 "Not Sure"
label define Sterilized 1 "Yes" 2 "No" 3 "Not Sure"
label define Health 1 "Healthy" 2 "Minor Injury" 3 "Serious Injury" 0 "Not Specified"
label define fee 0 "Free"
label define State 41336 "Johor" 41325 "Kedah" 41367 "Kelantan" 41401 "Kuala Lumpur" 41415 "Labuan" 41324 "Melaka" 41332 "Negeri Sembilan" 41335 "Pahang" 41330 "Perak" 41380 "Perlis" 41327 "Pulau Pinang" 41345 "Sabah" 41342 "Sarawak" 41326 "Selangor" 41361 "Terengganu"

**Creating Dummy Variables
generate yesadopt = 0 if adoptionspeed == ((adoptionspeed == 0 & adoptionspeed == 1 & adoptionspeed == 2 & adoptionspeed == 3))
generate noadopt = 1 if adoptionspeed == 4
generate dog = 0 if animaltype == 1
generate cats = 1 if animaltype == 2
generate male = 0 if gender == 1
generate female = 1 if gender == 2


*Question 2 - Running OLS:
reg adoptionspeed animaltype age breed1 breed2 gender color1 color2 color3 maturitysize furlength vaccinated dewormed sterilized health quantity fee state videoamt photoamt

global pred_1 "animaltype age breed1 breed2 gender color1 color2 color3 maturitysize furlength vaccinated dewormed sterilized health quantity fee state videoamt photoamt"

*Question 3 - Running LASSO:
**The model with lambda = .0011041 will make the best predicton
lasso linear adoptionspeed $pred_1, fold(10)

**The graph confirms that the cross-validation function is minimized where lambda equals .0011041
cvplot

lassoselect id = 52
cvplot

**Google "Stata Lasso Intro" for lassolassointro.pdf or lassolasso.pdf
**Penalized Regressors / Lasso Coefficients / Only variables non-zero
**It shrinks the regression coefficients toward zero by penalizing the regression model with a penalty term
lassocoef, display(coef, penalized)

**Standardized Regressors
**Lasso regression puts constraints on the size of the coefficients associated to each variable. However, this value will depend on the magnitude of each variable. It is therefore necessary to center and reduce, or standardize, the variables.
lassocoef, display(coef, standardized)

**Unpenalized coefficients estimated by OLS
**calculated by taking the variables selected by lasso and refitting the model with the appropriate ordinary estimator
lassocoef, display(coef, postselection)

*Store all the models and display them
estimates store cv
lassoknots, display(nonzero osr2 variables)

*Question 4 - Running OLS for what LASSO selected:
reg adoptionspeed animaltype age breed1 breed2 gender color1 color2 color3 maturitysize furlength vaccinated dewormed sterilized health quantity fee state videoamt photoamt

*Question5 - Compare OLS and LASSO
*OLS gives evident factors that play a role in pet adoption: age, fee, breed, and color. After running the model that LASSO selected, it was marked with a "U" for unchanged variables.

log close