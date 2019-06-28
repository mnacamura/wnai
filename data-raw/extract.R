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
setwd(work_dir)
system2("patch", c("-p1", "<", file.path(proj_dir, "data-raw", "aff561a3.patch")))
setwd(proj_dir)

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
