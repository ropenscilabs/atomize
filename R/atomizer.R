#' atomizer
#'
#' @export
#' @param path_ref path to reference package, end of path is pkg name
#' @param path_new path to new package, end of path is pkg name
#' @param funcs function(s) to extract
#' @examples \dontrun{
#' atomizer("../foobar")
#' }
atomizer <- function(path_ref, path_new, funcs) {
  res <- scattalyze(path_ref)
  fout <- find_deps(res, fxns = funcs)
  g <- extract_funcs(path_ref, fout)
  xx <- get_imports(path_ref, fout)
  write_pkg(path = path_new, fxns = g, imports = xx)
}
