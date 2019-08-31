test_that("googler works", {
  path <- Sys.which(paste0("python",
    c("", "3", "3.6", "3.7", "3.8", "3.9", "4", "3.4", "3.5")))
  if (!any(grepl("python3", path))) {
    expect_error(googler("hello"))
  } else {
    x <- googler("hello")
    expect_true(is.data.frame(x))
    expect_true(nrow(x) > 1)
    expect_true(all(c("url", "abstract") %in% names(x)))
  }
})
