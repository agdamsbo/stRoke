test_that("quatile_cut() works for detail.list==FALSE", {
  result <- quantile_cut(iris$Sepal.Length,3,detail.list=FALSE)
  expect_equal(length(levels(result)), 3)
  expect_s3_class(result, "factor")
})

################################################################################

test_that("quatile_cut() works for detail.list==FALSE", {
  result <- quantile_cut(iris$Sepal.Length,3,detail.list=TRUE)
  expect_length(result, 2)
  expect_type(result, "list")
})

################################################################################