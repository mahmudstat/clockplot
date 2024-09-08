#' A Clock Chart, Hands Clored by a Factor
#'
#' This function will plot time of events on a 24 hour clock to show which
#' events took place at what times. The hands are colored by a
#' qualitative (factor) vector.

#' Change the title, subtitle or the caption of the plot with
#' `ggplot2::labs()`. Change the legend title by adding
#' `ggplot2::labs(color = "TITLE")`. Add
#' or modify legend by `theme(legend.position = "POSITION")`; the valid
#' postion names in `ggplot2` are `top`, `bottom`, `right`, and `left`,
#' excluding more complex options.
#'

#' @seealso
#'  [clock_chart_col()] for coloring by a numeric variable,
#'  [clock_chart_qnt()] for coloring and modifying length by a numeric variable,
#'  [clock_chart_len()] for modifying length by a numeric variable,
#'  [clock_chart()] for the simplest clock chart
#'
#' @param data A data frame
#' @param time Time in 24 hours HH:MM:SS format in the data set  (19:30:01, for example)
#' @param crit The qualitative vector by which hands will be colored.

#' @name clock_chart_qlt
NULL
#' @examples
#' # A plot showing sms receiving times based on
#' # criteria (type/sender/invoked)
#' clock_chart_qlt(smsclock, time = time, crit = sender)

#' @export
clock_chart_qlt<- function(data, time, crit){
  crit = dplyr::pull(data, {{crit}})
  if(length(unique(crit))>5) warning("No. of categories is more than 5. Plot may not look good. Try clock_chart() function instead?")
  mydata <- conv_data(data = data, time = {{time}})
  clock <- basic_clock()+
    ggplot2::geom_segment(data = mydata,
                          ggplot2::aes(x= .data$x0, y = .data$y0,
                                       xend = .data$x1, yend = .data$y1, color = {{crit}}))+
    ggplot2::geom_point(data = mydata, ggplot2::aes(.data$x1, .data$y1, color = {{crit}}))+
    ggplot2::theme(legend.position = "right")
  return(clock)
}
