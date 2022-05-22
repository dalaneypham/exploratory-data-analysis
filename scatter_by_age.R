library(dplyr)
library(ggplot2)

#diabetes <- read.csv("/Users/meganstoppler/Downloads/diabetes_012_health_indicators_BRFSS2015.csv")
diabetes <- read.csv("https://raw.githubusercontent.com/dalaneypham/exploratory-data-analysis/main/diabetes_012_health_indicators_BRFSS2015.csv")

# scatter plot comparing age vs BMI
diabetes0 <- diabetes_df_byage %>%
  filter(DiabetesClass == 0) %>%
  select("BMI")
colnames(diabetes0)[2] <- "BMI0"

diabetes1 <- diabetes_df_byage %>%
  filter(DiabetesClass == 1) %>%
  select("BMI")
colnames(diabetes1)[2] <- "BMI1"

diabetes2 <- diabetes_df_byage %>%
  filter(DiabetesClass == 2) %>%
  select("BMI")
colnames(diabetes2)[2] <- "BMI2"

diabetes01 <- merge(diabetes0, diabetes1, by.y = "Age", all.x = TRUE)
diabetes012 <- merge(diabetes01, diabetes2, by.y = "Age", all.x = TRUE)
  
scatter <- ggplot(data = diabetes012, aes(x = Age)) +
  geom_point(aes(y = BMI0, color = "gold3")) +
  geom_point(aes(y = BMI1, color = "gray45")) +
  geom_point(aes(y = BMI2, color = "steelblue")) +
  ggtitle("Patient Age vs BMI Between Each Diabetes Class") +
  theme(plot.title = element_text(hjust = 0.5)) +
  labs(x = "Age", y = "BMI") +
  scale_color_manual(name = "Diabetes Class", labels = c("No Diabetes", "Prediabetes", "Diabetes"), 
                     values = c("steelblue", "gold3", "gray45")) 

# if we wanted to clean up the graph by restricting age range
#
# new data frame to restrict age values
age_BMI_df <- diabetes_df_byage %>%
  filter(Age > 6 & Age < 10.5)

# scatter plot comparing age vs BMI
ggplot(data = age_BMI_df, aes(x = Age)) +
  geom_point(aes(y = Age)) +
  ggtitle("Age vs BMI") +
  labs(x = "Age", y = "BMI")