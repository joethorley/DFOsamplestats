test_that("rate2_power_analysis_analysis_bayesian works", {
  set.seed(99)
  expect_equal(rate2_power_analysis_bayesian(0.9, 1, nsims = 100), 0)
  set.seed(99)
  expect_equal(rate2_power_analysis_bayesian(0.005, p2 = 0.0075, 15599 * 2, nsim = 100), 0.77)
})
