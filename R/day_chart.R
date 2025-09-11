#' Plot Values on a 24-Hour Day, on Specific Hours
#'
#' This function plots values corresponding to each hour on a rose plot.
#'
#' The color names can be vice versa or other colors, depending on the context.
#'
#' @seealso
#'   [week_chart()] for plotting values in a week by days
#'   [year_chart()] for plotting values on in a year by months
#'   [cyclic_chart()] for plotting values by arbitrary period
#'
#' @param hvalue A numeric vector having values at each of 24 hours (starts
#' from 6 am)
#' @param high The color name for the high values. The default is `red`
#' @param low The color name for the low values. The default is `green`.
#' @param width Width of bars
#' @returns A `ggplot` object, which can be further modified
#' with `ggplot2` functions and themes.
#' @examples
#' value <- sample(15:30, 24, replace = TRUE)
#' day_chart(hvalue = value, high = "blue", low = "yellow", width = 0.8)
#' @export
day_chart <- function(hvalue, high = "blue", low = "yellow", width = 0.8) {
  stopifnot("hvalue must be numeric" = is.numeric(hvalue))
  if (length(hvalue) != 24) {
    stop("hvalue must have length 24 (one per hour), but has length ", length(hvalue))
  }
  # Create labels for 24 hours (6 AM to 5 AM next day)
  hours <- c(paste0(6:11, " AM"), "12 PM",
             paste0(1:11, " PM"), "12 AM",
             paste0(1:5, " AM"))

  df <- tibble::tibble(hours, hvalue) %>%
    dplyr::mutate(hours = factor(hours, levels = hours))

  chart <- df %>%
    ggplot2::ggplot(ggplot2::aes(x = .data$hours, y = .data$hvalue, fill = .data$hvalue)) +
    ggplot2::geom_col(width = width, color = "white") +
    ggplot2::coord_polar("x", start = 270) +
    ggplot2::scale_fill_gradient(low = low, high = high, name = "Value") +
    ggplot2::geom_text(
      ggplot2::aes(label = .data$hvalue),
      position = ggplot2::position_stack(vjust = 1.02),
      color = "black", size = 3
    ) +
    ggplot2::theme(
      axis.ticks.x = ggplot2::element_blank(),
      axis.text.y = ggplot2::element_blank(),
      axis.ticks.y = ggplot2::element_blank(),
      axis.title = ggplot2::element_blank(),
      legend.position = "right"
    )

  return(chart)
}
