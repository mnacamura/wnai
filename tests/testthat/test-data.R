context("test-data")

test_that("societies are valid", {
    expect_equal(dim(societies), c(172, 6))
    expect_equal(colnames(societies),
                 c("id", "name", "alt_names", "glottocode", "latitude", "longitude"))
    expect_type(societies[["id"]], "character")
    expect_type(societies[["name"]], "character")
    expect_type(societies[["alt_names"]], "character")
    expect_type(societies[["glottocode"]], "character")
    expect_type(societies[["latitude"]], "double")
    expect_type(societies[["longitude"]], "double")
})

test_that("variables are valid", {
    expect_equal(dim(variables), c(429, 5))
    expect_equal(colnames(variables),
                 c("id", "name", "type", "categories", "definition"))
    expect_type(variables[["id"]], "character")
    expect_type(variables[["name"]], "character")
    expect_s3_class(variables[["type"]], "factor")
    expect_equal(levels(variables[["type"]]), c("cat", "ord", "cont"))
    expect_type(variables[["categories"]], "character")
    expect_type(variables[["definition"]], "character")
})
