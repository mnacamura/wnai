context("test-data")

test_that("societies are valid", {
    expect_equal(dim(societies), c(172, 5))
    expect_equal(colnames(societies),
                 c("id", "name", "glottocode", "latitude", "longitude"))
    expect_type(societies[["id"]], "character")
    expect_type(societies[["name"]], "character")
    expect_type(societies[["glottocode"]], "character")
    expect_type(societies[["latitude"]], "double")
    expect_type(societies[["longitude"]], "double")
})
