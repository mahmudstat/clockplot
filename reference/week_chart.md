# Plot Values on Each Day of a Week

This function plots values corresponding to each day on a rose plot.

## Usage

``` r
week_chart(wvalue, lgnm = "Value", high = "yellow", low = "green", width = 0.9)
```

## Arguments

- wvalue:

  A numeric vector having values on each day, starting from Saturday

- lgnm:

  Title of legend

- high:

  The color name for the high values. The default is `red`

- low:

  The color name for the low values. The default is `green`. The color
  names can be vice versa or other colors, depending on the context.

- width:

  The width of bars.

## Value

A `ggplot` object, which can be further modified with `ggplot2`
functions and themes.

## See also

[`day_chart()`](https://mahmudstat.github.io/clockplot/reference/day_chart.md)
for plotting values in on a day hours
[`year_chart()`](https://mahmudstat.github.io/clockplot/reference/year_chart.md)
for plotting values on in a year by months
[`cyclic_chart()`](https://mahmudstat.github.io/clockplot/reference/cyclic_chart.md)
for plotting values by arbitrary period

## Examples

``` r
set.seed(10)
wtemp <- sample(10:40, 7)
week_chart(wtemp, high = "yellow") + ggplot2::labs(title = "Random Values by Day")
```
