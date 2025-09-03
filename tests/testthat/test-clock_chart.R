# tests/testthat/test-clock_chart.R

test_that("clock_chart returns a ggplot object", {
  # Create a simple dummy data frame for testing.
  dummy_data <- data.frame(
    time = c("09:00", "12:30", "18:45")
  )

  # Call the function with the dummy data.
  plot_output <- clock_chart(dummy_data, time)

  # Check if the returned object is a ggplot object.
  expect_s3_class(plot_output, "ggplot")
})

test_that("clock_chart throws an error for non-data.frame input", {
  # Pass a vector instead of a data frame.
  invalid_input <- c("09:00", "12:30")

  # Check that the function throws the expected error message.
  expect_error(clock_chart(invalid_input, time),
    regexp = "`data` must be a data frame"
  )
})

library(testthat)
library(ggplot2)

test_that("clock_chart returns a ggplot object", {
  dummy_data <- data.frame(time = c("09:00", "12:30", "18:45"))
  plot_output <- clock_chart(dummy_data, time)
  expect_s3_class(plot_output, "ggplot")
})

test_that("clock_chart throws an error for non-data.frame input", {
  invalid_input <- c("09:00", "12:30")
  expect_error(clock_chart(invalid_input, time),
    regexp = "`data` must be a data frame"
  )
})
