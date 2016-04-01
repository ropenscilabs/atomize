#' Get all functions needed for a given function
#'
#' @export
#' @param path Path to a package. Default: \code{.}. required
#' @param fxns One or more functions. required.
#' @param imports vector or list of imports of the form \code{pkg::function}
#' @param ... futher options passed on to \code{\link[devtools]{create}}
#' @return A list
#' @examples \dontrun{
#' res <- scattalyze("../rredlist")
#' (funcs <- find_deps(res, fxns = "rl_citation"))
#' g <- extract_funcs(path="../rredlist", funcs)
#' xx <- get_imports(path="../rredlist", funcs)
#' write_pkg(path = "../stuff", fxns = g, imports = xx)
#' }
write_pkg <- function(path, fxns, imports, ...) {
  # devtools::create(path, ...)
  pkg <- devtools::create(path)
  if (pkg) {
    pkn <- basename(path)

    pkgmanfile <- sprintf("#' %s
#'
#' @name %s-package
#' @aliases %s
%s
#' @docType package
#' @keywords package
NULL", pkn, pkn, pkn, arr_imports(imports))

    message("writing package level man file")
    cat(pkgmanfile, file = file.path(path, "R", paste0(basename(path), "-package.R")))

    message("writing functions")
    for (i in seq_along(fxns)) {
      prped <- paste(names(fxns)[i], paste0(fxns[[i]], collapse = "\n"), sep = " <- ")
      cat(prped, file = file.path(path, "R", paste0(names(fxns)[i], ".R")))
    }

    message("running devtools::document")
    devtools::document(path)
    cat('exportPattern("^[^\\\\.]")', file = file.path(path, "NAMESPACE"), append = TRUE)
  }
}

arr_imports <- function(x) {
  paste0(sprintf("#' @importFrom %s", gsub("::", " ", x)), collapse = "\n")
}
