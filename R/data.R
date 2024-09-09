#' Data Containing Chat Times of Two Individuals
#'
#' A dataset containing timings of chat by two individuals Abid and Abir
#' The set contains 25 pushes by each individual
#'
#' @format A data frame with 25 rows and 2 variables:
#' \describe{
#' \item{name}{Name of the chat participant}
#' \item{time}{Time in HH:MM:SS format}
#' \item{turn}{Turn of the chat}
#' ...
#' }
#' @source {Randomly generated}
"chatdf"

#' Data of Times of Receiving of SMS
#'
#' A dataset containing timings of receiving sms on mobile phone.
#' Real data for a particular day

#' @format A data frame with 17 rows and 4 variables:
#' \describe{
#' \item{sender}{Name of the sms sender}
#' \item{time}{Time in HH:MM:SS format}
#' \item{invoked}{Whether the sms is invoked by the user}
#' \item{type}{The category of the sms; offer, info, ad, service etc.}
#' ...
#' }
#' @source {Phone Messages}
"smsclock"


#' Data of Average Monthly Temperature of Bangladesh Divisional Cities
#'
#' A dataset containing temperature of Dhaka, Sylhet, and Chittagong Cities.
#'
#' @format A data frame with 36 rows and 3 variables:
#' \describe{
#' \item{Temperature}{Average monthly temperature}
#' \item{Month}{Month of the year}
#' \item{City}{Name of the city}
#' ...
#' }
#' @source \url{https://www.weatherbase.com/weather/weather.php3?s=032914&refer=/}
"bdtemp"

#' Data of Earthquakes in and around Bangladesh
#'
#' A dataset containing earthquakes magnitude, dpeth, and location information.
#'
#' @format A data frame with 13 rows and 5 variables:
#' \describe{
#' \item{latitude}{Latitude}
#' \item{longitude}{Longitude}
#' \item{depth}{Depth}
#' \item{mag}{Magnitude}
#' \item{hms}{Time}
#' }
#' @source {USGS: https://earthquake.usgs.gov/earthquakes/search/}
"bdquake"
