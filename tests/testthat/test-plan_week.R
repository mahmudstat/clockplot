# Test whether input is a character

test_that("A character vector", {
  wt <- LETTERS[1:7]
  plan_week(wt)
  expect_vector(wt, ptype = character())
})


