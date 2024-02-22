test_that("multiplication works", {
  set.seed(99)
  expect_identical(prop2_sim(0.9, 10), c(9L, 1L))
  set.seed(99)
  expect_identical(prop2_sim(0.9, 10), c(9L, 1L))
  expect_identical(prop2_sim(0.9, 10), c(10L, 0L))
  set.seed(99)
  expect_identical(prop2_sim(0.1, 10), c(1L, 9L))
  set.seed(99)
  expect_identical(prop2_sim(0.1, 10), c(1L, 9L))
  expect_identical(prop2_sim(0.1, 10), c(0L, 10L))
})

test_that("multiplication with less", {
  set.seed(99)
  expect_identical(prop2_sim(0.09, p2 = 0.001, n = 1000), c(79L, 1L))
  set.seed(99)
  expect_identical(prop2_sim(0.09, p2 = 0.001, n = 1000), c(79L, 1L))
  expect_identical(prop2_sim(0.09, p2 = 0.001, n = 1000), c(108L, 0L))
  expect_identical(prop2_sim(0.09, p2 = 0.001, n = 1000), c(98L, 1L))
})

