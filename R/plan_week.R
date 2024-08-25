#' Week Planner
#'
#' This function plots works corresponding to each day of the week.
#'
#' @param wtask A factor variable having values on each day of the week.
#' @return A plot showing task planned or done on each day of the week.
#' @name plan_week
NULL
#' @examples
#' set.seed(10)
#' wtask <- c("Desk Work", "Field Work", "Visit", "Monitoring", "Rest", "Reporting", "Meeting")
#' plan_week(wtask)
#' @export
plan_week <- function(wtask){
  # Week Skeleton
  # Task of seven days starting from Saturday
  days <- paste(c("Satur", "Sun", "Mon", "Tues", "Wednes", "Thurs", "Fri"), "day", sep = "")
  area <- rep(5,7)
  angle <- c(56, 5, 320, 90, 40, 350, 115)
  dfweek <- tibble::tibble(days, area, wtask, angle) %>%
    dplyr::mutate(days = factor(days, levels = days))
  # Now plot
  dfweek %>% ggplot2::ggplot(ggplot2::aes(days, area, fill = days))+
    ggplot2::geom_col(width = 1, color = "white")+
    ggplot2::coord_polar()+
    ggplot2::theme(axis.ticks.x=element_blank(),
          axis.text.x = element_text(face = "bold"),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank(),
          axis.title = element_blank(),
          panel.border = element_blank(),
          legend.position = "none")+
    ggplot2::geom_text(label = wtask, position = position_stack(vjust = 0.5),
              color = "black", angle = angle)#+
    #scale_fill_brewer(palette = {{col}}, direction = -1)
}
