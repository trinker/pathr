context("Checking win_fix")

test_that("win_fix reads from clipboard and fixes backslashes",{

    clipr::write_clip("~\\Packages\\qdap\\R\\cm_code.overlap.R")
    expect_equal(win_fix(copy2clip = TRUE), "~/Packages/qdap/R/cm_code.overlap.R")
    expect_equal(clipr::read_clip(), "\"~/Packages/qdap/R/cm_code.overlap.R\"")

    clipr::write_clip("~\\Packages\\qdap\\R\\cm_code.overlap.R")
    expect_equal(win_fix(copy2clip = FALSE), "~/Packages/qdap/R/cm_code.overlap.R")

    clipr::write_clip("~\\Packages\\qdap\\R\\cm_code.overlap.R")
    win_fix(quote = FALSE, copy2clip = TRUE)
    expect_equal(clipr::read_clip(), "~/Packages/qdap/R/cm_code.overlap.R")
})

