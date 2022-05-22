library(dplyr)

diabetes <- read.csv("/Users/meganstoppler/Downloads/diabetes_012_health_indicators_BRFSS2015.csv")

# bar chart combining diabetes data
# BMI plotted on the x axis, number of cases plotted on the y xis
# each color represents a diabetes class

barchart_df <- diabetes_df %>%
  filter(BMI < 50)

color_order <- c("steelblue", "gold3", "gray45")
ggplot(data = barchart_df, aes(x = BMI, y = NumberofCases, fill = DiabetesClass)) +
  geom_bar(position = position_stack(reverse = TRUE), stat = "identity") +
  ggtitle("Cases of Diabetes vs BMI") +
  ylab("Number of Cases") +
  scale_fill_manual(name = "Diabetes Class", 
                    labels = c("No Diabetes", "Prediabetes", "Diabetes"), 
                    values = color_order) +
  scale_x_discrete(name = "BMI")

