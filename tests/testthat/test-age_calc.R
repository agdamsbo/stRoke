test_that("age_calc works for vectors of length 1 (scalars)", {
  result<-age_calc(as.Date("1945-10-23"),as.Date("2018-09-30"))
  expect_equal(round(result), 73)
})
