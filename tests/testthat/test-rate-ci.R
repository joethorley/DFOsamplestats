test_that("rate_ci works", {
  expect_snapshot_output({
    rate_ci(r = integer(0), n = integer(0))
    rate_ci(r = 5, n = 10)
    rate_ci(r = c(3,7), n = 20)
    rate_ci(r = c(3,7), n = c(20,20))
  })
})
