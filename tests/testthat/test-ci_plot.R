# Unit Test - gpttools

test_that("ci_plot produces a valid plot", {
  data(talos)
  talos[,"mrs_1"]<-factor(talos[,"mrs_1"],ordered=TRUE)
  talos$bin <- factor(sample(1:2, size = nrow(talos), replace = TRUE))
  testthat::expect_true(inherits(ci_plot(ds = talos, x = "rtreat", y = "mrs_1", vars = c("hypertension","diabetes")), "ggplot"))
})
