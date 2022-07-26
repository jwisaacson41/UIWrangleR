# Load raw data from .csv file

starwars_donors<-read.csv("data-raw/starwars_donors.csv", stringsAsFactors = F)

usethis::use_data(starwars_donors, overwrite = TRUE)
