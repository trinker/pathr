#' Extract the Elements of a Path Before/After a Regex Occurrence
#'
#' Extract the elements of a path before/after a regex occurrence.
#' Stands in contrast to \code{front},\code{back}, and index in that with the
#' later three are element number/index focused whereas
#' \code{before}/\code{after} are content focused.
#'
#' @param x A \code{parse_path} object.
#' @param pattern A character string containing a regular expression (or
#' character string for \code{fixed = TRUE}) to be matched in the given character
#' vector. Note that under the hood \code{\link[base]{grep}} is used to locate
#' the indices of path elements that match the regex condition.  Only the first
#' match will be used.  The argument \code{perl = TRUE} is hard coded.
#' @param include logical.  If \code{TRUE} the element with the regex match will
#' be included in the reconstructed sub-path.
#' @param collapse logical.  If \code{TRUE} the path elements will be collapsed
#' with the \code{"/"} separator.
#' @param \ldots ignored.
#' @return Returns a vector (either \code{atomic} or \code{\link[base]{list}} of
#' \code{character} path elements) of sub-paths.
#' @export
#' @rdname before
#' @family sub-path manipulation functions
#' @examples
#' (parsed <- list(c("a", "really", "boring", "path", "for", "R")))
#' before(parsed, "^bor")
#' before(parsed, "^bor", include = TRUE)
#'
#' after(parsed, "^bor")
#' after(parsed, "^bor", include = TRUE)
#'
#' library(magrittr)
#' files %>%
#'     parse_path() %>%
#'     after("^qdap$")
#'
#' files %>%
#'     parse_path() %>%
#'     after("^qdap$", include = TRUE)
#'
#' files %>%
#'     parse_path() %>%
#'     before("\\.R$")
before <- function(x, pattern, include = FALSE, collapse = TRUE, ...){
    y <- lapply(x, function(z) {
        ind <- grep(pattern, z, perl=TRUE, ...)[1]
        if (!include) ind <- ind - 1
        if (is.na(ind) || ind < 1 || length(ind) == 0) return(NA)
        utils::head(z, ind)
    })
    if (isTRUE(collapse)) y <- normalize(y)
    y
}

#' @export
#' @rdname before
after <- function(x, pattern, include = FALSE, collapse = TRUE, ...){
    y <- lapply(x, function(z) {
        ind <- grep(pattern, z, perl=TRUE, ...)[1]
        if (!include) ind <- ind - 1
        if (is.na(ind) || ind > length(z) || length(ind) == 0) return(NA)
        utils::tail(z, ind)
    })
    if (isTRUE(collapse)) y <- normalize(y)
    y
}

