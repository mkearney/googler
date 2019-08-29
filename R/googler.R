#' googler
#'
#' Google from the R console
#'
#' @param start Start at the Nth result.
#' @param count Show N results–defaults to 10
#' @param news Show results from news section.
#' @param tld Country-specific search with top-level domain TLD, e.g., 'in' for India.
#' @param lang Search for the language, e.g., 'fi' for Finnish.
#' @param exact Disable automatic spelling correction. Search exact keywords.
#' @param time Time limit search, e.g., 'h5' (5 hrs), 'd5' (5 days), 'w5' (5 weeks), 'm5' (5 months), 'y5' (5 years)
#' @param site Search a site using Google.
#' @param unfilter Do not omit similar results.
#' @examples
#' \dontrun{
#' ## search google within past month
#' googler("rstats", time = "m1")
#'
#' ## search google news
#' googler("rstats", news = TRUE)
#' }
#' @export
googler <- function(query = "#rstats",
                    start = NULL,
                    count = NULL,
                    news = NULL,
                    tld = NULL,
                    lang = NULL,
                    exact = NULL,
                    time = NULL,
                    site = NULL,
                    unfilter = NULL) {
  ## check if installed
  errcode <- system2("which", "googler", stdout = FALSE, stderr = FALSE)

  if (errcode > 0) {
    warning(paste0("The 'googler' command line tool does not appear to be ",
      "installed. Please install using instructions found at ",
      "https://github.com/jarun/googler#installation"))
    cmd <- Sys.which("python3")
    if (identical(cmd, "")) {
      stop("'googler' requires python3, which can't be found.")
    }
    download.file(
      "https://raw.githubusercontent.com/jarun/googler/v3.9/googler",
      tmp <- tempfile()
    )
    query <- c(tmp, query)
  } else {
    cmd <- "googler"
  }

  ## compile args
  args <- c(
    query,
    start %|||% paste0("--start=", start),
    count %|||% paste0("--count=", count),
    news %|||% paste0("--news"),
    tld %|||% paste0("--tld=", tld),
    lang %|||% paste0("--lang=", lang),
    exact %|||% paste0("--exact"),
    time %|||% paste0("--time=", time),
    site %|||% paste0("--site=", site),
    unfilter %|||% paste0("--unfilter"),
    "-C", "--json"
  )

  out <- system2(cmd, args = args, stdout = TRUE)
  tibble::as_tibble(jsonlite::fromJSON(out))
}

`%|||%` <- function(a, b) {
  if (!is.null(a))
    b
  else a
}
