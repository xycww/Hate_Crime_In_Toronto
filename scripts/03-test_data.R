#### Preamble ####
# Purpose: Sanity check of the data
# Author: Sakura Hu
# Date: 27 September 2024
# Contact: sakura.hu@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have simulated data
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)


#### Test data ####
simulated_data <- read_csv("data/raw_data/simulated.csv")

# 1. Check for missing values (NAs) in key columns
na_checks <- sapply(simulated_data, function(x) sum(is.na(x)))
print("Number of NAs in each column:")
print(na_checks)

# 2. Test that all OCCURRENCE_YEAR values are between 2018 and 2023
valid_years <- all(simulated_data$OCCURRENCE_YEAR %in% 2018:2023)
print(paste("All OCCURRENCE_YEAR values are valid (2018 to 2023):", valid_years))

# 3. Check for duplicate rows
duplicate_rows <- any(duplicated(simulated_data))
print(paste("There are duplicate rows in the dataset:", duplicate_rows))
