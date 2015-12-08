#' Fix Single Windows Backslashes
#'
#' Fix single Windows based backslashes in paths with a single foward slash.  By
#' defaukt copying a path from a Windows machine has R unfriendly single
#' backslashes.  This function copies a single Windows path from the clipboard
#' maes the necessary single foward slash correction.
#'
#' @param clip logical.  If \code{TRUE} the path is copied from the clipboard
#' via the \pkg{clipr} package.
#' @param quote logical.  If \code{TRUE} the returned path is wrapped with quotes.
#' @param copy2clip logical.  If \code{TRUE} the returned path is copied to the
#' clipboard.
#' @return Returns an R friendly path.
#' @export
#' @examples
#' ## copy this line to clipboard...
#' ## ~\Packages\qdap\R\cm_code.overlap.R
#' ## Now run...
#' ## win_fix()
win_fix <- function (clip = TRUE, quote = TRUE, copy2clip = interactive()) {
    if (!clip) {
        message("Please enter the path:\n\n")
        path <- readline()
    } else {
        path <- clipr::read_clip()
    }
    z <- chartr("\\", "/", path)
    if (quote) {
        x <- paste0("\"", z, "\"")
    } else {
        x <- z
    }
    if (copy2clip) {
        clipr::write_clip(x)
    }
    return(z)
}

