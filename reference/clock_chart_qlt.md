# Clock Chart, Hands Colored by a Factor

This function will plot time of events on a 24 hour clock to show which
events took place at what times. The hands are colored by a qualitative
(factor) vector. Change the plot's title, subtitle, or caption using
[`ggplot2::labs()`](https://ggplot2.tidyverse.org/reference/labs.html).  
For example: `ggplot2::labs(title = "My Plot",`  
`subtitle = "My Subtitle")` You can change the title of the legend by
adding  
`ggplot2::labs(color = "Legend Title")`.

## Usage

``` r
clock_chart_qlt(data, time, crit)
```

## Arguments

- data:

  A data frame

- time:

  Time in 24 hours. The allowed time formats for these family of charts
  are `HH:MM:SS`, `HH:MM` or even `H:M` (such as `12;30:09` or `9:3`).

- crit:

  The qualitative vector by which hands will be colored.

## Value

A `ggplot` object, which can be further modified with `ggplot2`
functions and themes.

## See also

[`clock_chart_col()`](https://mahmudstat.github.io/clockplot/reference/clock_chart_col.md)
for coloring and
[`clock_chart_qnt()`](https://mahmudstat.github.io/clockplot/reference/clock_chart_qnt.md)
for more options.

## Examples

``` r
# A plot showing sms receiving times based on
# criteria (type/sender/invoked)
clock_chart_qlt(smsclock, time = time, crit = sender) +
  ggplot2::labs(color = "Sender", title = "SMS's Received throughout th Day")
```
