library(testthat)
library(ggplot2)

test_that("clock_chart_len returns a ggplot object", {
  # Create a simple dummy data frame for testing.
  dummy_data <- data.frame(
    time = c("09:00", "12:30", "18:45"),
    len_var = c(1, 2, 3) # A numeric variable for length
  )

  # Call the function.
  # Assuming the function takes 'data', 'time', and a length variable.
  plot_output <- clock_chart_len(dummy_data, time, len_var)

  # Check if the returned object is a ggplot object.
  expect_s3_class(plot_output, "ggplot")
})
