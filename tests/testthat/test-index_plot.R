test_that("index_plot() works!", {
  testthat::expect_type(index_plot(stRoke::score[score$event=="A",]), "list")
  testthat::expect_true(inherits(
    index_plot(stRoke::score[score$event=="A",]), "ggplot"))
  testthat::expect_type(index_plot(stRoke::score[score$event=="A",],
                                   sub_plot = "_per"), "list")
  
  testthat::expect_true(inherits(
    index_plot(stRoke::score[score$event=="A",],sub_plot = "_per"), "ggplot"))
  testthat::expect_error(index_plot(stRoke::score[score$event=="A",],
                                    sub_plot = "_per",
                                    facet.by = c("id","event")))
  
  testthat::expect_type(index_plot(stRoke::score,
                                   sub_plot = "_per",
                                   facet.by = "event"), "list")
  testthat::expect_true(inherits(
    index_plot(stRoke::score[score$event=="A",],
               sub_plot = "_per",
               facet.by = "event"), "ggplot"))
})
