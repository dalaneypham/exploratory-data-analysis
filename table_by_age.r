library(dplyr)

diabetes <- read.csv("https://raw.githubusercontent.com/dalaneypham/exploratory-data-analysis/main/diabetes_012_health_indicators_BRFSS2015.csv")

# adding a column to total the number of cases for each BMI/Diabetes group
diabetes <- mutate(diabetes, count = 1)
diabetes <- mutate(diabetes, classdiabetes = as.character(Diabetes_012))

# data frame including important values
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


# * Table Summary
# + I included these 5 variables in my table because these seemed the most generic and useful information. 
# + The other variables were not irrelevant to personal health such as education and insurance.
# + Diabities was included because this what our topic is about.
# + Age is important to determine the range of ages for diabetes
# + PhysActivity shows how diabetes flunctuates.
# + BMI shows the risk of diabetes.
# + HighBP increases risk of diabetes 1 or diabetes 2.
