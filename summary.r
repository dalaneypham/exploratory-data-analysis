 library("dplyr")
library("tidyverse")

diabetes <- read.csv("/Users/meganstoppler/Downloads/diabetes_012_health_indicators_BRFSS2015.csv")

# make an empty list
summary_info <- list()

# value for the number of cases reported in the data
summary_info$number_of_cases <- nrow(diabetes)

# value for the average age
summary_info$mean_age <- mean(diabetes$Age)

# value for the proportion of the cases have diabetes
summary_info$proportion_diabetes <- nrow(diabetes %>% filter(Diabetes_012 == 2)) / nrow(diabetes)

# value for ratio of men to women
summary_info$men_to_women_ratio <- nrow(diabetes %>% filter(Sex == 1)) / nrow(diabetes %>% filter(Sex == 0))

# value for proportion with access to healthcare
summary_info$proportion_healthcare_access <- nrow(diabetes %>% filter(AnyHealthcare == 1)) / nrow(diabetes)