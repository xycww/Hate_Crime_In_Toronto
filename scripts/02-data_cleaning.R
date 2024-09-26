#### Preamble ####
# Purpose: Cleans the raw hate crime data recorded by observers
# Author: Sakura Hu
# Date: 23 September 2024
# Contact: sakura.hu@mail.utoronto.ca
# License: MIT
# Pre-requisites: R packages tidyverse, dplyr must be installed
# Any other information needed? This script processes the hate crime dataset.

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

# Replace "NO" with "None" in the specified columns
cleaned_data <- raw_data %>%
  mutate(
    AGE_BIAS = ifelse(AGE_BIAS == "NO", "None", AGE_BIAS),
    MENTAL_OR_PHYSICAL_DISABILITY = ifelse(MENTAL_OR_PHYSICAL_DISABILITY == "NO", "None", MENTAL_OR_PHYSICAL_DISABILITY)
  ) %>%
  # Remove specified columns
  select(-NEIGHBOURHOOD_140, -HOOD_140, -NEIGHBOURHOOD_158, -HOOD_158, -DIVISION, -REPORTED_TIME, 
         -OCCURRENCE_TIME, -REPORTED_YEAR, -REPORTED_DATE, -AGE_BIAS, -MULTIPLE_BIAS, -LOCATION_TYPE)

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
