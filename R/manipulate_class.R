class_manipulate <-function(x, normalize){
    y <- x
    if (isTRUE(normalize)) y <- normalize(y)
    class(y) <- unique(c("manipulate", class(y)))
    attributes(y)[["parsed"]] <- x
    y
}

manipulate_parsed <- function(x){
    if (!methods::is(x, "manipulate")) return(x)
    attributes(x)[["parsed"]]
}

#' Prints a manipulate Object
#'
#' Prints a manipulate object
#'
#' @param x A manipulate object
#' @param \ldots ignored.
#' @method print manipulate
#' @export
print.manipulate <- function(x, ...){
    class(x) <- class(x)[!class(x) %in% "manipulate"]
    attributes(x)[["parsed"]] <- NULL
    print(x)
}

