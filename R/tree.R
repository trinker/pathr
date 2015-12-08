#' Generate a Directory Tree
#'
#' Given a directory, generate a directory tree diagram.  currently, this
#' function is experimental.
#'
#' @param path A path to the directory.
#' @param out An optional outfile (typically .txt) to print to.
#' @param include.files logical.  If \code{TRUE} files and drectories will be
#' included.
#' @param additional Additonal arguments passed to
#' href{https://www.microsoft.com/resources/documentation/windows/xp/all/proddocs/en-us/tree.mspx?mfr=true}{\code{tree}}
#' (Windows) or \href{http://www.computerhope.com/unix/tree.htm}{tree} (Unix).
#' @param copy2clip logical.  If \code{TRUE} attempts to copy to the clipboard
#' via \code{\link[clipr]{write_clip}}.
#' @export
#' @note The \pkg{tree} program must be installed to use.
#' @examples
#' \dontrun{
#' tree()
#' tree(.libPaths())
#' }
tree <- function(path = ".", out = NULL, include.files = TRUE,
    additional = NULL, copy2clip = FALSE){

    if (!file.exists(path)) stop("`path` does not exist")
    if (Sys.which("tree") == "" && .Platform$OS.type != "windows") {
        message(
            sprintf(
                "`tree` not found, try using `%s install tree`",
                ifelse(Sys.info()[['sysname']] == "Darwin", "brew", "sudo apt-get")
            )
        )
    }

    if (is.null(out)){
        tmp <- tempdir()
        out <- file.path(tmp, paste0(gsub(":|\\s+", "_", Sys.time()), ".txt"))
    }

    if(.Platform$OS.type == "windows") {
        command <- shell
        fls <- ifelse(include.files, "/f", "")
        a <- "/a >"
        cmd <- paste("tree", shQuote(path), fls, a, additional, shQuote(out))

    } else {
        command <- system
        fls <- ifelse(include.files, "-o", "")
        a <- "-a "
        cmd <- paste("tree", shQuote(path), a, fls, additional, shQuote(out))

    }

    command(cmd)
    out <- readLines(out)

    if (copy2clip) clipr::write_clip(out)
    out <- paste(out, collapse="\n")
    class(out) <- c("tree", class(out))
    out
}

#' Prints a tree object
#'
#' Prints a tree object.
#'
#' @param x A \code{tree} object.
#' @param \ldots Other arguments passed to \code{\link[base]{cat}}.
#' @export
#' @method print tree
print.tree <- function(x,  ...){
    cat(x, "\n", ...)
}

