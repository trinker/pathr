#' Pipeable Clipboard Copying
#'
#' This convenience function wraps \code{\link[clipr]{write_clip}} to copy the
#' previous output in the chain to the clipboard.
#'
#' @param x An object to be written to the system clipboard.
#' @param \ldots Other arguments passed to \code{\link[clipr]{write_clip}}.
#' @return Returns \code{x} but attempts to copy content to the clipboard.
#' @export
#' @examples
#' \dontrun{
#' library(magrittr)
#' files %>%
#'     parse_path() %>%
#'     swap_regex("^(P|R)", "oops") %>%
#'     copy()
#' }
copy <- function(x, ...){
    clipr::write_clip(x, ...)
    x
}
