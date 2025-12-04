# Plot Values on Each Month of a Year

This function plots values corresponding to each month on a rose plot.

## Usage

``` r
year_chart(mvalue, lgnm = "Value", width = 0.9, high = "yellow", low = "green")
```

## Arguments

- mvalue:

  A numeric vector of length 12, with values for each month (Jan–Dec).
  If you have it in a data frame, extract it (e.g. `data$mvalue`).

- lgnm:

  Title of the legend (default `"Value"`).

- width:

  Width of bars.

- high:

  Color name for high values (default `"yellow"`).

- low:

  Color name for low values (default `"green"`).

## Value

A `ggplot` object, which can be further modified with `ggplot2`
functions.

## See also

[`day_chart()`](https://mahmudstat.github.io/clockplot/reference/day_chart.md)
for plotting values on a day by hours
[`week_chart()`](https://mahmudstat.github.io/clockplot/reference/week_chart.md)
for plotting values in a week by days
[`cyclic_chart()`](https://mahmudstat.github.io/clockplot/reference/cyclic_chart.md)
for plotting values by arbitrary period

## Examples

``` r
syltmp <- c(18.4, 20.8, 24.3, 26.0, 26.8, 27.6, 28.0,
            28.2, 27.9, 26.7, 23.3, 19.7)
year_chart(mvalue = syltmp)
```
