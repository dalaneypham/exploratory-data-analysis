library(dplyr)
library(tidyverse)
library(ggplot2)

diabetes <- read.csv("https://raw.githubusercontent.com/dalaneypham/exploratory-data-analysis/main/diabetes_012_health_indicators_BRFSS2015.csv")

## distribution of age for each diabetes group
# using data frame defined in table.r file
# data frame used: diabetes_df
# Age plotted on the y xis
# each color represents a diabetes class

ggplot(data = diabetes_df, aes(x = DiabetesClass, y = Age, fill = DiabetesClass)) +
  geom_violin() +
  labs(x = "Diabetes Class", y = "Age") +
  scale_fill_manual(name = "Diabetes Class", 
                    values = c("steelblue", "gold3", "gray45"), 
                    labels = c("No Diabetes", "Prediabetes", "Diabetes")) +
  ggtitle("Patient Age vs Diabetes Class")