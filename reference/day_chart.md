# Plot Values on a 24-Hour Day, on Specific Hours

This function plots values corresponding to each hour on a rose plot.

## Usage

``` r
day_chart(hvalue, high = "blue", low = "yellow", width = 0.8)
```

## Arguments

- hvalue:

  A numeric vector having values at each of 24 hours (starts from 6 am)

- high:

  The color name for the high values. The default is `red`

- low:

  The color name for the low values. The default is `green`.

- width:

  Width of bars

## Value

A `ggplot` object, which can be further modified with `ggplot2`
functions and themes.

## Details

The color names can be vice versa or other colors, depending on the
context.

## See also

[`week_chart()`](https://mahmudstat.github.io/clockplot/reference/week_chart.md)
for plotting values in a week by days
[`year_chart()`](https://mahmudstat.github.io/clockplot/reference/year_chart.md)
for plotting values on in a year by months
[`cyclic_chart()`](https://mahmudstat.github.io/clockplot/reference/cyclic_chart.md)
for plotting values by arbitrary period

## Examples

``` r
value <- sample(15:30, 24, replace = TRUE)
day_chart(hvalue = value, high = "blue", low = "yellow", width = 0.8)
```
