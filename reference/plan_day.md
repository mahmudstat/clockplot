# Visually Plan Activities on a Day with Events on Each of 24 Hours

This function plots works corresponding to each hour on a rose plot.

## Usage

``` r
plan_day(dwork, width = 1, brdcol = "grey")
```

## Arguments

- dwork:

  A character vector of length 24, with activity names for each hour
  starting from 6 AM and ending at 5 AM the next day.

- width:

  Width of bars.

- brdcol:

  Color of bar border. Use `NA` for no border.

## Value

A `ggplot` object, which can be further modified with `ggplot2`
functions and themes.

## Examples

``` r
set.seed(123)
work <- sample(c("Study", "Adda", "Entertainment", "Games", "Exercise", "Meal"),
  size = 24, replace = TRUE
)
plan_day(dwork = work, brdcol = NA)
```
