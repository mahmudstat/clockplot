# Changelog

## clockplot 0.8.3

CRAN release: 2025-09-13

- Fixed curly braces issue from
  [`week_chart()`](https://mahmudstat.github.io/clockplot/reference/week_chart.md)

## clockplot 0.7.2

CRAN release: 2025-09-09

- The first version is
  [published](https://cran.r-project.org/web/packages/clockplot/index.html);
  [Read the
  blog](https://portal.statmania.info/blog/posts/clockplot.html)
- Deprecated *month_chart* and *clock_chart_len* before CRAN submission
- Started GHA for automated `check()`ing

## clockplot 0.6.5.9000

- Added a few tests to `clock_chart_qnt` as well as `clock_chart_len`
  and `clock_chart_col`.
- Removed bug from
  [`week_chart()`](https://mahmudstat.github.io/clockplot/reference/week_chart.md)
  in `stopifnot` part.
- Added US Accidents data and example.
- Added error for non-numeric input to
  [`week_chart()`](https://mahmudstat.github.io/clockplot/reference/week_chart.md).

## clockplot 0.6.3.9000

- Fixed bug while allowing free time format.
  [`clock_chart()`](https://mahmudstat.github.io/clockplot/reference/clock_chart.md)
  and
  [`clock_chart_qlt()`](https://mahmudstat.github.io/clockplot/reference/clock_chart_qlt.md)
  were plotting hands along 24 hours.
- User does not have give time in `HH:MM:SS`; `HH:MM` or even `H:M` are
  also allowed.
- Fixed a bug containing `hour`, `minute`, and `second` variable during
  internal data conversion.
- Updated `smsclock` data (Sep 01 to Sep 09 (2024))
- Added `gitcommit` data up to 12 Sep, 2024

## clockplot 0.6.1.9000

- Started testing using `usethis::use_testthat(3)`
- Added Bangladesh Railway data set (`brintcity`)
- `conv_hms` is being deprecated. Use
  [`hms::parse_hm()`](https://hms.tidyverse.org/reference/parse_hms.html)
  instead.
- Added legend by size of
  [`geom_point()`](https://ggplot2.tidyverse.org/reference/geom_point.html)
- Added and explained
  [`clock_chart()`](https://mahmudstat.github.io/clockplot/reference/clock_chart.md)
  examples in vignettes.

## clockplot 0.5.1.9000

- Added gray lines along hour hands
- Removed grid lines from the clock skeleton
- Converted length variable to 0.5-1 range
