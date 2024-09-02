#  Chat Data

# Uncomment to update

# Data preparation

#name <- rep(c("Abid", "Abir"), each = 25)
#set.seed(10) # to always get the same data
# First randomly select 25 times for Abid
#hour <- sort(sample(0:23, 25, replace = TRUE))
#minute <- sort(sample(0:59, 25))
#second <- sort(sample(0:59, 25))
#time <- paste(hour, minute, second, sep = ":")


#reply_time <- paste(hour+sample(0:2, 25, replace = TRUE),
#                    minute + sample(0:10, 25, replace = TRUE),
#                    second, sep = ":")

#chatdf <- tibble::tibble(name,
#                     time = c(time, reply_time),
#                     turn = rep(1:25, times = 2))
#chatdf <- dplyr::arrange(chatdf, turn)

library(readr)

#write_csv(chatdf, file = "data-raw/chatdf.csv")

chatdf <- read_csv(file = "data-raw/chatdf.csv")
usethis::use_data(chatdf, overwrite = TRUE)


