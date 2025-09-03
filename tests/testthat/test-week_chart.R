# Test length of given data
# Using expect_length()

test_that("Length of vector is 7", {
  wv <- sample(10, 7) # Create a vector of length 7
  week_chart(wv) # Assuming this function processes the vector
  expect_length(wv, 7) # Check that the vector itself has length 7
})

test_that("A numeric vector", {
  wt <- sample(10, 7) + runif(7)
  week_chart(wt)
  expect_vector(wt, ptype = numeric())
})

test_that("week_chart returns ggplot object for numeric vector of length 7", {
  wv <- sample(10, 7)

  # Check that it runs without throwing an error
  expect_no_error({
    p <- week_chart(wv)
  })

  # Check that the returned object is indeed a ggplot
  expect_s3_class(p, "ggplot")

  # Check that the data has expected columns
  expect_true(all(c("days", "wvalue") %in% names(p$data)))

  # Check that there are exactly 7 rows (one per day)
  expect_equal(nrow(p$data), 7)
})
