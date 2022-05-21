library(dplyr)

diabetes <- read.csv("https://raw.githubusercontent.com/info201b-2022-spring/final-projects-achandru1/main/data/diabetes_012_health_indicators_BRFSS2015.csv?token=GHSAT0AAAAAABUCQWQBL5HAR5HH5P2HP3KMYUII4IQ")

# data frame including important values

diabetes_df <- diabetes %>%
  select(Diabetes_012, PhysActivity, BMI, HighBP, HighChol, Smoker, GenHlth) %>%
  group_by(BMI, Diabetes_012) %>%
  summarize(physical_activity = round(mean(PhysActivity), 1), 
            high_bp = round(mean(HighBP), 1), high_chol = round(mean(HighChol), 1), 
            smoker = round(mean(Smoker), 1), genhealth = round(mean(GenHlth), 1))

# change column names to be readable

colnames(diabetes_df) <- c("BMI", "Diabetes Class", "Physical Activity", 
                           "High Blood Pressure", "High Cholesterol", "Smoker", 
                           "General Health")


# * Table Summary
# + I included these 5 variables in my table because these seemed the most generic and useful information. 
# + The other variables were not irrelevant to personal health such as education and insurance.
# + Diabities was included because this what our topic is about.
# + Age is important to determine the range of ages for diabetes
# + PhysActivity shows how diabetes flunctuates.
# + BMI shows the risk of diabetes.
# + HighBP increases risk of diabetes 1 or diabetes 2.
