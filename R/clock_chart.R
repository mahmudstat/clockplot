#' The Simplest Clock Chart, Lines Unmodified
#'
#' There are five types of clock charts, `clock_chart()` being the simplest one.
#' It just shows the event times on a 24 hour clock. The lines are neither
#' colored, nor length modified. `clock_chart_col()` is used to colorize and
#' `clock_chart_len()` to change the length of the hands by a numeric vector.
#' To do both simultaneously, use `clock_chart_qnt()`. To use a qualitative
#' variable as the criterion, use `clock_chart_qlt()`.
#'
#' Change the title, subtitle or the caption of the plot with
#' `ggplot2::labs()`.
#'
#' @seealso
#'   [clock_chart_col()], [clock_chart_qnt()], and [clock_chart_qlt()].
#' @param data A data frame
#' @param time Time in 24 hours. The allowed time formats for these family
#' of charts are `HH:MM:SS`, `HH:MM` or even `H:M` (such as `12;30:09`
#' or `9:3`), although the SS part is ignored due to having
#' negligible impact on the final plot).
#' @param Col A single color name for the lines. The default is `black`.
#' @returns A `ggplot` object, which can be further modified
#' with `ggplot2` functions and themes.
#'
#' @examples
#' p1 <- clock_chart(smsclock, time) # Using package built-in data
#' p1 + ggplot2::labs(title = "SMS Receiving Times")
#' #  Add clock_chart(brintcity %>% filter(Origin == "Dhaka"), time = Departure)
#' @export
clock_chart <- function(data, time, Col = "black") {
  if (!inherits(data, "data.frame")) {
    stop("`data` must be a data frame or tibble", call. = FALSE)
  }

  mydata <- conv_data(data = data, time = {{ time }})

  # Add a new column for the color
  mydata$line_color <- Col

  clock <- basic_clock() +
    ggplot2::geom_segment(
      data = mydata,
      ggplot2::aes(
        x = .data$x0, y = .data$y0,
        xend = .data$x1, yend = .data$y1,
        color = .data$line_color
      )
    ) +
    ggplot2::geom_point(
      data = mydata,
      ggplot2::aes(
        x = .data$x1, y = .data$y1,
        color = .data$line_color
      )
    ) +
    # Use scale_color_identity to treat the color value literally
    ggplot2::scale_color_identity()

  return(clock)
}
