library(dplyr)
library(ggplot2)

diabetes <- read.csv("/Users/meganstoppler/Downloads/diabetes_012_health_indicators_BRFSS2015.csv")

# scatter plot comparing age vs BMI
ggplot(data = diabetes_df, aes(x = Age)) +
  geom_point(aes(y = BMI)) +
  ggtitle("Age vs BMI") +
  labs(x = "Age", y = "BMI")

# if we wanted to clean up the graph by restricting age range
#
# new data frame to restrict age values
age_BMI_df <- diabetes_df %>%
  filter(Age > 6 & Age < 10.5)

# scatter plot comparing age vs BMI
ggplot(data = age_BMI_df, aes(x = Age)) +
  geom_point(aes(y = BMI)) +
  ggtitle("Age vs BMI") +
  labs(x = "Age", y = "BMI")

# scatter plot with group by age
ggplot(data = diabetes_df_byage, aes(x = Age)) +
  geom_point(aes(y = BMI)) +
  ggtitle("Age vs BMI") +
  labs(x = "Age", y = "BMI")
