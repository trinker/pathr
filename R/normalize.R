#' Ensure Number and Direction of Slash Separators Are Consistent
#'
#' Replace path separators with a single foward slash.
#'
#' @param x A \code{parse_path} object.
#' @return Returns an atomic vector of normalized paths.
#' @export
#' @examples
#' library(magrittr)
#' c("C:\\Users\\Tyler\\AppData\\Local\\Temp\\Rtmp2Ll9d9", "C:/R/R-3.2.2") %>%
#'     parse_path() %>%
#'     normalize()
normalize <- function (x) {
    unlist(lapply(x, function(x){
        if (length(x) == 1 && is.na(x)) return(NA)
        paste(x, collapse = "/")
    }))
}

