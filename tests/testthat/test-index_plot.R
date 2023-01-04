test_that("multiplication works", {
  testthat::expect_type(index_plot(stRoke::score[score$event=="A",]), "list")
})
