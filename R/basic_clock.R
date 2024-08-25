#' Give a data set containing times in 24 hours format (19:30, for example)
#'
#' This function will plot those times on a 24 hour clock to show which
#' events took place at what times. The line segments are drawn using
#' trigonometric angles and complex equations.
#'
#' @name basic_clock
#' @import dplyr ggplot2
NULL

#' @return A ggplot clock chart
#' @examples
#' basic_clock()

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
  clock_skeleton <-  ggplot2::ggplot(dfclock)+
    ggplot2::geom_text(data = dfclock, ggplot2::aes(Re(.data$time)*1.1,
                                                    Im(.data$time)*1.1,
                                                    label = .data$label))+
    ggplot2::geom_point(data = subtimes,
                        ggplot2::aes(Re(.data$SubT), Im(.data$SubT)),
                        shape = 19, color = "black", size = 0.6)+
    ggplot2::geom_path(data = subtimes, ggplot2::aes(Re(.data$SubT), Im(.data$SubT)))+
    # Connect Last two missing points
    ggplot2::geom_line(data = dplyr::slice(subtimes, -c(2:119)),
                       ggplot2::aes(Re(.data$SubT), Im(.data$SubT)))+
    ggplot2::geom_point(ggplot2::aes(Re(.data$time), Im(.data$time)),
                        color = "black", size = 1.8)+
    ggplot2::labs(x = "", y = "")+
    ggplot2::theme(axis.text.x=ggplot2::element_blank(),
                   axis.ticks.x=ggplot2::element_blank(),
                   axis.text.y=ggplot2::element_blank(),
                   axis.ticks.y=ggplot2::element_blank(),
                   legend.position = "none",
                   aspect.ratio = 1)#+
    #ggplot2::geom_point(ggplot2::aes(0,0), color = "black", size = 2)
  return(clock_skeleton)
}

