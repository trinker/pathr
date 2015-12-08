context("Checking parse_path")

test_that("parse_path parses both forard and double backslash separators",{

    paths <- c("C:\\Users\\Tyler\\AppData\\Local\\Temp\\Rtmp2Ll9d9", "C:/R/R-3.2.2")

    expect_equal(
        parse_path(paths),
        structure(list(c("C:", "Users", "Tyler", "AppData", "Local",
            "Temp", "Rtmp2Ll9d9"), c("C:", "R", "R-3.2.2")), class = "parse_path")

    )
})

test_that("parse_path prints",{

    paths <- c("C:\\Users\\Tyler\\AppData\\Local\\Temp\\Rtmp2Ll9d9", "C:/R/R-3.2.2")

    expect_equal(
        capture.output(print(parse_path(paths))),
        c("[[1]]", "[1] \"C:\"         \"Users\"      \"Tyler\"      \"AppData\"    \"Local\"      \"Temp\"       \"Rtmp2Ll9d9\"",
            "", "[[2]]", "[1] \"C:\"      \"R\"       \"R-3.2.2\"", "")
        )
})
