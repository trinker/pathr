#' Open Path (Directories & Files)
#'
#' Use the operating system defaults to open directories and files.
#'
#' @param x A vector (typically of length one) of paths to directories of files.
#' @references \url{http://stackoverflow.com/q/12135732/1000343}
#' @note This function is operating system and setting dependant.  Results may
#' not be consistent across operating systems.  Depending upon the default
#' programs for file types the results may vary as well.  Some files may not be
#' able to be opened.
#' @export
#' @author Dason Kurkiewicz and Tyler Rinker <tyler.rinker@@gmail.com>.
#' @examples
#' \dontrun{
#' open_path()
#' }
open_path <- function(x = "."){
    if (.Platform['OS.type'] == "windows"){
        invisible(lapply(x, shell.exec))
    } else {
        invisible(lapply(x, function(x) {system(paste(Sys.getenv("R_BROWSER"), x))}))
    }
}
