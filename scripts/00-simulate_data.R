#### Preamble ####
# Purpose: Simulates data for Hate Crimes analysis
# Author: Sakura Hu
# Date: 20 September 2024
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

simulated_data <- 
  tibble(
    OCCURRENCE_YEAR = occurrence_year,
    RACE_BIAS = sample(unique(cleaned_data$RACE_BIAS), n, replace = TRUE),
    ETHNICITY_BIAS = sample(unique(cleaned_data$ETHNICITY_BIAS), n, replace = TRUE),
    RELIGION_BIAS = sample(unique(cleaned_data$RELIGION_BIAS), n, replace = TRUE),
    SEXUAL_ORIENTATION_BIAS = sample(unique(cleaned_data$SEXUAL_ORIENTATION_BIAS), n, replace = TRUE),
    GENDER_BIAS = sample(unique(cleaned_data$GENDER_BIAS), n, replace = TRUE)
  )

# Check the first few rows of the simulated data
head(simulated_data)


#### Write_csv
write_csv(simulated_data, file = "data/raw_data/simulated.csv")