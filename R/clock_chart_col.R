#' Clock Chart, Hands Colored by a Numeric Variable
#'
#' This function will plot time of events on a 24 hour clock to show which
#' events took place at what times. The lines are colored by a criteria.
#'
#' Change the title, subtitle or the caption of the plot with
#' `ggplot2::labs()` .Change the legend title by adding
#' `ggplot2::labs(color = "TITLE")`. Add
#' or modify legend by `theme(legend.position = "POSITION")`; the valid
#' postion names in `ggplot2` are `top`, `bottom`, `right`, and `left`,
#' excluding more complex options.
#'
#' @seealso
#'  [clock_chart_len()] for modifying length by a numeric variable,
#'  [clock_chart_qnt()] for coloring and modifying length by a numeric variable,
#'  [clock_chart_qlt()] for coloring by a qualitative variable,
#'  [clock_chart()] for the simplest clock chart
#'
#' @param data A data frame
#' @param time Time in 24 hours `HH:MM:SS` format in the data set  (19:30:01, for example)
#' @param crit a numeric vector by which lines will be colored.
#' @param high The color name for the high values. The default is `red`
#' @param low The color name for the high values. The default is `green`.
#' The color names can be vice versa or other colors, depending on the context.
#' @name clock_chart_col
NULL
#' @examples
#' df <- data.frame(time = c("06:00:00", "08:00:00", "17:30:00"),
#' value = c(3,6,9))
#' clock_chart_col(df, time, crit = value)+
#' ggplot2::labs(color = "TITLE")
#'
#' @export
clock_chart_col <- function(data, time, crit, high = "red", low = "green"){
  mydata <- conv_data_col(data = data, time = {{time}}, colby = {{crit}})
  clock <- basic_clock()+
    ggplot2::geom_segment(data = mydata,
                          aes(x= .data$x0, y = .data$y0,
                              xend = .data$x1, yend = .data$y1,
                              color = {{crit}}))+
    ggplot2::geom_point(data = mydata, ggplot2::aes(.data$x1, .data$y1, color = {{crit}}))+
    ggplot2::scale_color_gradient(high = {{high}}, low = {{low}})+
    ggplot2::theme(legend.position = "bottom")+
    ggplot2::labs(color = "Indicator")
  return(clock)
}

