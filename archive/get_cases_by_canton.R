library(checkpoint)
checkpoint("2020-03-03")
library(tidyverse)
library(sf)

ogd_path <- "https://raw.githubusercontent.com/openZH/covid_19/master/fallzahlen_kanton_total_csv/"

cantons <- c("AG","AI","AR","BE","BL","BS","FR","GE","GL","GR","JU","LU","NE","NW","OW","SG","SH","SZ","TG","TI","VD")


total_urls <- map(cantons, ~stringr::str_interp("${ogd_path}/COVID19_Fallzahlen_Kanton_${.x}_total.csv"))

all_cases <- map(total_urls, read_csv)

total_cases <- bind_rows(all_cases)

write_csv(total_cases, "data/cases_by_canton.csv")


