#' Day Planner
#'
#' This function plots works corresponding to each hour on a rose plot.
#'
#' @param swork A character vector having names of work at each of 24 hours (starts
#' from 6 am)
#' @return A circular chart showing work at each hour on a 24-hour clock
#' @name plan_day
NULL
#' @examples
#' work <- sample(c("Study", "Adda", "Entertainment", "Games", "Exercise", "Meal"),
#' size = 24, replace = TRUE)
#' plan_day(dwork = work, brdcol = NA)
#' @export
plan_day <- function(dwork, width = 1, brdcol = "grey"){
  ampm = c(rep(" AM",6), rep(" PM",12), rep(" AM",6))
  hour = c(6:12, 1:12, 1:5)
  hours <- paste0(c(6:12, 1:5), ampm)
  angle = c(seq(90,1,length.out = 7), seq(345,110, length.out=17))
  df <- tibble(hours, {{dwork}}, angle)
  df %>%  mutate(hours = factor(hours, levels = hours)) %>%
    ggplot(aes(x = hours, y = 1, fill = dwork))+
    geom_col(width = width, color = brdcol)+
    # Use color = NA for transparent color
    coord_polar("x", start = 270)+
    theme(axis.ticks.x=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank(),
          axis.title = element_blank(),
          legend.position = "none")+
    geom_text(label = dwork, position = position_stack(vjust = 0.5),
              color = "black", angle = angle)+
    scale_fill_brewer(palette = "Set2")
}
