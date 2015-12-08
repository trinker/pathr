context("Checking file_path")

test_that("file_path creates a file path",{

    expect_equal(
        file_path("mydir", paste0("file", 1:2, ".pdf")),
        c("mydir/file1.pdf", "mydir/file2.pdf")
    )

})

