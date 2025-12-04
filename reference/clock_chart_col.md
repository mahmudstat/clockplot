# Clock Chart, Hands Colored by a Numeric Variable

This function will plot time of events on a 24 hour clock to show which
events took place at what times. The lines are colored by a criteria.

## Usage

``` r
clock_chart_col(data, time, crit, high = "red", low = "green")
```

## Arguments

- data:

  A data frame

- time:

  Time in 24 hours. The allowed time formats for these family of charts
  are `HH:MM:SS`, `HH:MM` or even `H:M` (such as `12;30:09` or `9:3`).

- crit:

  a numeric vector by which lines will be colored.

- high:

  The color name for the high values. The default is `red`

- low:

  The color name for the low values. The default is `green`. The color
  names can be vice versa or other colors, depending on the context.

## Value

A `ggplot` object, which can be further modified with `ggplot2`
functions and themes.

## Details

Change the title, subtitle or the caption of the plot with
[`ggplot2::labs()`](https://ggplot2.tidyverse.org/reference/labs.html)
.Change the legend title by adding `ggplot2::labs(size = "TITLE")` or
`labs(color = "TITLE")`.

Add or modify legend by `theme(legend.position = "POSITION")`; the valid
position names in `ggplot2` are `top`, `bottom`, `right`, and `left`,
excluding more complex options.

## See also

[`clock_chart_qnt()`](https://mahmudstat.github.io/clockplot/reference/clock_chart_qnt.md),
and
[`clock_chart_qlt()`](https://mahmudstat.github.io/clockplot/reference/clock_chart_qlt.md).

## Examples

``` r
df <- data.frame(
  time = c("06:00:00", "08:00:00", "17:30:00"),
  value = c(3, 6, 9)
)
clock_chart_col(df, time, crit = value) +
  ggplot2::labs(size = "TITLE")

```
