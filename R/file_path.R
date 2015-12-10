#' Construct Path to File
#'
#' A wrapper for \code{\link[base]{file.path}} that normalizes the path separator
#' between elements.
#'
#' @param \ldots Atomic vectors of elements to construct a path from.
#' @return Returns a vector of paths.
#' @export
#' @seealso \code{\link[base]{file.path}}
#' @examples
#' file_path("mydir", paste0("file", 1:2, ".pdf"))
file_path <- function(...) {
    out <- file.path(..., fsep = .Platform[["file.sep"]])
    class_manipulate(manipulate_parsed(parse_path(out)), TRUE)
}
