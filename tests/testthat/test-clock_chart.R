# tests/testthat/test-clock_chart.R

test_that("clock_chart returns a ggplot object with correct structure", {
  # Create a minimal test dataset
  df <- data.frame(hm = c("00:00", "06:00", "12:00", "18:00"))

  # Run the function
  p <- clock_chart(data = df, time = hm, Col = "red")

  # Verify that the result is a ggplot object
  expect_s3_class(p, "ggplot")

  # Extract layer data from the built plot
  built <- ggplot2::ggplot_build(p)$data

  # 1. Locate the segment layer (geom_segment)
  seg_layer <- built[sapply(built, function(d) all(c("x", "y", "xend", "yend") %in% names(d)) )][[1]]
  expect_true(!is.null(seg_layer))
  expect_true(all(c("x", "y", "xend", "yend") %in% names(seg_layer)))

  # 2. The segment layer lines should all have the specified color
  # ggplot stores line color in `colour` or `colour` aesthetics; test that
  # every line in seg_layer is colored "red"
  # Note: color may be stored as an aesthetic, so read from p$layers
  seg_args <- p$layers[[which(sapply(p$layers, function(x) inherits(x$geom, "GeomSegment")))]][["aes_params"]]
  expect_equal(seg_args$colour, "red")

  # 3. Verify that the points (geom_point) correspond to the end (`x1`, `y1`)
  point_layer <- built[sapply(built, function(d) all(c("x", "y") %in% names(d)) && !"xend" %in% names(d) )][[1]]
  expect_true(all(c("x", "y") %in% names(point_layer)))
  expect_false(any(c("xend", "yend") %in% names(point_layer)))
})

test_that("clock_chart errors when data is not a data frame", {
  expect_error(
    clock_chart(data = 123, time = time),
    "`data` must be a data frame"
  )
})
