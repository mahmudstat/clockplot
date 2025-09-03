# Create simple test data
df <- tibble::tibble(
  time = c("00:00:00", "06:00:00", "12:00:00", "18:00:00"),
  len = c(1, 2, 3, 4),
  Col = c(10, 20, 30, 40)
)

test_that("clock_chart_qnt returns ggplot object", {
  p <- clock_chart_qnt(data = df, time = time, len = len, Col = Col)
  expect_s3_class(p, "ggplot")
})

test_that("clock_chart_qnt uses correct data transformation", {
  p <- clock_chart_qnt(df, time = time, len = len, Col = Col)

  built <- ggplot2::ggplot_build(p)$data

  # Locate geom_segment() layer
  seg_layer <- built[sapply(built, function(d) {
    all(c("x", "y", "xend", "yend") %in% names(d))
  })][[1]]

  expect_true(!is.null(seg_layer))
  expect_true(all(c("x", "y", "xend", "yend") %in% names(seg_layer)))
})

test_that("clock_chart_qnt honors color gradient extremes", {
  p <- clock_chart_qnt(
    data = df, time = time, len = len, Col = Col,
    high = "blue", low = "yellow"
  )

  scale <- Filter(
    function(s) inherits(s, "ScaleContinuous") || inherits(s, "ScaleGradient"),
    p$scales$scales
  )[[1]]

  colors <- scale$palette(seq(0, 1, length.out = 3))

  # Convert both to hex (uppercase, no alpha)
  actual_low <- toupper(colors[1])
  actual_high <- toupper(colors[3])

  expected_low <- toupper(grDevices::rgb(t(grDevices::col2rgb("yellow")), maxColorValue = 255))
  expected_high <- toupper(grDevices::rgb(t(grDevices::col2rgb("blue")), maxColorValue = 255))

  expect_equal(actual_low, expected_low)
  expect_equal(actual_high, expected_high)
})

test_that("clock_chart_qnt errors with non-data frame input", {
  expect_error(
    clock_chart_qnt(data = 123, time = time, len = len, Col = Col),
    "data frame"
  )
})
