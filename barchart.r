library(dplyr)

diabetes <- read.csv("https://raw.githubusercontent.com/dalaneypham/exploratory-data-analysis/main/diabetes_012_health_indicators_BRFSS2015.csv")

# bar chart for diabetes
Diabetes_df <- diabetes %>%
  filter(Diabetes_012 == 2)

ggplot(data = Diabetes_df, aes(x = BMI)) +
  geom_bar()

# bar chart for prediabetes
Prediabetes_df <- diabetes %>%
  filter(Diabetes_012 == 1)

ggplot(data = Prediabetes_df, aes(x = BMI)) +
  geom_bar()

# bar chart for no diabetes
NoDiabetes_df <- diabetes %>%
  filter(Diabetes_012 == 0)

ggplot(data = NoDiabetes_df, aes(x = BMI)) +
  geom_bar()

# bar chart combining diabetes data
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
