library(checkpoint)
checkpoint("2020-03-03")
library(tidyverse)
library(sf)


files_to_join <- Sys.glob("measures*.csv")
all_measures <- purrr::map(files_to_join, readr::read_csv)

bind_rows(all_measures)