context("Checking class_manipulate")

test_that("class_manipulate adds class and normalization",{

    expect_equal(
        class_manipulate(list(c("th", "rt")), TRUE),
        structure("th/rt", class = c("manipulate", "character"),
            parsed = list( c("th", "rt")))
    )

    expect_equal(
        class_manipulate(list(c("th", "rt")), FALSE), structure(list(c("th", "rt")),
            class = c("manipulate", "list"), parsed = list(c("th", "rt")))
    )
})

