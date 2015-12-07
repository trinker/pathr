#' Separate and Indent Path Elements
#'
#' Separate a path into hierarchical drectories and files for indented reading.
#'
#' @param path A path to the file/directory.  If \code{NULL} \code{indent_path}
#' attempts to use \code{\link[clipr]{read_clip}} to read and fix Windows paths.
#' @param copy2clip logical.  If \code{TRUE} attempts to copy to the clipboard
#' using \code{\link[clipr]{write_clip}}.  Default copies to the clipboard if
#' used interactively.
#' @param symbol The prefix symbol to use before the path element.
#' @export
#' @examples
#' indent_path("C:/Users/Tyler/Desktop/guy")
#' indent_path("C:/Users/Tyler/Desktop/guy", symbol="--")
#' indent_path("C:/Users/Tyler/Desktop/guy", symbol=".")
#' indent_path("C:/Users/Tyler/Desktop/guy", symbol="")
indent_path <- function(path = NULL, copy2clip = is.global(2), symbol = "->"){
    if (is.null(path)) path <- indent_path()
    m <- parse_path(path)[[1]]
    o <- paste0(lapply(2*0:c(length(m)-1), function(i) {
        paste(rep(" ", i), collapse="")
    }), sprintf("%s ", symbol), m)
    if (copy2clip) clipr::write_clip(o)
    out <- paste(o, collapse="\n")
    class(out) <- c("indent_path", class(out))
    out
}



#' Prints an indent_path object
#'
#' Prints an indent_path object.
#'
#' @param x An \code{indent_path} object.
#' @param \ldots Other arguments passed to \code{\link[base]{cat}}.
#' @export
#' @method print indent_path
print.indent_path <- function(x,  ...){
    cat(x, "\n", ...)
}
