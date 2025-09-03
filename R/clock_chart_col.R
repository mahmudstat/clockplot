#' Clock Chart, Hands Colored by a Numeric Variable
#'
#' This function will plot time of events on a 24 hour clock to show which
#' events took place at what times. The lines are colored by a criteria.
#'
#' Change the title, subtitle or the caption of the plot with
#' `ggplot2::labs()` .Change the legend title by adding
#' `ggplot2::labs(size = "TITLE")` or `labs(color = "TITLE")`.
#'
#' Add
#' or modify legend by `theme(legend.position = "POSITION")`; the valid
#' position names in `ggplot2` are `top`, `bottom`, `right`, and `left`,
#' excluding more complex options.
#'
#' @seealso
#'   [clock_chart_qnt()], and [clock_chart_qlt()].
#'
#' @param data A data frame
#' @param time Time in 24 hours. The allowed time formats for these family
#' of charts are `HH:MM:SS`, `HH:MM` or even `H:M` (such as `12;30:09`
#' or `9:3`).
#' @param crit a numeric vector by which lines will be colored.
#' @param high The color name for the high values. The default is `red`
#' @param low The color name for the high values. The default is `green`.
#' The color names can be vice versa or other colors, depending on the context.
#' @returns A `ggplot` object, which can be further modified
#' with `ggplot2` functions and themes.
#' @name clock_chart_col
NULL
#' @examples
#' df <- data.frame(
#'   time = c("06:00:00", "08:00:00", "17:30:00"),
#'   value = c(3, 6, 9)
#' )
#' clock_chart_col(df, time, crit = value) +
#'   ggplot2::labs(size = "TITLE")
#'
#' @export
clock_chart_col <- function(data, time, crit, high = "red", low = "green") {
  mydata <- conv_data_col(data = data, time = {{ time }}, colby = {{ crit }})
  clock <- basic_clock() +
    ggplot2::geom_segment(
      data = mydata,
      aes(
        x = .data$x0, y = .data$y0,
        xend = .data$x1, yend = .data$y1,
        color = {{ crit }}
      )
    ) +
    ggplot2::geom_point(
      data = mydata,
      ggplot2::aes(.data$x1, .data$y1,
        color = {{ crit }},
        size = {{ crit }}
      )
    ) +
    ggplot2::scale_color_gradient(high = {{ high }}, low = {{ low }}) +
    ggplot2::theme(legend.position = "bottom") +
    ggplot2::labs(size = "Indicator", color = "")
  return(clock)
}
