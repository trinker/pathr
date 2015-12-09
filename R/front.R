#' Extract the First/Last N Elements of a Path
#'
#' \code{front} - Extract the first n elements of a path.  Similar to
#' \code{\link[utils]{head}} (uses \code{\link[utils]{head}} under the hood).
#' Compare the defualt settings to \code{\link[base]{basename}} and
#' \code{\link[base]{dirname}}.
#'
#' @param x A \code{parse_path} object.
#' @param n A single integer. If positive, size for the resulting object: number
#' of elements for a vector. If negative, all but the \code{n} last/first number
#' of elements of \code{x}.
#' @param collapse logical.  If \code{TRUE} the path elements will be collapsed
#' with the \code{"/"} separator.
#' @param \ldots ignored.
#' @return Returns a vector (either \code{atomic} or \code{\link[base]{list}} of
#' \code{character} path elements) of sub-paths.
#' @export
#' @seealso \code{\link[base]{basename}},
#' \code{\link[base]{dirname}}
#' @rdname front
#' @family sub-path manipulation functions
#' @examples
#' front(list(1:8), 3)
#' front(list(1:8), -3)
#'
#' back(list(1:8), 3)
#' back(list(1:8), -3)
#'
#' library(magrittr)
#' files %>%
#'     parse_path() %>%
#'     front()
#'
#' files %>%
#'     parse_path() %>%
#'     front(3)
#'
#' files %>%
#'     parse_path() %>%
#'     back()
#'
#' files %>%
#'     parse_path() %>%
#'     back(3)
#'
#' ## Compare to basename/dirname
#' (fls <- file.path("","p1","p2","p3", c("file.pdf", "file.txt", "file.Rmd")))
#'
#' basename(fls)
#' fls %>%
#'     parse_path() %>%
#'     back()
#'
#' dirname(fls)
#' fls %>%
#'     parse_path() %>%
#'     front()
front <- function(x, n=-1, collapse = TRUE, ...){
    x <- manipulate_parsed(x)
    y <- lapply(x, utils::head, n=n)
    class_manipulate(y, collapse)
}


#' Extract the Beginning/Ending Directories/Files of a Path
#'
#' \code{back} - Extract the first n elements of a path.  Similar to
#' \code{\link[utils]{tail}} (uses \code{\link[utils]{tail}} under the hood).
#'
#' @export
#' @rdname front
back <- function(x, n=1, collapse = TRUE, ...){
    x <- manipulate_parsed(x)
    y <- lapply(x, utils::tail, n=n)
    class_manipulate(y, collapse)
}

