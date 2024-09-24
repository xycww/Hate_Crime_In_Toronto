#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Preamble ####
# Purpose: Cleans the raw hate crime data recorded by observers
# Author: Rohan Alexander
# Date: 6 April 2023
# Contact: rohan.alexander@utoronto.ca
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
  )


#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
