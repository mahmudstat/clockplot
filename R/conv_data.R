# Convert data for simplest clock chart
# This will be used to convert data for showing times on clock.
# Length of hands of clock is constant

conv_data <- function(data, time){
  # Data Preparation
  dt <- tidyr::separate_wider_delim(data, cols = {{time}},
                                    names = c("hour", "minute", "second"),
                                    cols_remove = FALSE,
                                    delim = ":") %>% # Separate minute
    dplyr::mutate(minute = as.numeric(ifelse(is.na(minute),0,minute)),
                  minute = ifelse(minute<10, minute * 5/30, minute * 5/300),
                  hour = as.numeric(hour),
                  timc = hour+minute,
                  time_angle = ifelse(0<=timc & timc<=6,
                                      (6-timc)*pi/12,
                                      (30-timc)*pi/12),
                  x1 = cos(time_angle)*0.97,
                  y1 = sin(time_angle)*0.97,
                  x0 = rep(0, dim(data)[1]),
                  y0 = rep(0, dim(data)[1]))
  return(dt)
}

#  Convert data for coloring based on criteria, without modifying length.

conv_data_col <- function(data, time, colby){
  # Data Preparation
  dt <- data %>%
    tidyr::separate_wider_delim(cols = {{time}},
                                names = c("hour", "minute", "second"),
                                cols_remove = FALSE,
                                delim = ":") %>% # Separate minute
    mutate(minute = as.numeric(ifelse(is.na(minute),0,minute)),
           minute = ifelse(minute<10, minute * 5/30, minute * 5/300),
           hour = as.numeric(hour),
           timc = hour+minute, # Ignore second
           time_angle = ifelse(0<=timc & timc<=6,
                               (6-timc)*pi/12,
                               (30-timc)*pi/12),
           x1 = cos(time_angle)*0.95,
           y1 = sin(time_angle)*0.95,
           x0 = rep(0, dim(data)[1]),
           y0 = rep(0, dim(data)[1]),
           colby = {{colby}})
  return(dt)
}


#
conv_data_len <- function(data, time, lngth){
  len <- dplyr::pull(data, {{len}})
  # Normalize length
  len <- (len-min(len))/(max(len)-min(len))
  len[which(len==0)] = (
    min(len)+min(len[len!=min(len)]))/2
  len[which(len==1)] = (
    max(len)+max(len[len!=max(len)]))/2

  # Data Preparation
  dt <- data %>%
    dplyr::mutate(len = len) %>%
    tidyr::separate_wider_delim(cols = {{time}},
                         names = c("hour", "minute"),
                         cols_remove = FALSE,
                         delim = ":") %>% # Separate minute
    dplyr::mutate(minute = as.numeric(ifelse(is.na(minute),0,minute)),
           minute = ifelse(minute<10, minute * 5/30, minute * 5/300),
           hour = as.numeric(hour),
           timc = hour+minute,
           time_angle = ifelse(0<=timc & timc<=6,
                               (6-timc)*pi/12,
                               (30-timc)*pi/12),
           x1 = cos(time_angle)*len,
           y1 = sin(time_angle)*len,
           x0 = rep(0, dim(data)[1]),
           y0 = rep(0, dim(data)[1]))
  return(dt)
}
