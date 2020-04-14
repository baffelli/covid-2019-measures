# Code to update local data from Google drive
# Can subsequently be committed to github

library(googledrive)
library(readxl)

# create directory
dir.create("../xls_files")


# Find all measures on google drive
drive <- "https://drive.google.com/drive/folders/1bJdu0h5iDhONRgqojSuzVoAYmvRUjj6V"
files_to_join <- drive_ls(drive, pattern="details_*")
file_names <- sort(files_to_join$name)

# place to collate all data:
dat_pooled <- NULL

for(f in file_names){
  # get data (creates local xlsx file):
  download_temp <- drive_download(file = f, overwrite = TRUE, path = "xls_files")
  dat_temp <- readxl::read_excel(download_temp$local_path)
  # write out as csv:
  write.csv(dat_temp, paste0("../data/", f, ".csv"), row.names = FALSE)

  # append to dat_pooled:
  if(is.null(dat_pooled)){
    dat_pooled <- dat_temp
  }else{
    dat_pooled <- rbind(dat_pooled, dat_temp)
  }
  cat(paste(f, "done"))
}

# write out pooled data:
write.csv(dat_pooled, file = "../measures_detailed_CH.csv", row.names = FALSE)
