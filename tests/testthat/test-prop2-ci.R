test_that("multiplication works", {
  expect_snapshot({
    prop2_ci(6, 0)
    prop2_ci(3, 3)
    prop2_ci(0, 6)
    prop2_ci(106, 100)
    prop2_ci(100, 106)
  })
})
