#' Give a data set containing times in 24 hours format (19:30, for example)
#'
#' This function will plot those times on a 24 hour clock to show which
#' events took place at what times. The line segments are drawn using
#' trigonometric angles and complex equations.
#'
#' @return A ggplot data clock
#' @examples
#' basic_clock()

#' @export

basic_clock <- function(){
  k <- 24 # Hours
  subk <- 24*5
  times <- exp(1i * 2 * pi * (k:1) / k)
  subtimes <- data.frame(SubT = exp(1i * 2 * pi * (subk:1) / subk))
  ampm = c(rep(" AM",6), rep(" PM",12), rep(" AM",6))
  dfclock <- tibble(time = times,
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

