# Load raw data from .csv file

starwars_donors<-read.csv("data-raw/starwars_donors.csv", stringsAsFactors = F,
                          fileEncoding = "UTF-8-BOM")

starwars_donors$Household_Primary<-ifelse(starwars_donors$Household_Primary=="",
                                          NA,
                                          as.character(starwars_donors$Household_Primary))

usethis::use_data(starwars_donors, overwrite = TRUE)
