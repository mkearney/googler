
try_null <- function(x) {
  tryCatch(eval(x, envir = parent.frame()), error = function(e) NULL)
}
try_tbl <- function(x) {
  tryCatch(eval(x, envir = parent.frame()), error = function(e) tibble::tibble())
}

ssystem <- function(...,
                    intern = TRUE,
                    ignore.stdout = FALSE,
                    ignore.stderr = FALSE,
                    quiet = FALSE) {
  if (quiet) {
    ignore.stderr <- TRUE
  }
  try_null(system(paste0(c(...), collapse = ""),
    intern = intern,
    ignore.stdout = ignore.stdout,
    ignore.stderr = ignore.stderr))
}


py3_installed <- function() {
  isTRUE(grepl("python", py_path(), ignore.case = TRUE))
}

py_path <- function() {
  ## path to conda
  conda <- list.dirs("~", full.names = TRUE, recursive = FALSE)
  conda <- paste0(grep("conda3", conda, value = TRUE), "/bin")

  ## system paths
  sp <- Sys.getenv("PATH")
  if (sp == "") {
    sp <- "/usr/bin"
  }
  sys_paths <- strsplit(sp, "/?:")[[1]]

  ## combine with conda
  sys_paths <- unique(c(sys_paths, conda))

  ## look for python executables
  py_paths <- unique(c(unlist(lapply(sys_paths, function(.x)
    list.files(.x, pattern = "python($|.*[^mg]$)",
    ignore.case = TRUE, full.names = TRUE))),
    sys_which(paste0("python",
      c("", "4", "3.9", "3.8", "3.7", "3.6", "3.5", "3.4", "3")))))

  ## with the number 3 in them
  py_paths <- grep("3", py_paths, value = TRUE)

  ## if no python return empty
  if (length(py_paths) == 0) {
    return("")
  }

  ## if 3.4 or above
  if (any(grepl("python.*3\\.[4-9]", py_paths, ignore.case = TRUE))) {
    py_paths <- grep("python.*3\\.[4-9]", py_paths, ignore.case = TRUE, value = TRUE)
    return(py_paths[1])
  }

  ## if python3
  if (any(grepl("python.*3", py_paths, ignore.case = TRUE))) {
    py_paths <- grep("python.*3", py_paths, ignore.case = TRUE, value = TRUE)
    return(py_paths[1])
  }

  ## otherwise return normal python
  return(py_paths[1])
}
