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
number_of_records <- 84

# Define the simulation parameters
years <- seq(2017, 2023)  # Years for the simulation
months <- month.name  # Month names from January to December

# Create the simulated data
simulated_data <- tibble(
  id = 1:number_of_records,  # Unique row identifier
  Year_of_death = sample(years, number_of_records, replace = TRUE),  # Randomly sample years
  Month_of_death = sample(months, number_of_records, replace = TRUE),  # Randomly sample months
  Count = rpois(number_of_records, lambda = 13)  # Randomly generate counts using Poisson distribution
)


#### Write_csv
write_csv(simulated_data, file = "data/raw_data/simulated.csv")