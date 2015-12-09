#' Expand Tilde Path
#'
#' A wrapper for \code{\link[base]{path.expand}} that expands a tilde prefixed
#' path, replacing the leading tilde by the user's home directory (if defined on
#' that platform).
#'
#' @param x A tilde prefixed path.
#' @return Returns a vector of expanded paths.
#' @export
#' @seealso \code{\link[base]{file.path}}
#' @examples
#' library*magrittr)
#' file_path("~/mydir", paste0("file", 1:2, ".pdf")) %>%
#'     expand_path()
expand_path <- function(x){
    normalize(parse_path(path.expand(x)))
}
