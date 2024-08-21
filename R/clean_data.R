#' Remove second part from time value
#' This function removes second part from time value
#' @param data A data set
#' @param time a variable in the formar `HH:MM:SS`
#' @import stringr
NULL

#' @return Time in HH:MM format
#' @examples
#' df <- data.frame(time = c("06:00:00", "08:00:00", "17:30:00"))

#' @export
#'

remove_sec <- function(data, time){
  time <- dplyr::mutate(time = stringr::str_remove(time, ":00"))
}
