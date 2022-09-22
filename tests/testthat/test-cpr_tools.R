test_that("cpr_check() works for vectors, giving logicals", {
  result <- cpr_check(c("2310450637", "010115-4000", "0101896000","010189-3000","300450-1030","010150-4021"))
  expect_equal(any(result), TRUE)
  expect_type(result, "logical")
  expect_equal(result[2], FALSE)
})

################################################################################

test_that("cpr_dob() works for vectors, giving logicals", {
  result <- cpr_dob(c("2310450637", "010115-4000", "0101896000","010189-3000","300450-1030","010150-4021"))
  expect_type(result, "double")
  expect_s3_class(result, "Date")
  expect_length(result, 6)
})

################################################################################