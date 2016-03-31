#' Get all functions needed for a given function
#'
#' @export
#' @param fxns One or more functions. required.
#' @return A list
#' @examples \dontrun{
#' find_deps(...)
#' }
find_deps <- function(fxns) {
  UseMethod("find_deps")
}

#' @export
find_deps.function_map <- function(fxns) {
  "xxx"
}
