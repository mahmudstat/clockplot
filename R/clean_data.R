#' Convert `HH:MM` to `HH:MM:SS`
#'
#' This function converts `HH:MM` to `HH:MM:SS`. `19:30`, for example, is
#' turned into `19:30:00`. This prepares the times for plotting, in case you
#' do not have it in `HH:MM:SS` format.
#'
#' The converted `HH:MM:SS` actually gives `HH:MM:00` format, the second part
#' made `00`, since in practice it has negligible effect on the plot.
#'
#' # @param df A data set
#' # @param time a `time` or `character` variable in the format `HH:MM`
#' # @param new New name of the variable
#' # @name conv_hms

#' # @return Time in HH:MM format
#' # @examples
#' # df <- data.frame(time = c("06:00", "08:00", "17:30"))
#' # df = conv_hms(df, time, New)
#' # df


# conv_hms <- function(df, time, new){
 # df <- mutate(df, new = hms::parse_hm({{time}}))
 # .Deprecated("hms::parse_hm")
# }

# Old function. Will be deprecated
#rm_sec <- function(df, time) {
 # df <- mutate(df, time = gsub('.{3}$', '', {{time}}))
# }


