#' Clyclic Chart
#'
#' This function plots values corresponding to random periods such as hours,
#'  days, months and so on.
#'
#' @param df A data frame
#' @param Period A list of periodical values such as hours of the day, days of
#' the week, months of the year and so on.
#' @param Value A numeric vector with the values corresponding to the `Period`
#' @param Crit A factor variable based on which the bars would be colored.
#' @param ColV A character vector with the list of colors for the bars.
#' You can use this online tool (\url{https://r-charts.com/color-palette-generator/})
#' to create a beautiful color palette.
#' @return A circular chart showing values in each month of the year.
#' @name cyclic_chart
NULL
#' @examples
#' dhktmp <- c(18.4, 22.1, 26.4, 28.6, 28.9, 29.1, 28.9, 29.0, 28.7, 27.5, 24.0, 19.9)
#' syltmp <- c(18.4, 20.8, 24.3, 26.0, 26.8, 27.6, 28.0, 28.2, 27.9, 26.7, 23.3, 19.7)
#' chttmp <- c(19.8, 22.5, 26.1, 28.2, 28.8, 28.6, 28.1, 28.2, 28.4, 27.8, 24.9, 21.2)
#' dftmp <- data.frame(Temperature = c(dhktmp, syltmp),
#'                     Month = factor(rep(month.name, 2), month.name),
#'                     City = rep(c("Dhaka", "Sylhet"), each = 12))
#' dftm3 <- data.frame(Temperature = c(dhktmp, syltmp, chttmp),
#'                     Month = factor(rep(month.name, 3), month.name),
#'                     City = rep(c("Dhaka", "Sylhet", "Chittagong"), each = 12))
#' Col <- c("#bfff00", "#ffff00", "#ffbf00")
#' cyclic_chart(dftm3, Period = Month, Value = Temperature,
#' Crit = City, ColV = Col)

#' @export
cyclic_chart <- function(df, Period, Value, Crit, ColV){
  x=c(seq(75, 0, -30), seq(345, 90, -30))
  p <- ggplot(df, aes({{Period}}, {{Value}}, color = {{Value}})) +
    geom_col(width = 1, aes(fill = {{Crit}}), position = position_dodge(width = 1)) +
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

