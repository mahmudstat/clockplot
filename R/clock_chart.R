#' The simplest Clock chart, lines neither modified or colored by variable
#'
#' There are five types of clock charts, `clock_chart()` being the simplest one.
#' It just shows the event times on a 24 hour clock. The lines are neither
#' colored, nor length modified. `clock_chart_col()` is used to colorize and
#' `clock_chart_len()` to change the length of the hands by a quantitative vector.
#' To do both simultaneously, use `clock_chart_qnt()`. To use a qualitative
#' variable as the criterion, use `clock_chart_qlt()`.
#'
#' The output gives a ggplot, so you can further modify it by applying some
#' ggplot2 function, most importantly the `labs` function, with which the title,
#' subtitle, and captions can be added to the plot.
#'
#'
#' @param data A data frame
#' @param time Time in 24 hours HH:MM:SS format in the data set
#' (19:30:01, for example, although the SS part is ignored due to having
#' negligible impact on the final plot, but is kept for better ...)
#' @param Col Color name for the lines. The default is `black`.
#' @return A ggplot data clock
#' @name clock_chart
NULL
#' @examples
#' df <- data.frame(time = c("06:00:00", "08:00:00", "17:30:00"))
#' clock_chart(df, time)
#' p1 <- clock_chart(df, time)
#' p1 + ggplot2::labs(title = "Sample plot")
#' @export
clock_chart <- function(data, time, Col = "black"){
  mydata <- conv_data(data = data, time = {{time}})
  clock <- basic_clock()+
    ggplot2::geom_segment(data = mydata, color = Col,
                          ggplot2::aes(x= .data$x0, y = .data$y0,
                                       xend = .data$x1, yend = .data$y1))+
    ggplot2::geom_point(data = mydata, ggplot2::aes(.data$x1, .data$y1))
  return(clock)
}

