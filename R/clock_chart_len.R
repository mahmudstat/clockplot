#' Clock Chart with Modified Length
#'
#' This function will plot time of events on a 24 hour clock to show which
#' events took place at what times. The length of the hands are modified
#' according to a numeric vector. A color name can be used for the hands.
#' For better use of color and length together, consider using `clock_chart_qnt()`.
#'
#' Change the title, subtitle or the caption of the plot with
#' `ggplot2::labs()`. See examples.
#' @seealso
#'  [clock_chart_col()] for coloring by a numeric variable,
#'  [clock_chart_qnt()] for coloring and modifying length by a numeric variable,
#'  [clock_chart_qlt()] for coloring by a qualitative variable,
#'  [clock_chart()] for the simplest clock chart
#'
#' @param data A data frame
#' @param time Time in 24 hours HH:MM:SS format in the data set  (19:30:01, for example)
#' @param crit A numeric vector by which length of hands will be modified.
#' @param Col An optional color name for the hands, defaulted to `black`.
#'
#' @name clock_chart_len
NULL
#' @examples
#' df <- tibble::tibble(hr = sample(0:23, 30, replace = TRUE),
#'                   mnt = sample(0:59, 30, replace = TRUE),
#'                   sec = sample(0:59, 30, replace = TRUE),
#'                   time = paste(hr, mnt, sec, sep = ":"),
#'                   value = sample(40,30))
#' clock_chart_len(df, time, crit = value, Col = "blue")+
#' ggplot2::labs(title = "Plot Title")
#' @export
clock_chart_len <- function(data, time, crit, Col = "black"){
  mydata <- conv_data_len(data = data, time = {{time}}, len = {{crit}})
  clock <- basic_clock()+
    ggplot2::geom_segment(data = mydata, color = Col,
                          ggplot2::aes(x= .data$x0, y = .data$y0,
                                       xend = .data$x1, yend = .data$y1))+
    ggplot2::geom_point(data = mydata,
                        ggplot2::aes(.data$x1, .data$y1, color = {{Col}}))
  return(clock)
}
