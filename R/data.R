#' Timings of chat by two individuals
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
#' @source \url{#}
"chatdf"



#' Timings of Receiving of SMS
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
