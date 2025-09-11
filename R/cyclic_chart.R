#' Plot Cyclic Data (General Format)
#'
#' This function plots values corresponding to random periods such as hours,
#'  days, months and so on.
#'
#' This can plot values corresponding to multiple categories, for example,
#' temperature in different cities on the days of a week, or rainfall by month
#' in a year.
#'
#' @seealso
#'   [day_chart()] for plotting values on a day by hours,
#'   [week_chart()] for plotting values in a week by days,
#'   [year_chart()] for plotting values in a year by months
#'
#' @param df A data frame
#' @param Period A list of periodical values such as hours of the day, days of
#' the week, months of the year and so on.
#' @param Value A numeric vector with the values corresponding to the `Period`
#' @param crit A factor variable based on which the bars would be colored.
#' @param ColV A character vector with the list of colors for the bars.
#' You can use this online tool (\url{https://r-charts.com/color-palette-generator/})
#' to create a beautiful color palette.
#' @returns A `ggplot` object, which can be further modified
#' with `ggplot2` functions and themes.
#' @examples
#' # Using package built-in bdtemp data
#' Col <- c("#0040ff", "#00bfff", "#8000ff")
#' cyclic_chart(bdtemp,
#'   Period = Month, Value = Temperature,
#'   crit = City, ColV = Col
#' )

#' @export
cyclic_chart <- function(df, Period, Value, crit, ColV) {
  p <- ggplot2::ggplot(df, ggplot2::aes({{ Period }}, {{ Value }})) +
    ggplot2::geom_col(
      width = 1,
      ggplot2::aes(
        fill = {{ crit }},    # Interior color
        color = {{ Value }}   # Border color
      ),
      position = ggplot2::position_dodge(width = 1)
    ) +
    ggplot2::geom_vline(xintercept = 1:13 - 0.5, color = "gray") +
    ggplot2::geom_hline(yintercept = 0:3 * 10, color = "gray") +
    ggplot2::scale_fill_manual(values = ColV) +   # For fill aesthetic (categorical)
    ggplot2::scale_color_gradient() +             # For color aesthetic (continuous)
    ggplot2::theme_bw() +
    ggplot2::theme(
      panel.border = ggplot2::element_blank(),
      axis.title.x = ggplot2::element_blank(),
      axis.text.y = ggplot2::element_blank(),
      axis.ticks.y = ggplot2::element_blank(),
      axis.title = ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_blank()
    ) +
    ggplot2::coord_polar()

  return(p)
}
