#' Clock Chart, Length and Color Modified by Numeric Variables
#'
#' This function will plot time of events on a 24 hour clock to show which
#' events took place at what times. The length and color of the hands are
#' modified according to a numeric vector.
#'
#' Change the title, subtitle or the caption of the plot with
#' `ggplot2::labs()` .Change the legend title by adding
#' `ggplot2::labs(color = "TITLE 1", size = "TITLE2")`.
#' Add
#' or modify legend by `theme(legend.position = "POSITION")`; the valid
#' postion names in `ggplot2` are `top`, `bottom`, `right`, and `left`,
#' excluding more complex options.
#'
#' @seealso
#'  [clock_chart_col()] for coloring by a numeric variable,
#'  [clock_chart_qlt()] for coloring by a qualitative variable,
#'  [clock_chart_len()] for modifying length by a numeric variable,
#'  [clock_chart()] for the simplest clock chart
#'
#' @param data A data frame
#' @param time Time in 24 hours. The allowed time formats for these family
#' of charts are `HH:MM:SS`, `HH:MM` or even `H:M` (such as `12;30:09`
#' or `9:3`).
#' @param len The numeric vector by which hands will be modified and colored.
#' @param Col The color of line segments and points.
#' @param high The color name for the high values. The default is `red`
#' @param low The color name for the high values. The default is `green`.
#' The color names can be vice versa or other colors, depending on the context.
#' To use a single color for all lines, use same value for `high` and `low`

#' @name clock_chart_qnt
NULL
#' @examples
#' p1 <- clock_chart_qnt(data = bdquake, time = hms, len = depth,
#' Col = mag, high = "red", low = "blue")
#' p1 + ggplot2::labs(color = "Depth", size = "Magnitude",
#' title = "Earthquakes in Bangladesh since 2023")
#' @export
clock_chart_qnt <- function(data, time, len, Col, high = "red", low = "green"){
  mydata <- conv_data_len(data = data, time = {{ time }}, len = {{ len }})
  clock <- basic_clock()+
    ggplot2::geom_segment(data = mydata,
                          ggplot2::aes(x= .data$x0, y = .data$y0,
                                       xend = .data$x1, yend = .data$y1,
                                       color = {{ len }}))+
    ggplot2::geom_point(data = mydata,
                        ggplot2::aes(.data$x1, .data$y1,
                                     color = {{ len }}, size = {{ Col }}))+
    ggplot2::scale_color_gradient(high = {{ high }}, low = {{ low }})+
    ggplot2::theme(legend.position = "bottom")
  return(clock)
}
