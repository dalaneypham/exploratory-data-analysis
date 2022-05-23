library(dplyr)

diabetes <- read.csv("https://raw.githubusercontent.com/dalaneypham/exploratory-data-analysis/main/diabetes_012_health_indicators_BRFSS2015.csv")

# bar chart combining diabetes data
# BMI plotted on the x axis, number of cases plotted on the y xis
# each color represents a diabetes class

barchart_df <- diabetes_df %>%
  filter(BMI < 50)

color_order <- c("steelblue", "gold3", "gray45")
barchart <- ggplot(data = barchart_df, aes(x = as.factor(BMI), y = cases, fill = classdiabetes)) +
  geom_bar(position = position_stack(reverse = TRUE), stat = "identity") +
  ggtitle("Number of Diabetes Cases vs BMI Between Each Diabetes Class") +
  theme(plot.title = element_text(hjust = 0.5)) +
  ylab("Number of Cases") +
  scale_fill_manual(name = "Diabetes Class", 
                    labels = c("No Diabetes", "Prediabetes", "Diabetes"), 
                    values = color_order)
