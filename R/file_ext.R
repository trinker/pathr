#' Reimport/Renaming of tools Package's File Extension Functions
#'
#' The \pkg{tools} package has \code{\link[tools]{file_ext}} related functions
#' but the package has to be explicitly loaded (though comes standard with R) and
#' the \code{\link[tools]{file_path_sans_ext}} is longer to type.  The functions
#' have been reimported and renamed to aid in their availablity with other path
#' parsing tools to make their integration seamless (particularly in a pipeable
#' form).
#'
#' @param x A character vector giving file paths.
#' @param compression logical.  Should compression extension \file{.gz},
#' \file{.bz2} or \file{.xz} be removed first?

#' @return Returns a character string with just the file extension (\code{file_ext})
#' or the path without the file extension (\code{no_file_ext}).
#' @rdname file_ext
#' @export
#' @importFrom tools file_ext file_path_sans_ext
#' @examples
#' \dontrun{
#' library(magrittr)
#' (r_files <- dir(file.path(R.home(), "doc/manual"), full.names = TRUE))
#'
#' file_ext(r_files)
#' no_file_ext(r_files)
#'
#' r_files %>%
#'     parse_path() %>%
#'     back() %>%
#'     no_file_ext()
#' }
file_ext <- tools::file_ext


#' @rdname file_ext
#' @export
no_file_ext <- tools::file_path_sans_ext
