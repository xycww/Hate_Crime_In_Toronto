#### Preamble ####
# Purpose: Sanity check of the data
# Author: Sakura Hu
# Date: 20 September 2024
# Contact: sakura.hu@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have simulated data
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)


#### Test data ####
simulated_data <- read_csv("data/raw_data/simulated.csv")

# Test for negative numbers
simulated_data$Count |> min() <= 0

# Test for NAs
all(is.na(simulated_data$Count))

# Test for unqiue id

# Test for valid