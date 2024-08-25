#' Clock Chart with Modified Length
#'
#' This function will plot time of events on a 24 hour clock to show which
#' events took place at what times. The length of the hands are modified
#' according to a quantitative vector. A color name can be used for the hands.
#' For better use of color and length together, consider using `clock_chart_qnt()`.
#'
#' @param data A data frame
#' @param time Time in 24 hours HH:MM:SS format in the data set  (19:30:01, for example)
#' @param len A quantitative vector by which length of hands will be modified.
#' @param col An optional color name for the hands, defaulted to `black`.
#' @return A ggplot data clock with modified hands.
#' @name clock_chart_len
NULL
#' @examples
#' df <- tibble::tibble(hr = sample(0:23, 30, replace = TRUE),
#'                   mnt = sample(0:59, 30, replace = TRUE),
#'                   sec = sample(0:59, 30, replace = TRUE),
#'                   time = paste(hr, mnt, sec, sep = ":"),
#'                   value = sample(40,30))
#' clock_chart_len(df, time, len = value, col = "blue")
#' @export
clock_chart_len <- function(data, time, len, col = "black"){
  mydata <- conv_data_len(data = data, time = {{time}}, len = {{len}})
  clock <- basic_clock()+
    ggplot2::geom_segment(data = mydata,
                          ggplot2::aes(x= .data$x0, y = .data$y0,
                                       xend = .data$x1, yend = .data$y1, color = {{col}}))+
    ggplot2::geom_point(data = mydata,
                        ggplot2::aes(.data$x1, .data$y1, color = {{col}}))
  return(clock)
}
