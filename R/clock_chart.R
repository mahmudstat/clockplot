#' Give a data set containing times in 24 hours format (19:30, for example)
#'
#' This function will plot those times on a 24 hour clock to show which
#' events took place at what times. The line segments are drawn using
#' trigonometric angles and complex equations.
#'
#' @param data A data set
#' @param time Time in 24 hours format in the data set
#' @return A ggplot data clock
#' @examples
#' clock_chart(data = df, time = time)

#' @export

basic_clock <- function(){
  k <- 24 # Hours
  subk <- 24*5
  times <- exp(1i * 2 * pi * (k:1) / k)
  subtimes <- data.frame(SubT = exp(1i * 2 * pi * (subk:1) / subk))
  ampm = c(rep(" AM",6), rep(" PM",12), rep(" AM",6))
  dfclock <- tibble::tibble(time = times,
                    hour = c(6:12, 1:12, 1:5), # May not be needed
                    label = paste0(c(6:12, 1:5), ampm))
  clock_skeleton <-  dfclock %>% ggplot()+
    geom_text(data = dfclock, aes(Re(time)*1.1, Im(time)*1.1, label = label))+
    geom_point(data = subtimes,
               aes(Re(SubT), Im(SubT)), shape = 19, color = "black", size = 0.6)+
    geom_path(data = subtimes, aes(Re(SubT), Im(SubT)))+
    # Connect Last two missing points
    geom_line(data = subtimes %>% slice(-c(2:119)), aes(Re(SubT), Im(SubT)))+
    geom_point(aes(Re(time), Im(time)), color = "black", size = 1.8)+
    labs(x = "", y = "")+
    theme(axis.text.x=element_blank(),
          axis.ticks.x=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank(),
          legend.position = "none")+
    geom_point(aes(0,0), color = "black", size = 2)
  return(clock_skeleton)
}

conv_data <- function(data, time){
  # Data Preparation
  dt <- data %>%
    separate_wider_delim(cols = {{time}},
                         names = c("hour", "minute"),
                         cols_remove = FALSE,
                         delim = ":") %>% # Separate minute
    mutate(minute = as.numeric(ifelse(is.na(minute),0,minute)),
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

clock_chart <- function(data, time){
  mydata <- conv_data(data = data, time = {{time}})
  clock <- basic_clock()+
    geom_segment(data = mydata,
                 aes(x= x0, y = y0, xend = x1, yend = y1))+
    geom_point(data = mydata, aes(x1, y1))
  return(clock)
}
