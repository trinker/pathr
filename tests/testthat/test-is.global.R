context("Checking is.global")

test_that("is.global checks if in global environment",{

    expect_false(is.global())
})

