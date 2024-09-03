
<!-- README.md is generated from README.Rmd. Please edit that file -->

# clockplot <a href=""><img src="man/figures/logo.png" align="right" height="100" /></a>

<!-- badges: start -->
<!-- badges: end -->

The primary goal of clockplot is to plot event time on a clock chart.
Additionally it helps you make a day chart, week chart, or month chart,
or plan events in those periods.

## Installation

You can install the development version of clockplot from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("mahmudstat/clockplot")
```

## Usage

[Click here](/reference) to see the available functions.

### Clock Chart

``` r
library(clockplot)

set.seed(10)
df <- tibble::tibble(hr = sample(0:23, 50, replace = TRUE),
                  mnt = sample(0:59, 50, replace = TRUE),
                  sec = sample(0:59, 50, replace = TRUE),
                  time = paste(hr, mnt, sec, sep = ":"),
                  value = sample(60,50))
p1 <- clock_chart_qnt(df, time, crit = value)
p1 + ggplot2::theme(legend.position = "right")+
ggplot2::labs(title = "Clock chart of random values")
```

<img src="man/figures/README-example-1.png" alt="Clock chart of random event times based on a random sample." width="100%" />

### Week Chart

``` r
set.seed(15)
wtemp <- sample(10:40,7)
week_chart(wtemp, high = "yellow", lgnm = "Temperature")
```

<img src="man/figures/README-week-chart-1.png" alt="Week chart of Temperature" width="100%" />
