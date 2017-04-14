#' Generate a Directory Tree
#'
#' Given a directory, generate a directory tree diagram.
#'
#' @param path A path to the directory.
#' @param include.files logical.  If \code{TRUE} files and drectories will be
#' included.
#' @param all.files logical.   If \code{FALSE}, only the names of visible files
#' are returned. If \code{TRUE}, all file names will be returned.
#' @param use.data.tree logical.  If \code{TRUE} the \pkg{data.tree} package is
#' used to make the tree, otherwise \code{system} is invoked with the extrenal
#' \pkg{tree} program.  The former produces a \code{"R6"}, \code{"Node"} object
#' that can be manipulated accordingly.  The latter will be faster in most cases.
#' @param out An optional outfile (typically .txt) to print to.
#' @param additional Additonal arguments passed to
#' href{https://www.microsoft.com/resources/documentation/windows/xp/all/proddocs/en-us/tree.mspx?mfr=true}{\code{tree}}
#' (Windows) or \href{http://www.computerhope.com/unix/tree.htm}{tree} (Unix).
#' @param copy2clip logical.  If \code{TRUE} attempts to copy to the clipboard
#' via \code{\link[clipr]{write_clip}}.
#' @export
#' @note The \pkg{tree} program must be installed to use \code{use.data.tree = FALSE}.
#' @examples
#' tree(system.file("", package = "base"), use.data.tree = TRUE)
#' \dontrun{
#' tree()
#' tree(.libPaths())
#' }
tree <- function(path = ".", include.files = TRUE, all.files = TRUE,
    use.data.tree = FALSE, out = NULL, additional = NULL, copy2clip = FALSE){

    if (isTRUE(use.data.tree)){
        dir_tree_dt(path = path, include.files = include.files,
            all.files = all.files, copy2clip = copy2clip)
    } else {
        dir_tree_sys(path = path, out = out, include.files = include.files,
            additional = additional, copy2clip = copy2clip)

    }

}


dir_tree_dt <- function(path = ".", include.files = TRUE, all.files = TRUE,
    copy2clip = FALSE){

    if (isTRUE(include.files)){
        fls <- dir(path, all.files = all.files, full.names = TRUE, recursive = TRUE)
    } else {
        fls <- list.files(path, all.files = all.files)
    }
    parsed <- parse_path(fls)
    contents <- back(parsed, -(-1 + length(unlist(parse_path(path)))))
    y <- attributes(back(contents, -1))[["parsed"]]
    z <- data.frame(matrix(NA, ncol = max(sapply(y, length)), nrow = length(y)))
    for (i in seq_along(y)){
        z[i, 1:length(y[[i]])] <- y[[i]]
    }
    z[["pathString"]] <- contents

    out <- data.tree::as.Node(z)
    out2 <- utils::capture.output(out)[-1]
    out2 <- gsub("^\\d+\\s+", "", out2)
    out2[-1] <- paste0("  ", out2[-1])
    #cat(paste(out2, collapse="\n"), "\n")
    if (copy2clip) clipr::write_clip(out2)
    out

}


dir_tree_sys <- function(path = ".", out = NULL, include.files = TRUE,
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

