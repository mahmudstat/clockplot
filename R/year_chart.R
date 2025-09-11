#' Plot Values on Each Month of a Year
#'
#' This function plots values corresponding to each month on a rose plot.
#'
#' @seealso
#'   [day_chart()] for plotting values on a day by hours
#'   [week_chart()] for plotting values in a week by days
#'   [cyclic_chart()] for plotting values by arbitrary period
#'
#' @param mvalue A numeric vector of length 12, with values for each month (Jan–Dec).
#'   If you have it in a data frame, extract it (e.g. `data$mvalue`).
#' @param lgnm Title of the legend (default `"Value"`).
#' @param high Color name for high values (default `"yellow"`).
#' @param low Color name for low values (default `"green"`).
#' @param width Width of bars.
#'
#' @returns A `ggplot` object, which can be further modified with `ggplot2` functions.
#'
#' @examples
#' syltmp <- c(18.4, 20.8, 24.3, 26.0, 26.8, 27.6, 28.0,
#'             28.2, 27.9, 26.7, 23.3, 19.7)
#' year_chart(mvalue = syltmp)
#' @export
year_chart <- function(mvalue, lgnm = "Value", width = 0.9,
                       high = "yellow", low = "green") {
  stopifnot("mvalue must be numeric" = is.numeric(mvalue),
            "mvalue must have length 12" = length(mvalue) == 12)

  Months <- factor(month.name, levels = month.name)

  df <- tibble::tibble(Months, mvalue)

  chart <- ggplot2::ggplot(df, ggplot2::aes(x = Months, y = mvalue, fill = mvalue)) +
    ggplot2::geom_col(width = width) +
    ggplot2::scale_fill_gradient(high = high, low = low, name = lgnm) +
    ggplot2::coord_polar("x", start = 270) +
    ggplot2::geom_text(
      ggplot2::aes(label = mvalue),
      position = ggplot2::position_stack(vjust = 0.8),
      color = "black", size = 3
    ) +
    ggplot2::theme(
      axis.ticks.x = ggplot2::element_blank(),
      axis.text.y = ggplot2::element_blank(),
      axis.ticks.y = ggplot2::element_blank(),
      axis.title = ggplot2::element_blank(),
      legend.position = "bottom"
    )

  return(chart)
}
