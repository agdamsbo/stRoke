test_that("gt_plot() produces a valid ggplot object", {
  require(webshot2)
  x <- gt_plot(gtsummary::tbl_summary(mtcars))
  expect_type(x, "list")
  expect_true(inherits(x, c("gg", "ggplot")))
})

test_that("gt_plot() throws error if input is incorrect", {
  expect_error(gt_plot(mtcars))
})
