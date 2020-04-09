library(checkpoint)
checkpoint("2020-04-04")
library(tidyverse)
library(sf)
library(googledrive)
library(recipes)
library(readxl)
#Find all measures on google drive
files_to_join <- drive_ls("https://drive.google.com/drive/folders/1BrdACHo19f_Q-b2aEU3ZlwwKb68VYPGj", pattern="measures*")


#Create a function to download a file from google maps
download_temp <- function(id, name, base="data/to_edit"){
  out_path =  file.path(base, name)
  res <- drive_download(drive_get(id=id), path=out_path, overwrite = T)
  res$local_path
}

files_to_load <- purrr::map2(files_to_join$id, files_to_join$name, purrr::safely(download_temp))

#Set column types
col_types <- c(
  country = 'text',
  unit = 'text',
  date_implemented = 'date',
  date_lifted = 'date',
  measure = 'text',
  measure_cat = 'text',
  measure_sub_cat = 'text',
  level = 'text',
  source ='text',
  entered_by = 'text',
  reviewed_by = 'text'
)



#Read them in
all_measures <- purrr::map(files_to_load, purrr::safely(~readxl::read_excel(.x$result, col_types = col_types)))
#Bind them together
combined_measures <- bind_rows(all_measures %>% map("result"))
#Save them
readr::write_csv(combined_measures, "data/combined_measures.csv", na = "")


#Create a recipes "recipe" to add dummies for the cantons
rec <- recipes::recipe(combined_measures) %>%
  recipes::step_dummy(unit, naming = function(x,y, ...) y,preserve = T)

#Apply the recipe
wide_measures <-
recipes::prep(rec) %>% recipes::juice() %>%
  mutate_at(vars(matches("[A-Z]{2}", perl = T)), function(x) {ifelse(as.character(.$unit)=="CH",1,0)})
