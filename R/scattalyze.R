#' Scan package and get functions, and their dependencies, etc
#'
#' @export
#' @param path Path to a package. Default: \code{.}
#' @param include_base Whether to include functions from the 'base' package.
#' Default: \code{FALSE}
#' @return A function_map S3 object (a list basically)
#' @examples \dontrun{
#' (res <- scattalyze("../rredlist"))
#' # data
#' res$data
#' # exports
#' res$exports
#' }
scattalyze <- function(path = ".", include_base = FALSE) {
  functionMap::map_r_package(path = path, include_base = include_base)
}
