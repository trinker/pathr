context("Checking before")

test_that("before get the paths before a regex",{

    parsed <- list(c("a", "really", "boring", "path", "for", "R"))
    expect_equal(as.character(before(parsed, "^bor")), "a/really")
    expect_equal(as.character(before(parsed, "^bor", include = TRUE)), "a/really/boring")
    expect_equal(before(parsed, "^bor", collapse=FALSE), structure(list(c("a", "really")), class = c("manipulate", "list"
), parsed = list(c("a", "really"))))
})

test_that("after gets the paths after a regex",{

    parsed <- list(c("a", "really", "boring", "path", "for", "R"))

    expect_equal(as.character(after(parsed, "^bor")), "path/for/R")
    expect_equal(as.character(after(parsed, "^bor", include = TRUE)), "boring/path/for/R")
    expect_equal(after(parsed, "^bor", collapse=FALSE), structure(list(c("path", "for", "R")), class = c("manipulate",
"list"), parsed = list(c("path", "for", "R"))))

})
