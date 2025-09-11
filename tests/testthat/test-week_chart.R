test_that("week_chart validates input length", {
  # Test that it errors with wrong length input
  expect_error(week_chart(1:6), "must have exactly 7 elements")
  expect_error(week_chart(1:8), "must have exactly 7 elements")

  # Test that it works with correct length
  expect_no_error(week_chart(1:7))
})

test_that("week_chart validates input type", {
  # Test that it errors with non-numeric input
  expect_error(week_chart(letters[1:7]), "must be numeric")

  # Test that it works with numeric input
  expect_no_error(week_chart(1:7))
  expect_no_error(week_chart(as.numeric(1:7)))
})

test_that("week_chart creates correct plot structure", {
  wv <- c(10, 20, 15, 25, 30, 5, 12)
  p <- week_chart(wv)

  # Test that it's a ggplot
  expect_s3_class(p, "ggplot")

  # Test that the data is correct
  expect_equal(nrow(p$data), 7)
  expect_equal(p$data$wvalue, wv)
  expect_equal(levels(p$data$days),
               c("Saturday", "Sunday", "Monday", "Tuesday",
                 "Wednesday", "Thursday", "Friday"))

  # Test that it has the expected geoms (more robust than checking internal structure)
  layer_types <- sapply(p$layers, function(x) class(x$geom)[1])
  expect_true("GeomCol" %in% layer_types)
  expect_true("GeomText" %in% layer_types)
})

test_that("week_chart handles edge cases", {
  # Test with all same values
  expect_no_error(week_chart(rep(5, 7)))

  # Test with zeros
  expect_no_error(week_chart(rep(0, 7)))

  # Test with negative values
  expect_no_error(week_chart(-5:1))
})

test_that("week_chart parameters work", {
  wv <- 1:7

  # Test custom legend name
  p1 <- week_chart(wv, lgnm = "Temperature")
  expect_s3_class(p1, "ggplot")

  # Test custom colors
  p2 <- week_chart(wv, high = "blue", low = "red")
  expect_s3_class(p2, "ggplot")

  # Test custom width
  p3 <- week_chart(wv, width = 0.5)
  expect_s3_class(p3, "ggplot")
})
