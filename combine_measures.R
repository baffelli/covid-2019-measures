library(checkpoint)
checkpoint("2020-03-03")
library(tidyverse)
library(sf)
library(googledrive)
#Find all measures
files_to_join <- append(Sys.glob("data/measures_[A-Z]*.csv"), "data/measures.csv")


#Set column types
col_types <- cols(
  date_implemented = col_datetime(),
  date_lifted = col_datetime(),
  measure = col_double(),
  level = col_character(),
  unit = col_character(),
  source = col_character()
)



#Read them in
all_measures <- purrr::map(files_to_join, purrr::safely(~readr::read_csv(.x, col_types = col_types)))
#Bind them together
combined_measures <- bind_rows(all_measures %>% map("result"))
#Save them
readr::write_csv(combined_measures, "data/combined_measures.csv", na = "")

#Save each region into a separate file to be uploaded to google docs
combined_measures %>%  
  group_by(nesting=unit) %>% 
  mutate(measure_cat=NA) %>%
  nest() %>% 
  mutate(
    out = map2(data, nesting, ~write_csv(.x, path =  stringr::str_interp("data/measures_to_edit_${.y}.csv"))))
  
