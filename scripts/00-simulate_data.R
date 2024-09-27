#### Preamble ####
# Purpose: Simulates data for Hate Crimes analysis
# Author: Sakura Hu
# Date: 27 September 2024
# Contact: sakura.hu@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####
set.seed(1009201917)

# Define the number of records to simulate
n <- 100

# Simulating OCCURRENCE_YEAR (e.g., from 2018 to 2023)
occurrence_year <- sample(2018:2023, n, replace = TRUE)

# Define proportions for each bias type
gender_bias_levels <- unique(simulated_data$GENDER_BIAS)
gender_bias_probs <- c(0.05, 0.7, 0.05, 0.1, 0.05, 0.05) 

race_bias_levels <- unique(simulated_data$RACE_BIAS)
race_bias_probs <- c(0.01, 0.01, 0.01, 0.01, 0.01, 0.3, 0.4, 0.01, 0.01, 0.01, 0.04, 0.03, 0.04, 0.04, 0.04, 0.02, 0.01)

religion_bias_levels <- unique(simulated_data$RELIGION_BIAS)
religion_bias_probs <- c(0.02, 0.02, 0.4, 0.02, 0.02, 0.02, 0.02, 0.4, 0.02, 0.02, 0.04)

ethnicity_bias_levels <- unique(simulated_data$ETHNICITY_BIAS)
ethnicity_bias_probs <- c(0.01, 0.01, 0.05, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.05, 0.01, 0.04, 0.6, 
                          0.05, 0.05, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01)  

sexual_orientation_bias_levels <- unique(simulated_data$SEXUAL_ORIENTATION_BIAS)
sexual_orientation_bias_probs <- c(0.1, 0.1, 0.1, 0.6, 0.1)

language_bias_levels <- unique(simulated_data$LANGUAGE_BIAS)
language_bias_probs <- c(0.01, 0.01, 0.97, 0.01)

mental_physical_disability_levels <- unique(simulated_data$MENTAL_OR_PHYSICAL_DISABILITY)
mental_physical_disability_probs <- c(0.3, 0.7) 

# Simulating the biases based on defined proportions
simulated_data <- 
  tibble(
    OCCURRENCE_YEAR = occurrence_year,
    RACE_BIAS = sample(race_bias_levels, n, replace = TRUE, prob = race_bias_probs),
    ETHNICITY_BIAS = sample(ethnicity_bias_levels, n, replace = TRUE, prob = ethnicity_bias_probs),
    RELIGION_BIAS = sample(unique(cleaned_data$RELIGION_BIAS), n, replace = TRUE),
    SEXUAL_ORIENTATION_BIAS = sample(sexual_orientation_bias_levels, n, replace = TRUE, prob = sexual_orientation_bias_probs),
    GENDER_BIAS = sample(gender_bias_levels, n, replace = TRUE, prob = gender_bias_probs), 
    LANGUAGE_BIAS = sample(language_bias_levels, n, replace = TRUE, prob = language_bias_probs), 
    MENTAL_OR_PHYSICAL_DISABILITY = sample(mental_physical_disability_levels, n, replace = TRUE, prob = mental_physical_disability_probs), 
    LOCATION_TYPE = sample(unique(cleaned_data$LOCATION_TYPE), n, replace = TRUE)
  )



# Check the first few rows of the simulated data
head(simulated_data)


#### Write_csv
write_csv(simulated_data, file = "data/raw_data/simulated.csv")