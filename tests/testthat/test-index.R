context("Checking index")

test_that("index grabs indices",{

    expect_equal(as.character(index(list(1:8), 3)), "3")
    expect_equal(as.character(index(list(1:8), 4:6)), "4/5/6")
    expect_equal(as.character(index(list(1:8), c(1, 3))), "1/3")

})

