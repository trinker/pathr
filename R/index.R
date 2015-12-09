#' Extract an Index of Elements of a Path
#'
#' Extract the indices of a path.  Stands in contrast to \code{front}/\code{back}
#' in that with the later two the user wants the ends of the path elements (front
#' or bacK) whereas with \code{index} the user wants the middle elements of a path.
#'
#' @param x A \code{parse_path} object.
#' @param inds A vector of indices to select from.
#' @param collapse logical.  If \code{TRUE} the path elements will be collapsed
#' with the \code{"/"} separator.
#' @param \ldots ignored.
#' @return Returns a vector (either \code{atomic} or \code{\link[base]{list}} of
#' \code{character} path elements) of sub-paths.
#' @export
#' @family sub-path manipulation functions
#' @examples
#' index(list(1:8), 3)
#' index(list(1:8), 4:6)
#' index(list(1:8), c(1, 3))
#'
#' library(magrittr)
#' files %>%
#'     parse_path() %>%
#'     index(c(2, 4:5))
#'
#' files %>%
#'     parse_path() %>%
#'     index(3)
index <- function(x, inds, collapse = TRUE, ...){
    x <- manipulate_parsed(x)
    y <- lapply(x, function(z) z[inds])
    class_manipulate(y, collapse)
}


