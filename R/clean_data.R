#' Remove second part from time value
#'
#' This function removes second part from time value
#' @param df A data set
#' @param time a variable in the format `HH:MM:SS`
#' @name rm_sec


#' @return Time in HH:MM format
#' @examples
#' df <- data.frame(time = c("06:00:00", "08:00:00", "17:30:00"))
#' rm_sec(df, time)

#' @export
rm_sec <- function(df, time) gsub('.{3}$', '', df$time)

