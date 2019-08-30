test_that("googler works", {


  if (Sys.which("python3") == "") {
    expect_error(googler("hello"))
  } else {
    x <- googler("hello")
    expect_true(is.data.frame(x))
    expect_true(nrow(x) > 1)
    expect_true(all(c("url", "abstract") %in% names(x)))
  }
})
