#' Give a data set containing times in 24 hours format
#'
#' This function will find plot those times on a 24 hour clock to show which
#' events took place at what times. The line segments are drawn using
#' trigonometric angles and complex equations.
#'
#' @param Data A data set
#' @param Time Time in 24 hours format in the data set
#' @param Criteria The variable by which to change color/width of time lines
#' @return A ggplot data clock


#' @export

data_clock <- function(Data, Time, Criteria){
  # data preparation
  data <- Data %>% mutate(time = Time/100) %>%
    separate(time, into = c("hour", "minute")) %>%
    mutate(minute = as.numeric(ifelse(is.na(minute),0,minute)),
           minute = ifelse(minute<10, minute * 5/30, minute * 5/300),
           hour = as.numeric(hour),
           timc = hour+minute,
           time_angle = ifelse(0<=timc & timc<=6,
                               (6-timc)*pi/12,
                               (30-timc)*pi/12),
           x1 = cos(time_angle)*.9,
           y1 = sin(time_angle)*.9,
           x0 = rep(0, dim(Data)[1]),
           y0 = rep(0, dim(Data)[1]))

  ## Clock preparation

  ampm = c(rep(" AM",6), rep(" PM",12), rep(" AM",6))
  k <- 24
  times <- exp(1i * 2 * pi * (k:1) / k)
  dfclock <- tibble(time = times,
                    label = paste0(c(6:12, 1:5), ampm))
  # Plot

  data %>% ggplot(aes(x0,y0))+
    geom_segment(aes(xend = x1, yend = y1,
                     color = Criteria))+
    scale_color_gradient("Criteria",
                         low = "green",
                         high = "red")+
    geom_text(data = dfclock,
              aes(Re(time), Im(time), label = label))+
    labs(x = "", y = "")+
    theme(axis.text.x=element_blank(),
          axis.ticks.x=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank(),
          legend.position = "none")
}

