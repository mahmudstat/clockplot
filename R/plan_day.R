#' Visually Plan Activities on a Day with Events on Each of 24 Hours
#'
#' This function plots works corresponding to each hour on a rose plot.
#'
#' @param dwork A character vector of length 24, with activity names for each
#' hour starting from 6 AM and ending at 5 AM the next day.
#' @param width Width of bars.
#' @param brdcol Color of bar border. Use `NA` for no border.
#'
#' @returns A `ggplot` object, which can be further modified
#'   with `ggplot2` functions and themes.
#'
#' @examples
#' set.seed(123)
#' work <- sample(c("Study", "Adda", "Entertainment", "Games", "Exercise", "Meal"),
#'   size = 24, replace = TRUE
#' )
#' plan_day(dwork = work, brdcol = NA)
#' @export
plan_day <- function(dwork, width = 1, brdcol = "grey") {
  stopifnot("dwork must be a character vector of length 24" =
              is.character(dwork) && length(dwork) == 24)

  hours <- c(paste0(6:11, " AM"), "12 PM",
             paste0(1:11, " PM"), "12 AM",
             paste0(1:5, " AM"))

  df <- tibble::tibble(hours, dwork) %>%
    dplyr::mutate(hours = factor(hours, levels = hours))

  # Calculate smart angles for text labels
  angles <- 90 - 360 * (seq_along(hours) - 0.5) / length(hours)
  angles <- ifelse(angles > 90, angles + 180, angles)
  angles <- ifelse(angles < -90, angles + 180, angles)

  # Create plot
  p <- ggplot2::ggplot(df, ggplot2::aes(x = hours, y = 1, fill = dwork)) +
    ggplot2::geom_col(width = width, color = brdcol) +
    ggplot2::coord_polar("x", start = 270) +
    ggplot2::geom_text(
      ggplot2::aes(label = dwork),
      position = ggplot2::position_stack(vjust = 0.5),
      angle = angles,
      color = "black", size = 3
    ) +
    ggplot2::scale_fill_brewer(palette = "Set2") +
    ggplot2::theme(
      axis.ticks.x = ggplot2::element_blank(),
      axis.text.y = ggplot2::element_blank(),
      axis.ticks.y = ggplot2::element_blank(),
      axis.title = ggplot2::element_blank(),
      legend.position = "none"
    )

  return(p)
}
