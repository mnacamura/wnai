library(magrittr)
library(readr)
library(tibble)
library(usethis)

dplace_rev <- Sys.getenv("DPLACE_REV")
if (dplace_rev == "")
    stop("environment variable DPLACE_REV is not set")

proj_dir <- getwd()
work_dir <- tempdir()
wnai_dir <- file.path(work_dir, "datasets", "WNAI")
if (!dir.exists(wnai_dir))
  dir.create(wnai_dir, recursive = TRUE)

local({
    base_url <- paste("https://raw.githubusercontent.com/D-PLACE/dplace-data",
                      dplace_rev, "datasets/WNAI", sep = "/")
    for (file_name in paste(c("societies", "variables", "codes", "data"),
                            "csv", sep = ".")) {
        path <- file.path(wnai_dir, file_name)
        if (!file.exists(path))
            download.file(paste(base_url, file_name, sep = "/"), path)
    }
})

## Apply recent changes to the release vesion
patch_file <- "aff561a3.patch"
setwd(work_dir)
system2("patch", c("-p1", "<", file.path(proj_dir, "data-raw", patch_file)))
setwd(proj_dir)
c(paste0("# Changes made in this package (from dplace-data ", dplace_rev, ")\n"),
  "```diff",
  read_file(file.path("data-raw", patch_file)),
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
        dplyr::mutate(type = forcats::fct_relabel(type,
            ~ ifelse(. == "Categorical", "cat",
              ifelse(. == "Ordinal", "ord",
              ifelse(. == "Continuous", "cont", NA))))) %>%
        dplyr::rename(categories = category)

## Export errata
variables %>%
    dplyr::filter(!is.na(notes)) %>%
    dplyr::select(id, notes) %>%
    purrr::transpose() %>%
    purrr::map(~ paste0("- ", .$id, ": ",
                        stringr::str_remove(.$notes, "NOTE: +"))) %>%
    purrr::map(~ stringr::str_wrap(., width = 78, exdent = 2)) %>%
    c(paste0("\n# Errata (fixed in dplace-data ", dplace_rev, ")\n"), .,
      list(sep = "\n")) %>%
    do.call(paste, .) %>%
    write(file = "NOTES.md", append = TRUE)

variables %>% dplyr::select(-notes) -> variables

use_data(variables, overwrite = TRUE)
