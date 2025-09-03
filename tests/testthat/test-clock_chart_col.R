test_that("clock_chart_col returns a ggplot object", {
  # Create a simple dummy data frame for testing.
  dummy_data <- data.frame(
    time = c("09:00", "12:30", "18:45"),
    value = c(10, 20, 30)
  )

  # Call the function with the dummy data.
  plot_output <- clock_chart_col(dummy_data, time, value)

  # Check if the returned object is a ggplot object.
  expect_s3_class(plot_output, "ggplot")
})
