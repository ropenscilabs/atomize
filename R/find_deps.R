#' Get all functions needed for a given function
#'
#' @export
#' @param x an object of class function_map
#' @param fxns One or more functions. required.
#' @return A list
#' @examples \dontrun{
#' res <- scattalyze("../rredlist")
#' find_deps(res, fxns = "rl_citation")
#' }
find_deps <- function(x, fxns) {
  UseMethod("find_deps")
}

#' @export
find_deps.default <- function(x, fxns) {
  stop("find_deps doesn't have a method for ", class(x), call. = FALSE)
}

#' @export
find_deps.function_map <- function(x, fxns) {
  x$data[fxns]
}
