#' Week Chart
#'
#' This function plots values corresponding to each day on a rose plot.
#'
#'
#' @seealso
#'  [day_chart()] for plotting values in on a day hours
#'  [year_chart()] for plotting values on in a year by months
#'  [cyclic_chart()] for plotting values by arbitrary period
#'
#' @param wvalue A numeric vector having values on each day, starting from
#' Saturday
#' @param lgnm Title of legend
#' @param high The color name for the high values. The default is `red`
#' @param low The color name for the high values. The default is `green`.
#' The color names can be vice versa or other colors, depending on the context.
#' @param width The width of bars.
#' @return A circular chart showing values at each hour on a 24-hour clock
#' @name week_chart
NULL
#' @examples
#' set.seed(10)
#' wtemp <- sample(10:40,7)
#' week_chart(wtemp, high = "yellow")+ggplot2::labs(title = "Random Values by Day")
#' @export
week_chart <- function(wvalue, lgnm = "Value",
                       high = "yellow", low = "green", width = 0.5){
  days <- paste(c("Satur", "Sun", "Mon", "Tues", "Wednes", "Thurs", "Fri"), "day", sep = "")
  df <- tibble::tibble(days, wvalue) %>%
    dplyr::mutate(days = factor(days, levels = days))
  chart <- df %>% ggplot2::ggplot(ggplot2::aes(days, wvalue, fill = wvalue))+
    ggplot2::geom_col(width = {{width}})+
    ggplot2::scale_fill_gradient(high = {{high}}, low = {{low}}, name = {{lgnm}})+
    ggplot2::coord_polar("x", start = 270)+
    theme(axis.ticks.x=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank(),
          axis.title = element_blank(),
          legend.position = "right")+
    ggplot2::geom_text(label = wvalue,
                       position = position_stack(vjust = 0.8), color = "black")
  # You can also add your own custom legend title by adding the following code
  # + scale_fill_gradient(name = "NAME")
  return(chart)
}
