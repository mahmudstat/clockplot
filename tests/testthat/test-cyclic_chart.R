# --- Dummy Data for Testing ---
dummy_data <- data.frame(
  Month = factor(c("January", "February", "March", "January", "February", "March"),
    levels = month.name
  ), # Ensures consistent ordering for Period
  Temperature = c(10, 15, 20, 12, 18, 22),
  City = factor(c("Dhaka", "Dhaka", "Dhaka", "Chittagong", "Chittagong", "Chittagong"),
    levels = c("Dhaka", "Chittagong")
  ), # Ensures consistent ordering for crit
  stringsAsFactors = FALSE
)

# --- Dummy Color Vector (matched to number of cities for direct mapping) ---
dummy_col_v_matched <- c("#0040ff", "#00bfff") # First color for "Dhaka", second for "Chittagong"

test_that("cyclic_chart returns a ggplot object", {
  plot_output <- cyclic_chart(dummy_data,
    Period = Month, Value = Temperature,
    crit = City, ColV = dummy_col_v_matched
  )
  expect_s3_class(plot_output, "ggplot")
})
