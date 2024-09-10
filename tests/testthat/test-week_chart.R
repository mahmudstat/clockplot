# Test length of given data
# Using expect_length()

test_that("Length of vector is 7", {
  wt <- sample(10,7)
  week_chart(wt)
  expect_length(wt, 7)
})


