test_that("rate_ci works", {
  expect_snapshot_output({
    rate_pvalue(r = integer(0), n = integer(0))
    rate_pvalue(5, 10)
    rate_pvalue(c(1,9), c(10,10))
    rate_pvalue(c(1,9), 20)
    rate_pvalue(c(1,9), 40)
    rate_pvalue(9, 10)
})
