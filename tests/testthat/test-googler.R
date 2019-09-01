test_that("googler works", {
  ## if python 3 not found then expect error
  #if (!googler:::py3_installed()) {
    #expect_error(googler("hello", count = 1))
  #} else {
    x <- googler("hello", count = 20)
    expect_true(is.data.frame(x))
    #expect_true(nrow(x) > 1)
    #expect_true(all(c("url", "abstract") %in% names(x)))
  #}
})
