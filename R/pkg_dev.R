library(tidyverse)
install.packages(c("devtools", "roxygen2", "testthat", "knitr"))
df <- data.frame(x = c(2250,2300,1300,1925,1745,1425,335,947,100,
                       rep(2230, 10), 2235, 2231, 2225,
                       rep(2300,5), rep(300,9)))
dim(df)
df$y <- sample(100, 36)

data_clock(Data = df, Time = x)


