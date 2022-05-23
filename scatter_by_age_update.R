library(dplyr)
library(ggplot2)

diabetes <- read.csv("https://raw.githubusercontent.com/dalaneypham/exploratory-data-analysis/main/diabetes_012_health_indicators_BRFSS2015.csv")

## scatter plot comparing age vs BMI
# using data frame defined in table.r file
# data frame used: diabetes_df_byage
# Age plotted on the x axis, BMI plotted on the y xis
# each color represents a diabetes class
# each point represents an age

# data frames to isolate BMI by diabetes class
diabetes0 <- diabetes_df_byage %>%
  filter(DiabetesClass == 0) %>%
  select(Age, BMI)
colnames(diabetes0)[2] <- "BMI0"

diabetes1 <- diabetes_df_byage %>%
  filter(DiabetesClass == 1) %>%
  select(Age, BMI)
colnames(diabetes1)[2] <- "BMI1"

diabetes2 <- diabetes_df_byage %>%
  filter(DiabetesClass == 2) %>%
  select(Age, BMI)
colnames(diabetes2)[2] <- "BMI2"

#merge data frames together
diabetes01 <- merge(diabetes0, diabetes1, by = "Age", all.x = TRUE)
diabetes012 <- merge(diabetes01, diabetes2, by = "Age", all.x = TRUE)
  
# make scatter plot
ggplot(data = diabetes012, aes(x = Age)) +
  geom_point(aes(y = BMI0, color = "gold3")) +
  geom_point(aes(y = BMI1, color = "gray45")) +
  geom_point(aes(y = BMI2, color = "steelblue")) +
  ggtitle("Patient Age vs BMI Between Each Diabetes Class") +
  theme(plot.title = element_text(hjust = 0.5)) +
  labs(x = "Age", y = "BMI") +
  scale_color_manual(name = "Diabetes Class", labels = c("No Diabetes", "Prediabetes", "Diabetes"), 
                     values = c("steelblue", "gold3", "gray45")) 

