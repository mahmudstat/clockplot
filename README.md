
<!-- README.md is generated from README.Rmd. Please edit that file -->

# clockplot <a href=""><img src="man/figures/logo.png" align="right" height="100" /></a>

<!-- badges: start -->

<!-- badges: end -->

The *clockplot* is designed to visualize event times on a circular clock
chart, helping you create day, week, or month charts for analyzing
patterns or planning events. It’s perfect for time-based data, from
personal schedules to periodic trend analysis.

## Installation

You can install the development version of clockplot from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("mahmudstat/clockplot")
```

## Usage

[Click
here](https://mahmudstat.github.io/clockplot/reference/index.html) to
see all the available functions.

## Applications

Below we mention some relevant applications. [Click
here](https://mahmudstat.github.io/clockplot/articles/clockplot.html) to
see the reproducible codes.

We have a small data of times of messages received throughout a
particular day, along with sender of the messages and their types. Let
us the pattern of messages by senders.

<img src="man/figures/README-exqlt-1.png" alt="SMS times" width="100%" style="display: block; margin: auto;" />

### Modifying Clock Hands

<img src="man/figures/README-example-1.png" alt="Clock chart of random event times based on a random sample." width="100%" style="display: block; margin: auto;" />

### Week Chart

<img src="man/figures/README-week-chart-1.png" alt="Week chart of Temperature" width="100%" style="display: block; margin: auto;" />

## Aditional Components

The charts produce `ggplot` objects, so you can make use of many of the
functions of the `ggplot2` package. You can use the `labs` function, for
example, to add `title`, `subtitle`, `caption` etc. Some examples are
shown in the next segment.

You can also add legend or change its position by using the code
`theme(legend.position = "right")`; the accepted positions are `top`,
`bottom`, `left`, and `right`.
