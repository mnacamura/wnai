version <- "v2.0.1"

#' Societies in the WNAI dataset.
#'
#' @usage wnai::societies
#' @format A data frame with 172 societies (rows) and 6 variables (columns):
#' \describe{
#'     \item{`id`}{D-PLACE-wide id for the society}
#'     \item{`name`}{name of the society}
#'     \item{`alt_names`}{alternative names of the society (comma separated)}
#'     \item{`glottocode`}{code of the most specific Glottolog languoid for
#'         the society}
#'     \item{`latitude`}{location of the society in latitude}
#'     \item{`longitude`}{location of the society in longitude}
#' }
#' @source
#' Jorgensen, J. G. (1980) _Western Indians: Comparative Environments,
#' Languages and Cultures of 172 Western American Indian Tribes_. W. H.
#' Freeman.
#'
#' Jorgensen, J. G. (1999) Codebook for Western Indians data. _World Cultures_
#' 10(2): 144-293.
#'
#' The dataset in D-PLACE is imported from _World Cultures_ CD-ROM (2011)
#' using codes described in Jorgensen (1999).
"societies"

#' Variables in the WNAI dataset.
#'
#' @usage wnai::variables
#' @format A data frame with 429 variables (rows) and 5 attributes (columns):
#' \describe{
#'     \item{`id`}{D-PLACE-wide id for the variable}
#'     \item{`name`}{name of the variable}
#'     \item{`type`}{type of the variable, either `cat`egorical, `ord`inal, or
#'         `cont`inuous}
#'     \item{`categories`}{categories that can be assigned to the variable
#'         (comma separated)}
#'     \item{`definitions`}{definitions of terms used in the `name` column}
#' }
#' @source
#' Jorgensen, J. G. (1980) _Western Indians: Comparative Environments,
#' Languages and Cultures of 172 Western American Indian Tribes_. W. H.
#' Freeman.
#'
#' Jorgensen, J. G. (1999) Codebook for Western Indians data. _World Cultures_
#' 10(2): 144-293.
#'
#' The dataset in D-PLACE is imported from _World Cultures_ CD-ROM (2011)
#' using codes described in Jorgensen (1999).
"variables"

#' Codes for each variable in the WNAI dataset.
#'
#' @usage wnai::codes
#' @format A nested data frame with 429 pairs of variable id and codes (rows):
#' \describe{
#'     \item{`var_id`}{D-PLACE-wide id for the variable}
#'     \item{`codes`}{codes used in the variable:
#'         \describe{
#'             \item{`code`}{code in the variable}
#'             \item{`name`}{short description of the code}
#'             \item{`description`}{longer description of the code}
#'         }}
#' }
#' @source
#' Jorgensen, J. G. (1980) _Western Indians: Comparative Environments,
#' Languages and Cultures of 172 Western American Indian Tribes_. W. H.
#' Freeman.
#'
#' Jorgensen, J. G. (1999) Codebook for Western Indians data. _World Cultures_
#' 10(2): 144-293.
#'
#' The dataset in D-PLACE is imported from _World Cultures_ CD-ROM (2011)
#' using codes described in Jorgensen (1999).
"codes"

#' Main data of the WNAI dataset.
#'
#' @usage wnai::data
#' @format A data frame with 172 societies (rows) and 430 variables (columns):
#' \describe{
#'     \item{`soc_id`}{D-PLACE-wide id for the society}
#'     \item{`WNAI8..WNAI438`}{values of 429 variables for the society}
#' }
#' @source
#' Jorgensen, J. G. (1980) _Western Indians: Comparative Environments,
#' Languages and Cultures of 172 Western American Indian Tribes_. W. H.
#' Freeman.
#'
#' Jorgensen, J. G. (1999) Codebook for Western Indians data. _World Cultures_
#' 10(2): 144-293.
#'
#' The dataset in D-PLACE is imported from _World Cultures_ CD-ROM (2011)
#' using codes described in Jorgensen (1999).
"data"
