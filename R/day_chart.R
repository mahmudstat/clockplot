#' Day Chart
#'
#' This function plots values corresponding to each hour on a rose plot.
#'
#' @param hvalue A numeric vector having values at each of 24 hours (starts
#' from 6 am)
#' @param high The color name for the high values. The default is `red`
#' @param low The color name for the high values. The default is `green`.
#' The color names can be vice versa or other colors, depending on the context.
#' @return A circular chart showing values at each hour on a 24-hour clock
#' @name day_chart
NULL
#' @examples
#' value <- sample(15:30,24, replace = TRUE)
#' day_chart(hvalue = value, high = "blue", low = "yellow", width = 0.8)
#' @export
day_chart <- function(hvalue, high = "blue", low = "yellow", width = 0.8){
  ampm = c(rep(" AM",6), rep(" PM",12), rep(" AM",6))
  hour = c(6:12, 1:12, 1:5)
  hours <- paste0(c(6:12, 1:5), ampm)
  df <- tibble(hours, hvalue) %>% mutate(hours = factor(hours, levels = hours))
  chart <- df %>% ggplot(aes(hours, hvalue, fill = hvalue))+
    geom_col(width = width, color = "white")+
    coord_polar("x", start = 270)+
    theme(axis.ticks.x=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank(),
          axis.title = element_blank(),
          legend.position = "right")+
    scale_fill_gradient(low = {{low}}, high = {{high}})+
    geom_text(label = hvalue, position = position_stack(vjust = 1.07),
              color = "black")
  return(chart)
}
