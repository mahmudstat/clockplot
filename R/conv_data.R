# Convert data for simplest clock chart
# This will be used to convert data for showing times on clock.
# Length of hands of clock is constant

conv_data <- function(data, time){
  # Data Preparation
  dt <- tidyr::separate_wider_delim(data, cols = {{time}},
                                    names = c("hour", "minute", "second"),
                                    cols_remove = FALSE,
                                    delim = ":") %>% # Separate minute
    dplyr::mutate(minute = as.numeric(ifelse(is.na(.data$minute),0,.data$minute)),
                  minute = ifelse(.data$minute<10, .data$minute * 5/30, .data$minute * 5/300),
                  hour = as.numeric(.data$hour),
                  timc = .data$hour+.data$minute,
                  time_angle = ifelse(0<=.data$timc & .data$timc<=6,
                                      (6-.data$timc)*pi/12,
                                      (30-.data$timc)*pi/12),
                  x1 = cos(.data$time_angle)*0.97,
                  y1 = sin(.data$time_angle)*0.97,
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
    mutate(minute = as.numeric(ifelse(is.na(.data$minute),0,.data$minute)),
           minute = ifelse(.data$minute<10, .data$minute * 5/30, .data$minute * 5/300),
           hour = as.numeric(.data$hour),
           timc = .data$hour+.data$minute, # Ignore second
           time_angle = ifelse(0<=.data$timc & .data$timc<=6,
                               (6-.data$timc)*pi/12,
                               (30-.data$timc)*pi/12),
           x1 = cos(.data$time_angle)*0.95,
           y1 = sin(.data$time_angle)*0.95,
           x0 = rep(0, dim(data)[1]),
           y0 = rep(0, dim(data)[1]),
           colby = {{colby}})
  return(dt)
}


# Change length of hands by a quantitative vector, optionally select a
# color for the hands
conv_data_len <- function(data, time, len){
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
                         names = c("hour", "minute", "second"),
                         cols_remove = FALSE,
                         delim = ":") %>% # Separate minute
    dplyr::mutate(minute = as.numeric(ifelse(is.na(.data$minute),0,.data$minute)),
           minute = ifelse(.data$minute<10, .data$minute * 5/30, .data$minute * 5/300),
           hour = as.numeric(.data$hour),
           timc = .data$hour+.data$minute,
           time_angle = ifelse(0<=.data$timc & .data$timc<=6,
                               (6-.data$timc)*pi/12,
                               (30-.data$timc)*pi/12),
           x1 = cos(.data$time_angle)*len,
           y1 = sin(.data$time_angle)*len,
           x0 = rep(0, dim(data)[1]),
           y0 = rep(0, dim(data)[1]))
  return(dt)
}


# Keep factor original order

keep_fct_order <- function(x) factor(x, levels = unique(x))
