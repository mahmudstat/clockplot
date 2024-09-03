#' A Clock Chart, hands colored by a factor
#'
#' This function will plot time of events on a 24 hour clock to show which
#' events took place at what times. The hands are colored by a
#' qualitative vector.
#'
#' @param data A data frame
#' @param time Time in 24 hours HH:MM:SS format in the data set  (19:30:01, for example)
#' @param crit The qualitative vector by which hands will be colored.
#' @return A ggplot clock chart with hands colored by a criteria.
#' @name clock_chart_qlt
NULL
#' @examples
#' # A plot showing sms receiving times based on
#' # criteria (type/sender/invoked)
#' clock_chart_qlt(smsclock, time = time, crit = sender)
#' # Now let's check a random data
#' df <- tibble::tibble(hr = sample(0:23, 50, replace = TRUE),
#'                   mnt = sample(0:59, 50, replace = TRUE),
#'                   sec = sample(0:59, 50, replace = TRUE),
#'                   time = paste(hr, mnt, sec, sep = ":"),
#'                   value = factor(sample(5,50, replace = TRUE)))
#' clock_chart_qlt(df, time, crit = value)
#' # Add more stuff to the plot
#' p1 <- clock_chart_qlt(df, time, crit = value)
#' p1 + ggplot2::theme(legend.position = "right")+
#' ggplot2::labs(title = "Clock chart of factor values")
#'
#' # Plot chats of two friends during the course of a day.
#' data(chatdf)
#' clock_chart_qlt(chatdf, time = time, crit = name)
#'
#' # To choose your own colors, add the following code
#' mycol <- c("#5dff06", "#47c144", "#318483", "#1a46c1", "#0408ff")
#' clock_chart_qlt(smsclock, time = time, crit = sender)+
#' ggplot2::scale_color_manual(values = mycol)
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
    ggplot2::theme(legend.position = "bottom")
  return(clock)
}
