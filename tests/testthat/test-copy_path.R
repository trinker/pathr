context("Checking copy")

test_that("copy_path copies to clipboard",{

    x <- copy_path("foo/bar")
    expect_equal(x, "foo/bar")
    expect_equal(clipr::read_clip(), "foo/bar")

})

