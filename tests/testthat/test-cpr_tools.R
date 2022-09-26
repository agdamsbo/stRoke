testthat::test_that("cpr_check() works for vectors, giving logicals", {
  result <- cpr_check(c("2310450637", "010115-4000", "0101896000","010189-3000","300450-1030","010150-4021"))
  testthat::expect_equal(any(result), TRUE)
  testthat::expect_type(result, "logical")
  testthat::expect_equal(result[2], FALSE)
})

################################################################################

testthat::test_that("cpr_dob() works for vectors, giving logicals", {
  result <- cpr_dob(c("2310450637", "010115-4000", "0101896000","010189-3000","300450-1030","010150-4021"))
  testthat::expect_type(result, "double")
  testthat::expect_s3_class(result, "Date")
  testthat::expect_length(result, 6)
})

################################################################################

testthat::test_that("cpr_female() works for vectors, giving logicals", {
  result <- cpr_female(c("2310450637", "010115-4000", "0101896000","010189-3000","300450-1030","010150-4021"))
  testthat::expect_type(result, "logical")
  testthat::expect_length(result, 6)
  testthat::expect_equal(result[2], TRUE)
})

################################################################################