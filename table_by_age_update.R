library(dplyr)
library(tidyverse)

diabetes <- read.csv("https://raw.githubusercontent.com/dalaneypham/exploratory-data-analysis/main/diabetes_012_health_indicators_BRFSS2015.csv")

# adding a column to total the number of cases for each BMI/Diabetes group
diabetes <- mutate(diabetes, count = 1)
diabetes <- mutate(diabetes, classdiabetes = as.character(Diabetes_012))

# data frame including important values
# data frame grouped by age and class of diabetes for scatter plot
diabetes_df_byage <- diabetes %>%
  select(Age, classdiabetes, PhysActivity, BMI, HighBP, HighChol, Smoker, GenHlth, count) %>%
  group_by(Age, classdiabetes) %>%
  summarize(physical_activity = round(mean(PhysActivity), 1), 
            high_bp = round(mean(HighBP), 1), 
            high_chol = round(mean(HighChol), 1), 
            smoker = round(mean(Smoker), 1), 
            genhealth = round(mean(GenHlth), 1),
            BMI = round(mean(BMI), 1), 
            cases = sum(count))
# data frame grouped by BMI and class of diabetes for bar chart and violin plot
diabetes_df <- diabetes %>%
  select(Age, classdiabetes, PhysActivity, BMI, HighBP, HighChol, Smoker, GenHlth, count) %>%
  group_by(BMI, classdiabetes) %>%
  summarize(physical_activity = round(mean(PhysActivity), 1), 
            high_bp = round(mean(HighBP), 1), 
            high_chol = round(mean(HighChol), 1), 
            smoker = round(mean(Smoker), 1), 
            genhealth = round(mean(GenHlth), 1),
            Age = round(mean(Age), 1), 
            cases = sum(count))

# change column names to be readable
colnames(diabetes_df_byage) <- c("Age", "DiabetesClass", "PhysicalActivity", 
                           "HighBloodPressure", "HighCholesterol", "Smoker", 
                           "GeneralHealth", "BMI", "NumberofCases")

colnames(diabetes_df) <- c("BMI", "DiabetesClass", "PhysicalActivity", 
                                 "HighBloodPressure", "HighCholesterol", "Smoker", 
                                 "GeneralHealth", "Age", "NumberofCases")

