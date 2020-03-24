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

#Save each region into a separate file to be uploaded to google docs
combined_measures %>%  
  group_by(nesting=unit) %>% 
  mutate(measure_cat=NA) %>%
  nest() %>% 
  mutate(out = map2(data, nesting, ~write_csv(.x, path =  stringr::str_interp("data/measures_to_write_${.y}.csv"))))
