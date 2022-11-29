library(tibble)

time24 <- sample(0:60, 50, replace = TRUE)+
  sample(0:23, 50, replace = TRUE)*100

sample_df <- tibble(time = time24,
             crit = sample(1:20, length(time24), replace = TRUE))

data_clock(data = df, time = time, criteria = crit)

usethis::use_data(sample_df)

