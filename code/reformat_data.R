# Transforming the detailed long format data with URLs etc (rows correspond to interventions)
# to ling format data showing the temporal evolution of measures in place (row correspond to
# canton x date)

library(tidyverse)

# get shortened version of long data:
clean <- readr::read_csv("../measures_detailed_CH.csv", na = "")

# get names of cantons:
cantons <- sort(gsub(unique(clean$unit), pattern = "CH-", replacement = ""))
cantons <- cantons[cantons != "CH"]

# set up a tibble with dates and cantons in long format:
date_range <- seq(from = min(clean$date), to = max(clean$date), by = 1)
categories <- unique(clean$category)

final <- tibble(
  country = "CH",
  unit = rep(cantons, each = length(date_range)),
  date = rep(date_range, length(cantons))
)

# fill in tibble based on interventions in clean:

# run through categories of interventions:
for(v in categories){
  # create additional column:
  final[, v] <- 0
  # run through cantons:
  for(can in cantons){
    # subsets corresponding to canton and intervention category:
    subs_changes <- subset(clean, unit %in% c(paste0("CH-", can), "CH") & category == v)
    subs_changes <- subs_changes[order(subs_changes$date), ] # needs to be ordered by date
    subs_final <- subset(final, unit %in% can)
    # NOTE: The below assumes that measures always get tightened - will need to be modified when
    # measures start getting relaxed!
    # run through interventions (for the current canton and category):
    for(i in seq_along(subs_changes$date)){
      # set all dates after intervention to new_val provided in clean
      # (later dates get overridden in case of another intervention)
      subs_final[subs_final$date >= subs_changes$date[i], v] <-
        max(c(subs_changes$new_val[i], unlist(subs_final[subs_final$date <= subs_changes$date[i], v])))
    }
    # re-write into tibble final
    final[final$unit == can, ] <- subs_final
  }
}

final <- final[order(final$unit, final$date), ]


# compare to Fabienne's aggregated data:
# final_fabienne <- readr::read_csv("../measures_CH_2020-04-06.csv", na = "")
# table(final_fabienne == final$unit)
# worked


# write out (not necessary right now as identical to csv created by Fabienne:
readr::write_csv(final, "../measures_CH.csv", na = "")

