#' Parse Path(s)
#'
#' Parses the individual directories, sub-directories, and files in a path into
#' individual elements.
#'
#' @param x A vector of paths.
#' @return Returns a list of vectors of parsed paths.
#' @export
#' @examples
#' parse_path(files)
parse_path <- function(x){
    out <- strsplit(x, "\\\\|/")
    class(out) <- c("parse_path")
    out
}

#' Prints a parse_path Object
#'
#' Prints a parse_path object
#'
#' @param x A parse_path object
#' @param \ldots ignored.
#' @method print parse_path
#' @export
print.parse_path <- function(x, ...){
    class(x) <- 'list'
    print(x)
}
