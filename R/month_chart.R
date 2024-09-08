#' Month Chart
#'
#' This function plots values corresponding to each month on a rose plot.
#'
#' @param df A data frame containing days of the month and corresponding values.
#' @param Days Days of the month; should start from 1 and be between 28 and 31
#' @param mvalue A numeric vector having values in each month of the year (starts
#' from January, obviously)
#' @param lgnm Title of legend. The legend position can also be changed by
#' adding `legend.position = "POSITION"`, where the accepted positions are
#' `top`, `bottom`, `left`, and `right`.
#' @param width Width of bars
#' @param high The color name for the high values. The default is `red`
#' @param low The color name for the high values. The default is `green`.
#' #' The color names can be vice versa or other colors, depending on the context.
#' @return A circular chart showing values in each month of the year.
#' @name month_chart
NULL
#' @examples
#' Days <- 1:30
#' expense <- c(sample(15:20, 15, replace = TRUE),
#'              sample(10:15, 5, replace = TRUE),
#'              sample(8:10, 5, replace = TRUE),
#'              sample(5:8, 3, replace = TRUE),
#'              sample(4:7, 2, replace = TRUE))
#' dfm <- tibble::tibble(Days, expense)
#' month_chart(df = dfm, Days = Days, mvalue = expense)

month_chart <- function(df, Days, mvalue, lgnm = "Value", width = 0.9,
                        high = "yellow", low = "green"){
  df <- df %>% dplyr::mutate(Days = factor(Days, levels = Days))
  chart <- df %>% ggplot2::ggplot(ggplot2::aes(Days, mvalue, fill = mvalue))+
    ggplot2::geom_col(width = width)+
    ggplot2::scale_fill_gradient(high = {{high}}, low = {{low}}, name = {{lgnm}})+
    ggplot2::coord_polar("x", start = 270)+
    ggplot2::theme(axis.ticks.x=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank(),
          axis.title = element_blank(),
          legend.position = "bottom")+
    ggplot2::geom_text(label = mvalue, position = position_stack(vjust = 0.8), color = "black")
  # You can also add your own custom legend title by adding the following code
  # + scale_fill_gradient(name = "NAME")
  return(chart)
}

