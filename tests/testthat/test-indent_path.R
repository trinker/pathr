context("Checking indent_path")

test_that("indent_path ...",{

    expect_equal(
        indent_path("C:/Users/Tyler/Desktop/guy", copy2clip = TRUE),
        structure(
            "-> C:\n  -> Users\n    -> Tyler\n      -> Desktop\n        -> guy",
            class = c("indent_path", "character")
        )
    )

    expect_equal(
        paste(clipr::read_clip(),
        collapse="|"), "-> C:|  -> Users|    -> Tyler|      -> Desktop|        -> guy"
    )

    expect_equal(
        indent_path("C:/Users/Tyler/Desktop/guy", symbol="--"),
        structure(
            "-- C:\n  -- Users\n    -- Tyler\n      -- Desktop\n        -- guy",
            class = c("indent_path", "character")
        )
    )

    expect_equal(
        indent_path("C:/Users/Tyler/Desktop/guy", copy2clip = FALSE),
        structure(
            "-> C:\n  -> Users\n    -> Tyler\n      -> Desktop\n        -> guy",
            class = c("indent_path", "character")
        )
    )

})

