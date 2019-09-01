test_that("googler works", {
  path <- tryCatch(googler:::python_path(),
    error = function(e) "")
  if (!grepl("3.*python|python.*3", path, ignore.case = TRUE)) {
    expect_error(googler("hello", count = 1))
  } else {
    x <- googler("hello", count = 20)
    expect_true(is.data.frame(x))
    expect_true(nrow(x) > 1)
    expect_true(all(c("url", "abstract") %in% names(x)))
  }
})
