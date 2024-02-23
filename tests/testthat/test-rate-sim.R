test_that("rate_sim works", {
  expect_output({
    rate_sim(numeric(0), integer(0))
  })
  set.seed(99)
  expect_output({
    rate_sim(0.9, 10)
    rate_sim(0.9, 10)
  })
  set.seed(100)
  expect_output({
    rate_sim(c(0.9, 1), 10)
    rate_sim(c(0.9, 1), c(100, 1))
  })
})
