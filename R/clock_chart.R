#' Give a 24 hours clock chart
#'
#' This function will plot time of events on a 24 hour clock to show which
#' events took place at what times. The lines are black are not colored or size
#' altered. to do so, use `clock_chart_col` or `clock_chart_len`. To do both
#' simultaneously, use `clock_chart_qnt`. To use a qualitative variable as
#' the criterion, use `clock_chart_qlt`.
#'
#'
#' @param data A data frame
#' @param time Time in 24 hours HH:MM:SS format in the data set
#' (19:30:01, for example, although the SS part is ignored due to having
#' negligible impact on the final plot, but is kept for better ...)
#' @return A ggplot data clock
#' @name clock_chart
NULL
#' @examples
#' df <- data.frame(time = c("06:00:00", "08:00:00", "17:30:00"))
#' clock_chart(df, time)
#' @export
clock_chart <- function(data, time){
  mydata <- dataclock:::conv_data(data = data, time = {{time}})
  clock <- basic_clock()+
    ggplot2::geom_segment(data = mydata,
                          ggplot2::aes(x= x0, y = y0, xend = x1, yend = y1))+
    ggplot2::geom_point(data = mydata, ggplot2::aes(x1, y1))
  return(clock)
}



