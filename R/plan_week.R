#' Visually Plan Activities on a Week with Events on Each Day
#'
#' This function plots works corresponding to each day of the week.
#'
#' @param wtask A factor variable having values on each day of the week.
#' @returns A `ggplot` object, which can be further modified
#' with `ggplot2` functions and themes.
#' @examples
#' set.seed(10)
#' wtask <- c(
#'   "Desk Work", "Field Work", "Visit", "Monitoring",
#'   "Rest", "Reporting", "Meeting"
#' )
#' plan_week(wtask)
#' @export
plan_week <- function(wtask) {
  # Input validation
  stopifnot("wtask must have exactly 7 elements" = length(wtask) == 7)
  # Week Skeleton
  # Task of seven days starting from Saturday
  days <- paste(c("Satur", "Sun", "Mon", "Tues", "Wednes", "Thurs", "Fri"), "day", sep = "")
  area <- rep(5, 7)
  angle <- c(56, 5, 320, 90, 40, 350, 115)
  dfweek <- tibble::tibble(days, area, wtask, angle) %>%
    dplyr::mutate(days = factor(days, levels = days))
  # Now plot
  dfweek %>% ggplot2::ggplot(ggplot2::aes(days, area, fill = days)) +
    ggplot2::geom_col(width = 1, color = "white") +
    ggplot2::coord_polar() +
    ggplot2::theme(
      axis.ticks.x = ggplot2::element_blank(),
      axis.text.x = ggplot2::element_text(face = "bold"),
      axis.text.y = ggplot2::element_blank(),
      axis.ticks.y = ggplot2::element_blank(),
      axis.title = ggplot2::element_blank(),
      panel.border = ggplot2::element_blank(),
      legend.position = "none"
    ) +
    ggplot2::geom_text(
      label = wtask, position = ggplot2::position_stack(vjust = 0.5),
      color = "black", angle = angle
    ) #+
  # scale_fill_brewer(palette = {{col}}, direction = -1)
}
