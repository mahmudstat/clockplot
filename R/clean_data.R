#' Convert `HH:MM` to `HH:MM:SS`
#'
#' This function converts `HH:MM` to `HH:MM:SS`. `19:30`, for example, is
#' turned into `19:30:00`. This prepares the times for plotting
#' @param df A data set
#' @param time a `time` or `character` variable in the format `HH:MM:SS`
#' @name conv_hms

#' @return Time in HH:MM format
#' @examples
#' df <- data.frame(time = c("06:00", "08:00", "17:30"))
#' conv_hms(df, time)

#' @export
conv_hms <- function(df, time){
  df <- mutate(df, time = hms::parse_hm({{time}}))
}

# Old function. Will be deprecated
rm_sec <- function(df, time) {
  df <- mutate(df, time = gsub('.{3}$', '', {{time}}))
}


