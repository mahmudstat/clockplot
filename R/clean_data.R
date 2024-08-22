#' Remove second part from time value
#'
#' This function removes second part from time value
#' @param df A data set
#' @param time a variable in the format `HH:MM:SS`
#' @name conv_hms

#' @return Time in HH:MM format
#' @examples
#' df <- data.frame(time = c("06:00", "08:00", "17:30"))
#' conv_hms(df, time)

#' @export
conv_hms <- function(df, time){
  df <- mutate(df, time = hms::parse_hm({{time}}))
}

# Old function. Being deprecated
rm_sec <- function(df, time) {
  df <- mutate(df, time = gsub('.{3}$', '', {{time}}))
}


