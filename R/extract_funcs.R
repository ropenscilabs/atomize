#' Get all functions needed for a given function
#'
#' @export
#' @param path Path to a package. Default: \code{.}. required
#' @param x One or more functions. required.
#' @return A list
#' @examples \dontrun{
#' res <- scattalyze("../rredlist")
#' (funcs <- find_deps(res, fxns = "rl_citation"))
#' extract_funcs(path="../rredlist", funcs)
#' }
extract_funcs <- function(path, x) {
  UseMethod("extract_funcs")
}

#' @export
extract_funcs.default <- function(path, x) {
  stop("extract_funcs doesn't have a method for ", class(x), call. = FALSE)
}

#' @export
extract_funcs.character <- function(path, x) {
  get_fxns(get_files(path), env = myenv)
  nmspaced <- grep("\\:", x, value = TRUE)
  non_nmspaced <- grep("\\:", x, value = TRUE, invert = TRUE)
  res1 <- setNames(lapply(non_nmspaced, function(z) {
    deparse(get(z, myenv))
  }), non_nmspaced)
  # res2 <- lapply(nmspaced, function(z) {
  #   env2 <- new.env()
  #   get_fxns(get_files(path), env = env2)
  #   deparse(get(z, myenv))
  # })
  res1
}

get_files <- function(path = ".") functionMap:::r_package_files(path)

myenv <- new.env()

get_fxns <- function(x, env) {
  invisible(lapply(x, source, local = env))
}

# get_fxns <- function(x) {
#   lapply(x, function(z) {
#     tmp <- parse(z)
#     as.character(attributes(tmp)$wholeSrcref)
#   })
# }
