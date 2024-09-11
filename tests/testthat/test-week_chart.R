# Test length of given data
# Using expect_length()

test_that("Length of vector is 7", {
  wv <- sample(10,7)
  week_chart(wv)
  expect_length(wv, 7)
})

test_that("A numeric vector", {
  wt <- sample(10,7)+runif(7)
  week_chart(wt)
  expect_vector(wt, ptype = numeric())
})

