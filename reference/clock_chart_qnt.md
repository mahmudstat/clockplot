# Clock Chart, Length and Color Modified by Numeric Variables

This function will plot time of events on a 24 hour clock to show which
events took place at what times. The length and color of the hands are
modified according to a numeric vector.

## Usage

``` r
clock_chart_qnt(data, time, len, Col = NULL, high = "red", low = "green")
```

## Arguments

- data:

  A data frame

- time:

  Time in 24 hours. The allowed time formats for these family of charts
  are `HH:MM:SS`, `HH:MM` or even `H:M` (such as `12;30:09` or `9:3`).

- len:

  The numeric vector by which hands will be modified and colored.

- Col:

  Optional. A numeric vector to change color. This option will be
  discontinued.

- high:

  The color name for the high values. The default is `red`.

- low:

  The color name for the low values. The default is `green`. The color
  names can be vice versa or other colors, depending on the context. To
  use a single color for all lines, use same value for `high` and `low`.

## Value

A `ggplot` object, which can be further modified with `ggplot2`
functions and themes.

## Details

Change the title, subtitle or the caption of the plot with
[`ggplot2::labs()`](https://ggplot2.tidyverse.org/reference/labs.html)
.Change the legend title by adding
`ggplot2::labs(color = "TITLE 1", size = "TITLE2")`. Add or modify
legend by `theme(legend.position = "POSITION")`; the valid position
names in `ggplot2` are `top`, `bottom`, `right`, and `left`, excluding
more complex options.

## See also

[`clock_chart_col()`](https://mahmudstat.github.io/clockplot/reference/clock_chart_col.md)
for coloring by a numeric variable,
[`clock_chart_qlt()`](https://mahmudstat.github.io/clockplot/reference/clock_chart_qlt.md)
for coloring by a qualitative variable,
[`clock_chart()`](https://mahmudstat.github.io/clockplot/reference/clock_chart.md)
for the simplest clock chart

## Examples

``` r
p1 <- clock_chart_qnt(
  data = bdquake, time = hms, len = depth,
  Col = mag, high = "red", low = "blue"
)
p1 + ggplot2::labs(
  color = "Depth", size = "Magnitude",
  title = "Earthquakes in Bangladesh since 2023"
)
```
