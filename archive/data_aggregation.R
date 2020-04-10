library(checkpoint)
checkpoint("2020-04-04")
library(tidyverse)
library(sf)
library(googledrive)
library(recipes)
library(readxl)
library(dplyr)

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
raw <- bind_rows(all_measures %>% purrr::map("result"))
raw$date_implemented <- as.Date(raw$date_implemented)
raw$date_lifted <- as.Date(raw$date_lifted)

#Save them
readr::write_csv(raw, "measures_raw_2020-04-06.csv", na = "")

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

clean <- clean[,c(1:3,12:24)]

# collapse multiple entries for the same date to one observation
clean <- clean %>% dplyr::group_by(country, unit, date) %>% 
  dplyr::mutate_at(vars(events:recommendations), .funs=funs(max(., na.rm=T)))
clean[clean==-Inf] <- NA
clean <- unique(clean)

# add information for all CH to each Kanton
ch <- clean[clean$unit=="CH",3:16]
colnames(ch)[2:14] <- paste0(colnames(ch)[2:14], "_CH")

final <- clean[clean$unit!="CH",]
nunits <- length(unique(final$unit))
ndates <- max(clean$date)-min(clean$date)+1

moo <- data.frame("date"=rep(seq(as.Date(min(clean$date)), as.Date(max(clean$date)), by=1), nunits),
                  "unit"=rep(sort(unique(final$unit)), ndates))

final <- merge(final, moo, by=c("unit", "date"), all=T)
final$country <- "CH"
final <- merge(final, ch, by="date", all=T)

for (i in 4:16) {
  final[,i] <- ifelse(!is.na(final[,i+13]) & 
                        ((!is.na(final[,i]) & final[,i+13]>final[,i]) | (is.na(final[,i]))),
                      final[,i+13], final[,i])
}

final <- final[,c(1:16)]
final <- final[order(final$unit, final$date),]

# Fill values for categories until next non-missing observations
final <- final %>% dplyr::group_by(unit) %>% dplyr::arrange(date) %>% 
  fill(.,events:recommendations)

final$unit <- gsub("CH-", "", final$unit)
final[is.na(final)] <- 0

# correct some category for TI manually 
#(they implemented some measures before CH implemented it, but it is overriden in the code above)
final$events <- ifelse(final$unit=="TI" & final$date>=as.Date("2020-03-13") & 
                         final$date<=as.Date("2020-03-20") & final$events==3, 
                       4, final$events)
final$retailgastro <- ifelse(final$unit=="TI" & final$date>=as.Date("2020-03-13") & 
                               final$date<=as.Date("2020-03-20") & final$retailgastro==1, 
                             2, final$retailgastro)

final <- final[,c(3,2,1,4:16)]
final <- final[order(final$date, final$unit),]


readr::write_csv(final, "measures_2020-04-06.csv", na = "")


