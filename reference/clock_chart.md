# The Simplest Clock Chart, Lines Unmodified

There are five types of clock charts, `clock_chart()` being the simplest
one. It just shows the event times on a 24 hour clock. The lines are
neither colored, nor length modified.
[`clock_chart_col()`](https://mahmudstat.github.io/clockplot/reference/clock_chart_col.md)
is used to colorize and `clock_chart_len()` to change the length of the
hands by a numeric vector. To do both simultaneously, use
[`clock_chart_qnt()`](https://mahmudstat.github.io/clockplot/reference/clock_chart_qnt.md).
To use a qualitative variable as the criterion, use
[`clock_chart_qlt()`](https://mahmudstat.github.io/clockplot/reference/clock_chart_qlt.md).

## Usage

``` r
clock_chart(data, time, Col = "black")
```

## Arguments

- data:

  A data frame

- time:

  Time in 24 hours. The allowed time formats for these family of charts
  are `HH:MM:SS`, `HH:MM` or even `H:M` (such as `12;30:09` or `9:3`),
  although the SS part is ignored due to having negligible impact on the
  final plot).

- Col:

  A single color name for the lines. The default is `black`.

## Value

A `ggplot` object, which can be further modified with `ggplot2`
functions and themes.

## Details

Change the title, subtitle or the caption of the plot with
[`ggplot2::labs()`](https://ggplot2.tidyverse.org/reference/labs.html).

## See also

[`clock_chart_col()`](https://mahmudstat.github.io/clockplot/reference/clock_chart_col.md),
[`clock_chart_qnt()`](https://mahmudstat.github.io/clockplot/reference/clock_chart_qnt.md),
and
[`clock_chart_qlt()`](https://mahmudstat.github.io/clockplot/reference/clock_chart_qlt.md).

## Examples

``` r
p1 <- clock_chart(smsclock, time) # Using package built-in data
p1 + ggplot2::labs(title = "SMS Receiving Times")

#  Add clock_chart(brintcity %>% filter(Origin == "Dhaka"), time = Departure)
```
