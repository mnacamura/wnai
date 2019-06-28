#' Societies in the WNAI dataset.
#'
#' @format A data frame with 172 societies (rows) and 5 variables (columns):
#' \describe{
#'     \item{id}{D-PLACE-wide unique identifier for the society}
#'     \item{name}{Name of the society}
#'     \item{glottocode}{Code for the most specific Glottolog languoid which
#'         can be assigned to this society}
#'     \item{latitude}{location of the society}
#'     \item{longitude}{location of the society}
#' }
#' @source
#' Jorgensen, J. G. (1980) _Western Indians: Comparative Environments,
#' Languages and Cultures of 172 Western American Indian Tribes_. W. H.
#' Freeman. 
#' Jorgensen, J. G. (1999) Codebook for Western Indians data. _World Cultures_
#' 10(2): 144-293. 
#' The dataset in D-PLACE is imported from _World Cultures_ CD-ROM (2011)
#' using codes described in Jorgensen (1999).
"societies"
