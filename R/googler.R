#' googler
#'
#' googler(): Search Google from the R console
#'
#' @param query Search query.
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
#' googler_news("rstats")
#' }
#' @export
googler <- function(query = "",
                    start = NULL,
                    count = NULL,
                    news = NULL,
                    tld = NULL,
                    lang = NULL,
                    exact = NULL,
                    time = NULL,
                    site = NULL,
                    unfilter = NULL) {
  ## parse JSON and return as a tibble
  tibble::as_tibble(jsonlite::fromJSON(
    do.call("googler_", as.list(environment()))
  ))
}

#' googler_
#'
#' googler_(): Internal version of googler that returns stdout
#'
#' @inheritParams googler
#' @keywords internal
googler_ <- function(query,
                     start = NULL,
                     count = NULL,
                     news = NULL,
                     tld = NULL,
                     lang = NULL,
                     exact = NULL,
                     time = NULL,
                     site = NULL,
                     unfilter = NULL) {

  ## path to python3
  cmd <- python_path()

  ## path to googler
  args <- googler_path()

  ## issue automation warning if count > 100
  check_count(count > 100)

  ## compile args
  args <- c(args,
    shQuote(query    %||%  paste0("")),
    start    %|||% paste0("--start=", start),
    count    %|||% paste0("--count=", count),
    news     %|||% paste0("--news"),
    tld      %|||% paste0("--tld=", tld),
    lang     %|||% paste0("--lang=", lang),
    exact    %|||% paste0("--exact"),
    time     %|||% paste0("--time=", time),
    site     %|||% paste0("--site=", site),
    unfilter %|||% paste0("--unfilter"),
    "-C", "--json"
  )

  ## execute command and return stdout
  system2(cmd, args = args, stdout = TRUE)
}

is_unix <- function() grepl("unix", .Platform$OS.type, ignore.case = TRUE)

windows_python <- function() {
  if (!grepl("python", sys_which("python"))) {
    stop("'googler' requires python, which does not appear to be installed.")
  }
  path
}

unix_python <- function() {
  path <- sys_which(paste0("python",
    c("", "3", "3.6", "3.7", "3.8", "3.9", "4", "3.4", "3.5")))
  path <- grep("python3", path, value = TRUE)[1]
  if (is.na(path)) {
    stop("'googler' requires python3, which does not appear to be installed.")
  }
  path
}

python_path <- function() {
  if (is_unix()) {
    unix_python()
  } else {
    windows_python()
  }
}

check_count <- function(x) {
  if (length(x) == 0) {
    return(invisible())
  }
  if (x) {
    warning("Automated bulk web scraping is not the intended use of {googler}",
      immediate. = TRUE)
  }
  invisible()
}

`%||%` <- function(a, b) {
  if (is.null(a))
    b
  else
    a
}

`%|||%` <- function(a, b) {
  if (!is.null(a))
    b
  else
    a
}

googler_path <- function() {
  ## if googler.path in options
  if (!is.null(path <- getOption("googler.path"))) {
    options(googler.path = path)
    return(path)
  }
  ## if googler is installed
  if (grepl("googler", path <- sys_which("googler"))) {
    options(googler.path = path)
    return(path)
  }
  ## otherwise download and store script
  utils::download.file(
    "https://raw.githubusercontent.com/jarun/googler/v3.9/googler",
    path <- file.path(tempdir(), "googler"),
    quiet = TRUE
  )
  options(googler.path = path)
  path
}


sys_which <- function(x) {
  if (is_unix()) {
    return(Sys.which(x))
  }
  sys_win <- function(x) {
    suppressWarnings({
      path <- tryCatch(system(sprintf("where %s 2> NUL", x), intern = TRUE)[1],
        error = function(e) NA_character_)
    })
    if (file.exists("NUL")) {
      file.remove("NUL")
    }
    if (!is.na(path)) {
      return(`names<-`(path, x))
    }
    Sys.which(x)
  }
  vapply(x, sys_win, character(1))
}
