#' Societies in the WNAI dataset.
#'
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
#' @format A data frame with 429 variables (rows) and 5 attributes (columns):
#' \describe{
#'     \item{`id`}{D-PLACE-wide id for the variable}
#'     \item{`title`}{title of the variable}
#'     \item{`type`}{type of the variable, either `cat`egorical, `ord`inal, or
#'         `cont`inuous}
#'     \item{`categories`}{categories that can be assigned to the variable
#'         (comma separated)}
#'     \item{`definitions`}{definitions of terms used in the `title`}
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
