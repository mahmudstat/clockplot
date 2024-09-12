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

#' @format A data frame with 40 rows and 5 variables:
#' \describe{
#' \item{Date}{Date}
#' \item{time}{Time in HH:MM:SS format}
#' \item{sender}{Name of the sms sender}
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
#' @source \href{https://www.weatherbase.com/weather/weather.php3?s=032914&refer=/}{Weather Base}
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
#' @source \href{https://earthquake.usgs.gov/earthquakes/search/}{USGS}
"bdquake"


#' Data of Bangladesh Railway Express Train Schedule
#'
#' A dataset containing Bangladesh Railway Express Train schedule
#'
#' @format A data frame with 84 rows and 10 variables:
#' \describe{
#' \item{Sl}{Serial}
#' \item{Train_no}{Train No.}
#' \item{Name}{Train name}
#' \item{Type}{Type of train}
#' \item{Off_day}{The day of the week when the train does not run}
#' \item{Origin}{The station from where the train departs}
#' \item{Departure}{The time of departure}
#' \item{Destination}{The station where the train is heading}
#' \item{Arrival}{The time of arrival}
#' \item{Zone}{East/West}
#' }
#' @source \href{https://railway.portal.gov.bd/sites/default/files/files/railway.portal.gov.bd/page/e64d9448_0615_4316_87f0_deb10f5c847d/Intercity%20Trains%20.pdf}{Bangladesh Railway}
"brintcity"

#' Data of git commits in this repository
#'
#' A dataset containing commit information of all the commits in this
#' repository (`clockplot`) up to 12 Sep, 2024. Some columns, including the
#' commit message have been omitted.
#'
#' @format A data frame with 110 rows and 6 variables:
#' \describe{
#' \item{id}{Commit ID}
#' \item{weekday}{Week Day}
#' \item{month}{Month}
#' \item{day}{Day of the month}
#' \item{time}{Time--this is our desired column}
#' \item{year}{Year}
#' }
#' @source \href{clockplot repository}{Weather Base}
"gitcommit"
