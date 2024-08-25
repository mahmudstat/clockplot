#' Month Chart
#'
#' This function plots values corresponding to each month on a rose plot.
#'
#' @param mvalue A numeric vector having values in each month of the year (starts
#' from January, obviously)
#' @param lgnm Title of legend. The legend position can also be changed by
#' adding `legend.position = "top"`, where `R` accepts as positions
#' `top`, `bottom`, `left`, and `right`.
#' @param high The color name for the high values. The default is `red`
#' @param low The color name for the high values. The default is `green`.
#' #' The color names can be vice versa or other colors, depending on the context.
#' @param width Width of bars
#' @return A circular chart showing values in each month of the year.
#' @name month_chart
NULL
#' @examples
#' syltmp <- c(18.4, 20.8, 24.3, 26.0, 26.8, 27.6, 28.0, 28.2, 27.9, 26.7, 23.3, 19.7)
#' month_chart(mvalue = syltmp)
#' @export
month_chart <- function(mvalue, lgnm = "Value", width = 0.9,
                        high = "yellow", low = "green"){
  Months <- c("January", "February", "March", "April", "May", "June",
              "July", "August", "September", "October", "November", "December")
  Months <- keep_fct_order(Months)
  # mvalue is a vector. If you have it in a data frame, use dataframe$mvalue
  df <- tibble::tibble(Months, mvalue) %>%
    dplyr::mutate(days = factor(Months, levels = Months))
  chart <- df %>% ggplot2::ggplot(ggplot2::aes(Months, mvalue, fill = mvalue))+
    ggplot2::geom_col(width = width)+
    ggplot2::scale_fill_gradient(high = {{high}}, low = {{low}}, name = {{lgnm}})+
    ggplot2::coord_polar("x", start = 270)+
    ggplot2::theme(axis.ticks.x=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank(),
          axis.title = element_blank(),
          legend.position = "bottom")+
    ggplot2::geom_text(label = mvalue, position = position_stack(vjust = 0.8), color = "black")
  # You can also add your own custom legend title by adding the following code
  # + scale_fill_gradient(name = "NAME")
  return(chart)
}
