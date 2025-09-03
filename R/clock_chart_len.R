#' Clock Chart with Modified Length
#'
#' This function will plot time of events on a 24 hour clock to show which
#' events took place at what times. The length of the hands are modified
#' according to a numeric vector. A color name can be used for the hands.
#' This function has been seen to be unnecessary and its purpose is better-served by `clock_chart_qnt()`, and hence will be deprecated in the next version..
#'
#' Change the title, subtitle or the caption of the plot with
#' `ggplot2::labs()`. See examples.
#' @seealso
#'   [clock_chart_col()] for coloring by a numeric variable,
#'   [clock_chart_qnt()] for coloring and modifying length by a numeric variable,
#'   [clock_chart_qlt()] for coloring by a qualitative variable,
#'   [clock_chart()] for the simplest clock chart
#'
#' @param data A data frame
#' @param time Time in 24 hours. The allowed time formats for these family
#' of charts are `HH:MM:SS`, `HH:MM` or even `H:M` (such as `12;30:09`
#' or `9:3`).
#' @param crit A numeric vector by which length of hands will be modified.
#' @param Col An optional color name for the hands, defaulted to `black`.
#' @returns A `ggplot` object, which can be further modified
#' with `ggplot2` functions and themes.
#' @name clock_chart_len
# # NULL
#' @examples
#' p1 <- clock_chart_len(data = bdquake, time = hms, crit = depth)
#' p1 + ggplot2::labs(title = "Earthquakes in Bangladesh since 2023")
#' @export
clock_chart_len <- function(data, time, crit, Col = "black"){
  mydata <- conv_data_len(data = data, time = {{ time }}, len = {{ crit }})
  clock <- basic_clock()+
    ggplot2::geom_segment(data = mydata, color = Col,
                          ggplot2::aes(x= .data$x0, y = .data$y0,
                                       xend = .data$x1, yend = .data$y1))+
    ggplot2::geom_point(data = mydata,
                        ggplot2::aes(.data$x1, .data$y1, color = {{ Col }}))
  return(clock)
}
