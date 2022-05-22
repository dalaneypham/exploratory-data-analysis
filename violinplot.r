library(dplyr)

#diabetes <- read.csv("/Users/meganstoppler/Downloads/diabetes_012_health_indicators_BRFSS2015.csv")
diabetes <- read.csv("https://raw.githubusercontent.com/dalaneypham/exploratory-data-analysis/main/diabetes_012_health_indicators_BRFSS2015.csv")

# distribution of age for each diabetes group
violin <- ggplot(data = diabetes_df, aes(x = classdiabetes, y = Age, fill = classdiabetes)) +
  geom_violin() +
  labs(x = "Diabetes Class", y = "Age") +
  scale_fill_manual(name = "Diabetes Class", 
                    values = c("steelblue", "gold3", "gray45"), 
                    labels = c("No Diabetes", "Prediabetes", "Diabetes")) +
  ggtitle("Patient Age vs Diabetes Class") +
  theme(plot.title = element_text(hjust = 0.5))