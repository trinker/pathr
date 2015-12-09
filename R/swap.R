#' Replace Elements of a Path
#'
#' Replace the elements of a path. Note either a index (use \code{inds}) or regex
#' (use \code{pattern}) based approach is used to identify the indices to replace.
#' The more specific \code{swap_index} or \code{swap_regex} can be used to be
#' more targetted, transparent, pipeable, and efficient.
#'
#' @param x A \code{parse_path} object.
#' @param inds Indices to replace.
#' @param replacement A value to replace the indentified indices with.
#' @param pattern A character string containing a regular expression (or
#' character string for \code{fixed = TRUE}) to be matched in the given character
#' vector. Note that under the hood \code{\link[base]{grep}} is used to locate
#' the indices of path elements that match the regex condition.  Only the first
#' match will be used.  The argument \code{perl = TRUE} is hard coded.
#' @param collapse logical.  If \code{TRUE} the path elements will be collapsed
#' with the \code{"/"} separator.
#' @param \ldots ignored.
#' @return Returns a vector (either \code{atomic} or \code{\link[base]{list}} of
#' \code{character} path elements) of swapped paths.
#' @export
#' @rdname swap
#' @family sub-path manipulation functions
#' @examples
#' swap(list(1:8), inds = c(2, 4), "REPLACED VALUE")
#' swap(list(1:8), pattern = "[238]", replacement = "REPLACED VALUE")
#'
#' library(magrittr)
#' files %>%
#'     parse_path() %>%
#'     swap(1, "MyFile")
#'
#' files %>%
#'     parse_path() %>%
#'     swap_index(3, "textMining")
#'
#' files %>%
#'     parse_path() %>%
#'     swap_regex("^qdap$", "textMining")
#'
#' files %>%
#'     parse_path() %>%
#'     swap_regex("\\.R$", "function.R")
#'
#' files %>%
#'     parse_path() %>%
#'     swap_regex("^(P|R)", "oops")
swap <- function(x, inds, replacement, pattern = NULL, collapse = TRUE, ...) {
    x <- manipulate_parsed(x)
    if (is.null(pattern)){
        y <- lapply(x, function(z) {
            z[inds] <- replacement
            z
        })
    } else {
        y <- lapply(x, function(z) {
            z[grepl(pattern, z, perl=TRUE, ...)] <- replacement
            z
        })
    }
    class_manipulate(y, collapse)
}

#' @export
#' @rdname swap
swap_index <- function(x, inds, replacement, collapse = TRUE, ...) {
    x <- manipulate_parsed(x)
    y <- lapply(x, function(z) {
        z[inds] <- replacement
        z
    })
    class_manipulate(y, collapse)
}


#' @export
#' @rdname swap
swap_regex <- function(x, pattern, replacement, collapse = TRUE, ...) {
    x <- manipulate_parsed(x)
    y <- lapply(x, function(z) {
        z[grepl(pattern, z, perl=TRUE, ...)] <- replacement
        z
    })
    class_manipulate(y, collapse)
}

