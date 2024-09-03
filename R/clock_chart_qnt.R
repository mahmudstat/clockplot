#' Clock Chart, Length and Color Modified by a quantitative variable
#'
#' This function will plot time of events on a 24 hour clock to show which
#' events took place at what times. The length and color of the hands are
#' modified according to a quantitative vector.
#'
#' @param data A data frame
#' @param time Time in 24 hours HH:MM:SS format in the data set  (19:30:01, for example)
#' @param crit The quantitative vector by which hands will be modified and colored.
#' @param high The color name for the high values. The default is `red`
#' @param low The color name for the high values. The default is `green`.
#' The color names can be vice versa or other colors, depending on the context.
#' To use a single color for all lines, use same value for `high` and `low`
#' @return A ggplot data clock with modified hands.
#' @name clock_chart_qnt
NULL
#' @examples
#' df <- tibble::tibble(hr = sample(0:23, 50, replace = TRUE),
#'                   mnt = sample(0:59, 50, replace = TRUE),
#'                   sec = sample(0:59, 50, replace = TRUE),
#'                   time = paste(hr, mnt, sec, sep = ":"),
#'                   value = sample(60,50))
#' clock_chart_qnt(df, time, crit = value)
#' p1 <- clock_chart_qnt(df, time, crit = value, high = "red", low = "blue")
#' p1 + ggplot2::theme(legend.position = "right")+
#' ggplot2::labs(title = "Clock chart of random values")
#' @export
clock_chart_qnt <- function(data, time, crit, high = "red", low = "green"){
  mydata <- conv_data_len(data = data, time = {{time}}, len = {{crit}})
  clock <- basic_clock()+
    ggplot2::geom_segment(data = mydata,
                          ggplot2::aes(x= .data$x0, y = .data$y0,
                                       xend = .data$x1, yend = .data$y1,
                                       color = {{crit}}))+
    ggplot2::geom_point(data = mydata,
                        ggplot2::aes(.data$x1, .data$y1, color = {{crit}}))+
    ggplot2::scale_color_gradient(high = {{high}}, low = {{low}})+
    ggplot2::theme(legend.position = "bottom")
  return(clock)
}
