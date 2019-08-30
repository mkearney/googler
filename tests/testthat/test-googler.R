test_that("googler works", {
  x <- googler("hello")
  expect_true(is.data.frame(x))
  expect_true(nrow(x) > 1)
  expect_true(all(c("url", "abstract") %in% names(x)))
})
