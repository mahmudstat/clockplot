
conv_data <- function(data, time){
  # Data Preparation
  dt <- tidyr::separate_wider_delim(data, cols = {{time}},
                         names = c("hour", "minute"),
                         cols_remove = FALSE,
                         delim = ":") %>% # Separate minute
    dplyr::mutate(minute = as.numeric(ifelse(is.na(minute),0,minute)),
           minute = ifelse(minute<10, minute * 5/30, minute * 5/300),
           hour = as.numeric(hour),
           timc = hour+minute,
           time_angle = ifelse(0<=timc & timc<=6,
                               (6-timc)*pi/12,
                               (30-timc)*pi/12),
           x1 = cos(time_angle)*0.97,
           y1 = sin(time_angle)*0.97,
           x0 = rep(0, dim(data)[1]),
           y0 = rep(0, dim(data)[1]))
  return(dt)
}

#' Give a data set containing times in 24 hours format
#'
#' This function will plot those times on a 24 hour clock to show which
#' events took place at what times. The line segments are drawn using
#' trigonometric angles and complex equations.
#'
#' @param data A data frame
#' @param time Time in 24 hours HH:MM format in the data set  (19:30, for example)
#' @return A ggplot data clock
#' @name clock_chart
NULL
#' @examples
#' df <- data.frame(time = c("06:00", "08:00", "17:30"))
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

