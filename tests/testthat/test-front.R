context("Checking front")

test_that("front gets n after beginning",{

    expect_equal(as.character(front(list(1:8), 3)), "1/2/3")
    expect_equal(as.character(front(list(1:8), -3)), "1/2/3/4/5")

})

test_that("back gets n before end",{

    expect_equal(as.character(back(list(1:8), 3)), "6/7/8")
    expect_equal(as.character(back(list(1:8), -3)), "4/5/6/7/8")

})
