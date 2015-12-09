context("Checking swap")

test_that("swap swaps on index and regex",{

    expect_equal(
        as.character(swap(list(1:8), inds = c(2, 4), "REPLACED VALUE")),
        "1/REPLACED VALUE/3/REPLACED VALUE/5/6/7/8"
    )

    expect_equal(
        as.character(swap(list(1:8), pattern = "[238]", replacement = "REPLACED VALUE")),
        "1/REPLACED VALUE/REPLACED VALUE/4/5/6/7/REPLACED VALUE"
    )
})

test_that("swap_index swaps on index",{

    expect_equal(
        as.character(swap_index(list(1:8), c(2, 4), "REPLACED VALUE")),
        "1/REPLACED VALUE/3/REPLACED VALUE/5/6/7/8"
    )
})

test_that("swap_regex swaps on regex",{

    expect_equal(
        as.character(swap_regex(list(1:8), "[238]", replacement = "REPLACED VALUE")),
        "1/REPLACED VALUE/REPLACED VALUE/4/5/6/7/REPLACED VALUE"
    )
})

