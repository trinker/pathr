context("Checking normalize")

test_that("normalize adds single forward slash",{

    parsed_paths <- structure(list(c("C:", "Users", "Tyler", "AppData", "Local",
        "Temp", "Rtmp2Ll9d9"), c("C:", "R", "R-3.2.2")), class = "parse_path")

    expect_equal(
        normalize(parsed_paths),
        c("C:/Users/Tyler/AppData/Local/Temp/Rtmp2Ll9d9", "C:/R/R-3.2.2")
    )

})

