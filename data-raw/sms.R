# SMS Data

library(readr)
smsclock <- read_csv(file = "data-raw/sms.csv")

smsclock$time <- paste(smsclock$time, sep = ":00")

usethis::use_data(smsclock, overwrite = TRUE)


