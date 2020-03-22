library(checkpoint)
checkpoint("2020-03-03")
library(tidyverse)
library(sf)

#Find all measures
files_to_join <- Sys.glob("data/measures*.csv")
#Read them in
all_measures <- purrr::map(files_to_join, readr::read_csv)
#Bind them together
combined_measures <- bind_rows(all_measures)
#Save them
readr::write_csv(combined_measures, "data/combined_measures.csv", na = "")

#Also save them in wide format

