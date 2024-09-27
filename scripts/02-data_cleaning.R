#### Preamble ####
# Purpose: Cleans the raw hate crime data recorded by observers
# Author: Sakura Hu
# Date: 27 September 2024
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
    MENTAL_OR_PHYSICAL_DISABILITY = ifelse(MENTAL_OR_PHYSICAL_DISABILITY == "NO", "None", MENTAL_OR_PHYSICAL_DISABILITY)
  ) %>%
  # Remove specified columns
  select(-NEIGHBOURHOOD_140, -HOOD_140, -NEIGHBOURHOOD_158, -HOOD_158, -DIVISION, -REPORTED_TIME, 
         -OCCURRENCE_TIME, -REPORTED_YEAR, -REPORTED_DATE, -MULTIPLE_BIAS, -'_id', -AGE_BIAS, 
         -PRIMARY_OFFENCE, -ARREST_MADE, -OCCURRENCE_DATE)

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")

#### Test data ####
# 1. Check for missing values (NAs) in key columns
na_checks <- sapply(cleaned_data, function(x) sum(is.na(x)))
print("Number of NAs in each column:")
print(na_checks)

# 2. Test for uniqueness of EVENT_UNIQUE_ID (Assuming this column exists in your dataset)
# Test for uniqueness of EVENT_UNIQUE_ID
if ("EVENT_UNIQUE_ID" %in% colnames(cleaned_data)) {
  # Identify duplicated EVENT_UNIQUE_IDs
  duplicates <- cleaned_data$EVENT_UNIQUE_ID[duplicated(cleaned_data$EVENT_UNIQUE_ID) | 
                                               duplicated(cleaned_data$EVENT_UNIQUE_ID, fromLast = TRUE)]
  
  # Check if there are duplicates
  if (length(duplicates) > 0) {
    print(paste("Duplicate EVENT_UNIQUE_IDs found:", length(unique(duplicates))))
    print("Duplicate IDs:")
    print(unique(duplicates))
  } else {
    print("All EVENT_UNIQUE_IDs are unique.")
  }
} else {
  print("EVENT_UNIQUE_ID column does not exist in the dataset.")
}


# 3. Test that all OCCURRENCE_YEAR values are between 2018 and 2023
valid_years <- all(cleaned_data$OCCURRENCE_YEAR %in% 2018:2023)
print(paste("All OCCURRENCE_YEAR values are valid (2018 to 2023):", valid_years))

# 4. Check for duplicate rows
duplicate_rows <- any(duplicated(cleaned_data))
print(paste("There are duplicate rows in the dataset:", duplicate_rows))

