library(magrittr)
library(readr)
library(tibble)
library(usethis)

library(doParallel)
registerDoParallel(parallel::detectCores())

dplace_rev <- Sys.getenv("DPLACE_REV")
if (dplace_rev == "")
    stop("environment variable DPLACE_REV is not set")

proj_dir <- getwd()
work_dir <- file.path(proj_dir, "data-raw", "cache", "dplace-data")
wnai_dir <- file.path(work_dir, "datasets", "WNAI")
if (!dir.exists(wnai_dir))
  dir.create(wnai_dir, recursive = TRUE)

base_url <- paste("https://raw.githubusercontent.com/D-PLACE/dplace-data",
                  dplace_rev, "datasets/WNAI", sep = "/")
for (file_name in paste(c("societies", "variables", "codes", "data"), "csv",
                        sep = ".")) {
    path <- file.path(wnai_dir, file_name)
    if (!file.exists(path))
        download.file(paste(base_url, file_name, sep = "/"), path)
}

## Apply recent changes to the release vesion
patch_file <- file.path(proj_dir, "data-raw", "aff561a3.patch")
if (!file.exists(file.path(work_dir, ".patched"))) {
    setwd(work_dir)
    system2("patch", c("-p1", "<", patch_file))
    setwd(proj_dir)
    write("TRUE", file.path(work_dir, ".patched"))
}
c(paste0("# Patches applied to dplace-data ", dplace_rev,
         " in this package\n"),
  "```diff",
  read_file(patch_file),
  "```"
  ) %>%
    c(list(sep = "\n")) %>%
    do.call(paste, .) %>%
    write(file = "NOTES.md")

societies <- read_csv(file.path(wnai_dir, "societies.csv"),
                      col_types = cols(.default        = col_character(),
                                       main_focal_year = col_integer(),
                                       origLat         = col_double(),
                                       origLong        = col_double(),
                                       Lat             = col_double(),
                                       Long            = col_double())
                      ) %>%
    dplyr::select(id,
                  pref_name_for_society,
                  alt_names_by_society,
                  glottocode,
                  Lat,
                  Long) %>%
    dplyr::rename(name = pref_name_for_society,
                  alt_names = alt_names_by_society,
                  latitude = Lat,
                  longitude = Long)

use_data(societies, overwrite = TRUE)

variables <- read_csv(file.path(wnai_dir, "variables.csv"),
                      col_types = cols(.default = col_character(),
                                       type = col_factor())
                      ) %>%
    dplyr::select(id,
                  title,
                  type,
                  category,
                  definition,
                  notes) %>%
    dplyr::rename(name = title,
                  categories = category) %>%
    dplyr::mutate(type = forcats::fct_relabel(type,
        ~ ifelse(. == "Categorical", "cat",
          ifelse(. == "Ordinal", "ord",
          ifelse(. == "Continuous", "cont", NA)))))

## Export errata
variables %>%
    dplyr::filter(!is.na(notes)) %>%
    dplyr::select(id, notes) %>%
    purrr::transpose() %>%
    purrr::map(~ paste0("- ", .$id, ": ",
                        stringr::str_remove(.$notes, "NOTE: +"))) %>%
    purrr::map(~ stringr::str_wrap(., width = 78, exdent = 2)) %>%
    c(paste0("\n# Errata for variables in dplace-data ", dplace_rev, "\n"), .,
      list(sep = "\n")) %>%
    do.call(paste, .) %>%
    write(file = "NOTES.md", append = TRUE)

variables %>% dplyr::select(-notes) -> variables

use_data(variables, overwrite = TRUE)

data_ <- read_csv(file.path(wnai_dir, "data.csv"),
                  col_types = cols(.default = col_character(),
                                   year = col_integer(),
                                   code = col_integer())
                  ) %>%
    dplyr::select(soc_id,
                  var_id,
                  code)
data <- foreach(i = societies[["id"]], .combine = rbind) %:%
    foreach(j = variables[["id"]], .combine = c) %dopar% {
        dplyr::filter(data_, soc_id == i, var_id == j)[["code"]]
    }
colnames(data) <- variables[["id"]]
data <- as_tibble(data)
for (i in seq.int(nrow(variables))) {
    var_id <- variables[["id"]][i]
    type <- variables[["type"]][i]
    data[[var_id]] <- switch(as.character(type),
                             cat = as.factor(data[[var_id]]),
                             ord = as.ordered(data[[var_id]]),
                             cont = as.integer(data[[var_id]]))
}
data <- dplyr::bind_cols(tibble(soc_id = societies[["id"]]), data)

use_data(data, overwrite = TRUE)

codes <- read_csv(file.path(wnai_dir, "codes.csv"),
                      col_types = cols(.default = col_character(),
                                       code = col_integer())
                      ) %>%
    dplyr::select(var_id, code, name, description) %>%
    tidyr::drop_na(code) %>%
    dplyr::group_by(var_id) %>%
    tidyr::nest(.key = "codes")
for (i in seq.int(nrow(codes))) {
    var_id <- codes[["var_id"]][i]
    type <- variables[["type"]][i]
    codes[["codes"]][[i]][["code"]] <- switch(as.character(type),
        cat = as.factor(codes[["codes"]][[i]][["code"]]),
        ord = as.ordered(codes[["codes"]][[i]][["code"]]),
        cont = as.integer(codes[["codes"]][[i]][["code"]]))
}

use_data(codes, overwrite = TRUE)

read_file("R/rev.R") %>%
    stringr::str_replace("^dplace_rev <- .+$",
                         paste0("dplace_rev <- \"", dplace_rev, "\"")) %>%
    stringr::str_trim() %>%
    write(file = "R/rev.R")
