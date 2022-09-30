test_that("generic_stroke() runs!", {
  iris$ord<-factor(sample(1:3,size=nrow(iris),replace=TRUE),ordered=TRUE) 
  result <- generic_stroke(df=iris, group = "Species", score = "ord", variables = colnames(iris)[1:3])
  expect_equal(length(result), 3)
})
