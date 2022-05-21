library(dplyr)

diabetes <- read.csv("/Users/meganstoppler/Downloads/diabetes_012_health_indicators_BRFSS2015.csv")

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

color_order <- c("steelblue", "gray35", "lightslategray")
ggplot(data = barchart_df, aes(x = BMI, y = NumberofCases, fill = DiabetesClass)) +
  geom_bar(position = position_stack(reverse = TRUE), stat = "identity") +
  ggtitle("Cases of Diabetes vs BMI") +
  ylab("Number of Cases") +
  scale_fill_manual(name = "Diabetes Class", 
                    labels = c("No Diabetes", "Prediabetes", "Diabetes"), 
                    values = color_order) +
  scale_x_discrete(name = "BMI")

