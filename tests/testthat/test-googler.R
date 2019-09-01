test_that("googler works", {
  path <- googler:::python_path()
  if (!grepl("python.{0,}3", path, ignore.case = TRUE)) {
    expect_error(googler("hello", count = 1))
  } else {
    x <- googler("hello", count = 20)
    expect_true(is.data.frame(x))
    expect_true(nrow(x) > 1)
    expect_true(all(c("url", "abstract") %in% names(x)))
  }
})
