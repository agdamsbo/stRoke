test_that("age_calc works for vectors of length 1 (scalars)", {
  result<-age_calc(as.Date("1945-10-23"),as.Date("2018-09-30"))
  expect_equal(round(result), 73)
})

################################################################################

# Unit Test - gpttools

test_that("age_calc works correctly for years", {
  expect_equal(age_calc(as.Date("2000-01-01"), as.Date("2020-01-01"), units = "years"), 20)
})

test_that("age_calc works correctly for months", {
  expect_equal(age_calc(as.Date("2000-01-01"), as.Date("2020-01-01"), units = "months"), 240)
})

test_that("age_calc works correctly for days", {
  testthat::expect_equal(age_calc(as.Date("2000-01-01"), as.Date("2020-01-01"), units = "days"), 7305)
  testthat::expect_length(age_calc(as.Date("2000-01-01"), as.Date("2020-01-01"), units = "days"), 1)
})

test_that("age_calc works correctly with leap years and precise set to TRUE", {
  expect_equal(age_calc(as.Date("2000-02-29"), as.Date("2020-02-29"), units = "years", precise = TRUE), 20)
})

test_that("age_calc throws an error when enddate is before dob", {
  expect_error(age_calc(as.Date("2020-01-01"), as.Date("2000-01-01"), units = "years"))
})
