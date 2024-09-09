#' Clyclic Chart
#'
#' This function plots values corresponding to random periods such as hours,
#'  days, months and so on.
#'
#' This can plot values corresponding to multiple categories, for example,
#' temperature in different cities on the days of a week, or rainfall by month
#' in a year.
#'
#' @seealso
#'  [day_chart()] for plotting values on a day by hours
#'  [week_chart()] for plotting values in a week by days
#'  [year_chart()] for plotting values in a year by months
#'
#' @param df A data frame
#' @param Period A list of periodical values such as hours of the day, days of
#' the week, months of the year and so on.
#' @param Value A numeric vector with the values corresponding to the `Period`
#' @param crit A factor variable based on which the bars would be colored.
#' @param ColV A character vector with the list of colors for the bars.
#' You can use this online tool (\url{https://r-charts.com/color-palette-generator/})
#' to create a beautiful color palette.
#' @return A circular chart showing values in each month of the year.
#' @name cyclic_chart
NULL
#' @examples
#' # Using package built-in bdtemp data
#' Col <- c("#0040ff", "#00bfff", "#8000ff")
#' cyclic_chart(bdtemp, Period = Month, Value = Temperature,
#' crit = City, ColV = Col)

#' @export
cyclic_chart <- function(df, Period, Value, crit, ColV){
  x=c(seq(75, 0, -30), seq(345, 90, -30))
  p <- ggplot(df, aes({{Period}}, {{Value}}, color = {{Value}})) +
    geom_col(width = 1, aes(fill = {{crit}}), position = position_dodge(width = 1))+
    #ggplot2::geom_text(data = df, label = Value,
    #                 position = position_stack(vjust = 0.8), color = "black")+
    geom_vline(xintercept = 1:13 - 0.5, color = "gray") +
    geom_hline(yintercept = 0:3 * 10, color = "gray") +
    scale_fill_manual(values = {{ColV}}) +
    theme_bw() +
    theme(panel.border = element_blank(),
          axis.title.x = element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank(),
          axis.title = element_blank(),
          panel.grid.major = element_blank())+
    coord_polar()
  return(p)
}

