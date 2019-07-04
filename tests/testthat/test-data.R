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
                 c("id", "name", "type", "categories", "definitions"))
    expect_type(variables[["id"]], "character")
    expect_type(variables[["name"]], "character")
    expect_s3_class(variables[["type"]], "factor")
    expect_equal(levels(variables[["type"]]), c("cat", "ord", "cont"))
    expect_type(variables[["categories"]], "character")
    expect_type(variables[["definitions"]], "character")
})

test_that("codes are valid", {
    expect_equal(dim(codes), c(429, 2))
    expect_equal(colnames(codes), c("var_id", "codes"))
    expect_type(codes[["var_id"]], "character")
    expect_type(codes[["codes"]], "list")
    for (codes in codes[["codes"]]) {
        expect_equal(ncol(codes), 3)
        expect_equal(colnames(codes), c("code", "name", "description"))
        expect_type(codes[["name"]], "character")
        expect_type(codes[["description"]], "character")
    }
})

test_that("data are valid", {
    expect_equal(dim(data), c(172, 430))
    expect_equal(colnames(data), c("soc_id", variables[["id"]]))
    expect_type(data[["soc_id"]], "character")
})

test_that("types of codes and data are consistent", {
    for (var_id in variables[["id"]]) {
        code <- dplyr::filter(codes,
                              var_id == !!var_id)[["codes"]][[1]][["code"]]
        expect_equal(class(data[[var_id]]), class(code))
        expect_equal(levels(data[[var_id]]), levels(code))
    }
})
