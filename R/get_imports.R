#' Get imported packages and their functions
#'
#' @export
#' @param path Path to a package. Default: \code{.}. required
#' @param x One or more functions. required.
#' @return A list
#' @examples \dontrun{
#' res <- scattalyze("../rredlist")
#' (funcs <- find_deps(res, fxns = "rl_citation"))
#' extract_funcs(path="../rredlist", funcs)
#' get_imports(path="../rredlist", funcs)
#' }
get_imports <- function(path, x) {
  envy <- new.env()
  get_fxns(get_files(path), env = envy)
  grep("\\:", x, value = TRUE)
}
