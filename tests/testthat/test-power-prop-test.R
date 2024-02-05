test_that("power_prop_test edge cases", {
  expect_error(power_prop_test(numeric(0), numeric(0)), "`p1` must be a scalar \\(length 1\\)\\.")
  expect_error(power_prop_test(c(0.3,0.4), c(0.7,0.9)), "`p1` must be a scalar \\(length 1\\)\\.")
  expect_error(power_prop_test(1.1, 0.1), "`p1` must be between 0 and 1, not 1.1.")
  expect_error(power_prop_test(0.6, 0.9), "The sum of `p1` and `p2` must be less than or equal to 1, not 1.5.")
  expect_identical(power_prop_test(NA_real_, 0.9), NA_integer_)
  expect_identical(power_prop_test(0.1, NA_real_), NA_integer_)
})

test_that("power_prop_test works", {
  expect_identical(power_prop_test(0, 1), 2L)
  expect_identical(power_prop_test(0.9, 0.1), 4L)
  expect_identical(power_prop_test(0.1, 0.9), 4L)
  expect_identical(power_prop_test(0.01, 0.09), 91L)
  expect_identical(power_prop_test(0.45, 0.55), 309L)
  expect_identical(power_prop_test(0.005, 0.0075), 12287L)
})
