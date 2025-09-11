#' Plot Values on Each Day of a Week
#'
#' This function plots values corresponding to each day on a rose plot.
#'
#'
#' @seealso
#'   [day_chart()] for plotting values in on a day hours
#'   [year_chart()] for plotting values on in a year by months
#'   [cyclic_chart()] for plotting values by arbitrary period
#'
#' @param wvalue A numeric vector having values on each day, starting from
#' Saturday
#' @param lgnm Title of legend
#' @param high The color name for the high values. The default is `red`
#' @param low The color name for the low values. The default is `green`.
#' The color names can be vice versa or other colors, depending on the context.
#' @param width The width of bars.
#' @returns A `ggplot` object, which can be further modified
#' with `ggplot2` functions and themes.
#' @examples
#' set.seed(10)
#' wtemp <- sample(10:40, 7)
#' week_chart(wtemp, high = "yellow") + ggplot2::labs(title = "Random Values by Day")
#' @export
week_chart <- function(wvalue, lgnm = "Value",
                       high = "yellow", low = "green", width = 0.9) {
  stopifnot(
    "wvalue must be numeric" = is.numeric(wvalue),
    "wvalue must have exactly 7 elements (one for each day)" = length(wvalue) == 7
  )
  days <- paste(c("Satur", "Sun", "Mon", "Tues", "Wednes", "Thurs", "Fri"), "day", sep = "")
  df <- tibble::tibble(days, wvalue) %>%
    dplyr::mutate(days = factor(days, levels = days))

  chart <- df %>%
    ggplot2::ggplot(ggplot2::aes(days, wvalue, fill = wvalue)) +
    ggplot2::geom_col(width = width) +
    ggplot2::scale_fill_gradient(high = high, low = low, name = lgnm) +
    ggplot2::coord_polar("x", start = 270) +
    ggplot2::theme(
      axis.ticks.x = ggplot2::element_blank(),
      axis.text.y = ggplot2::element_blank(),
      axis.ticks.y = ggplot2::element_blank(),
      axis.title = ggplot2::element_blank(),
      legend.position = "right"
    ) +
    ggplot2::geom_text(
      ggplot2::aes(label = wvalue),
      position = ggplot2::position_stack(vjust = 0.8),
      color = "black"
    )

  return(chart)
}

