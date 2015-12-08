context("Checking before")

test_that("before get the paths before a regex",{

    parsed <- list(c("a", "really", "boring", "path", "for", "R"))
    expect_equal(before(parsed, "^bor"), "a/really")
    expect_equal(before(parsed, "^bor", include = TRUE), "a/really/boring")
    expect_equal(before(parsed, "^bor", collapse=FALSE), list(c("a", "really")))
})

test_that("after gets the paths after a regex",{

    parsed <- list(c("a", "really", "boring", "path", "for", "R"))

    expect_equal(after(parsed, "^bor"), "path/for/R")
    expect_equal(after(parsed, "^bor", include = TRUE), "boring/path/for/R")
    expect_equal(after(parsed, "^bor", collapse=FALSE), list(c("path", "for", "R")))

})
