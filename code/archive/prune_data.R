# Pruning the collected data, keeping only relevant intervention

library(checkpoint)
checkpoint("2020-04-04")
library(tidyverse)
library(sf)
library(googledrive)
library(recipes)
library(readxl)
library(dplyr)

# setwd("/home/johannes/Documents/COVID/covid-2019-measures_jb/code")

# read in file compiled by Fabienne:
raw <- readr::read_csv("../archive/measures_raw_2020-04-06.csv", na = "")

# select and reduce main measures of interest for final data set
clean <- raw[raw$measure_cat %in% c("case_management", "mass_gatherings", "mobility", "private_institutions", "public_institutions", "recommendations"),]
clean <- clean[clean$level %in% c("national", "cantonal"),]
clean$measure_sub_cat <- ifelse(clean$measure_cat=="recommendations", "recommendations", clean$measure_sub_cat)
clean$measure_sub_cat <- ifelse(clean$measure_cat=="case_management", "casemanagement", clean$measure_sub_cat)
clean <- clean[clean$measure_sub_cat!="event permit required" & !is.na(clean$measure_sub_cat),]
colnames(clean)[3] <- "date"
clean <- clean[!is.na(clean$date),]

# recode variables
clean$events <- ifelse(clean$measure_sub_cat=='ban of events / mass gatherings of > 1000 persons', 1,
                       ifelse(clean$measure_sub_cat=='ban of events / mass gatherings of > 500 persons', 2,
                              ifelse(clean$measure_sub_cat=='ban of events / mass gatherings of > 100 persons', 3,
                                     ifelse(clean$measure_sub_cat=='ban of events / mass gatherings of > 50 persons', 4,
                                            ifelse(clean$measure_sub_cat=='ban of events / mass gatherings of > 10 persons', 5,
                                                   ifelse(clean$measure_sub_cat=='ban of events / mass gatherings of > 5 persons', 6, NA))))))


clean$carefacilities <- ifelse(clean$measure_sub_cat=='restriction of access to short- and long-term care facilites', 1,
                               ifelse(clean$measure_sub_cat=='ban of access to short- and long-term care facilites', 2, NA))

clean$retailgastro <- ifelse(clean$measure_sub_cat=='restriction of access to private institutions', 1,
                             ifelse(clean$measure_sub_cat=='closure of private institutions and businesses with close contact', 2, NA))

clean$publicplaces <- ifelse(clean$measure_sub_cat=='ban of access to public open areas and parks' |
                               clean$measure_sub_cat=='closure of public places (museums, sports facilities, ..)', 1, NA)

clean$mobilityint <- ifelse(clean$measure_sub_cat=='restriction of cross-border mobility',1,
                            ifelse(clean$measure_sub_cat== 'ban of cross-border mobility',2,NA))

clean$daycare <- ifelse(clean$measure_sub_cat=='closure of day care',1,NA)
clean$schools <- ifelse(clean$measure_sub_cat=='closure of schools',1,NA)
clean$universities <- ifelse(clean$measure_sub_cat=='closure of universities',1,NA)
clean$publicoffices <- ifelse(clean$measure_sub_cat=='closure of public offices and counters',1,NA)
clean$publictransport <- ifelse(clean$measure_sub_cat=='reduction of public transport',1,NA)
clean$stayathome <- ifelse(clean$measure_sub_cat=='stay-at-home recommendation',1,NA)
clean$casemanagement <- ifelse(clean$measure_sub_cat=="casemanagement",1,NA)
clean$recommendations <- ifelse(clean$measure_sub_cat=="recommendations",1,NA)

# introduce new "category" variable where levels correspond to the variables defined above
# new_val variable stating which value this category newly takes
names_categories <- c("events", "carefacilities", "retailgastro", "publicplaces", "mobilityint",
                      "daycare", "schools", "universities", "publicoffices",
                      "publictransport", "stayathome", "casemanagement", "recommendations")
clean$category <- clean$new_val <- NA
for(i in 1:nrow(clean)){
  clean$category[i] <- names_categories[!is.na(clean[i, names_categories])]
  clean$new_val[i] <- unlist(clean[i, names_categories], use.names = FALSE)[which(!is.na(clean[i, names_categories]))]
}

# remove the dummy variables:
clean <- clean[,c("country", "unit", "date", "measure", "category", "new_val",
                  "source", "entered_by", "reviewed_by")]

# write out:
readr::write_csv(clean, "../measures_detailed_2020-04-06.csv", na = "")

# write out by canton:
units <- unique(clean$unit)
for(u in units){
  subs_temp <- subset(clean, unit == u)
  name_u <- gsub(pattern = "CH-", replacement = "", x = u)
  readr::write_csv(subs_temp, paste0("../data/measures_detailed_", name_u, "_2020-04-06.csv"), na = "")
}
