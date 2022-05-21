library(dplyr)

diabetes <- read.csv("/Users/meganstoppler/Downloads/diabetes_012_health_indicators_BRFSS2015.csv")

# new data frame to restrict age values
age_BMI_df <- diabetes_df %>%
  filter(age > 6 & age < 10.5)

# scatter plot comparing age vs BMI
ggplot(data = age_BMI_df, aes(x = age)) +
  geom_point(aes(y = BMI)) +
  ggtitle("Age vs BMI") +
  labs(x = "Age", y = "BMI")
