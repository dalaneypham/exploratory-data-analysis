library(dplyr)
library(tidyverse)
library(ggplot2)

diabetes <- read.csv("https://raw.githubusercontent.com/dalaneypham/exploratory-data-analysis/main/diabetes_012_health_indicators_BRFSS2015.csv")

# bar chart combining diabetes data
# using data frame defined in table.r file
# data frame used: diabetes_df
# BMI plotted on the x axis, number of cases plotted on the y xis
# each bar represents a BMI value
# each color represents a diabetes class

# new data frame restricting BMI values to make graph easier to read
barchart_df <- diabetes_df %>%
  filter(BMI < 50)

# make bar chart
color_order <- c("steelblue", "gold3", "gray45")
ggplot(data = barchart_df, aes(x = BMI, y = NumberofCases, fill = DiabetesClass)) +
  geom_bar(position = position_stack(reverse = TRUE), stat = "identity") +
  ggtitle("Number of Cases vs BMI in Each Diabetes Class") +
  labs(x = "BMI", y = "Number of Cases") +
  scale_fill_manual(name = "Diabetes Class", 
                    labels = c("No Diabetes", "Prediabetes", "Diabetes"), 
                    values = color_order)
