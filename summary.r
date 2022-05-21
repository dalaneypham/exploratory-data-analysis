# + [Diabetes](https://www.kaggle.com/datasets/alexteboul/diabetes-health-indicators-dataset) Data
# + The data was downloaded from [Kaggle](https://www.kaggle.com/datasets/alexteboul/diabetes-health-indicators-dataset)
# + This data was collected from the Behavioral Risk Factor Surveillance System telephone survey that is annually collected by the CDC. This 2015 report consists of responses to surveys by American patients and questions them on health-related risk behaviors, chronic health conditions, and the use of preventative services. 
# + There are 253,680 rows in the dataset
# + There are 22 columns in the dataset
# + This data will help us analyze how lifestyle choices can impact one's health and their access to appropriate types of care. 
#   
library("dplyr")
library("tidyverse")
diabetes_df <- read.csv("/Users/meganstoppler/Downloads/diabetes_012_health_indicators_BRFSS2015.csv")

age <- diabetes_df[, c('Age')]

physical_activity <- diabetes_df[, c('PhysActivity')]

BMI <- diabetes_df[, c('BMI')]

high_bp <- diabetes_df[,c ('HighBP')]

diabetes_count <- diabetes_df[, c ('Diabetes_012')]

mean_age <- mean(age)
max_age <- max(age)
min_age <- min(age)

# From this data set we have gathered that the minimum age for those who have diabetes is 1 and the maximum age is 13.
# The average age from the total patients who have diabetes is 8 years old as seen in the box plot as well.
# From the scatter plot, we can see that a small amount of patients that were classified as prediabetic had a BMI of about 80-100.
