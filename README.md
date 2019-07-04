# wnai — R package of the WNAI ethnological dataset

The Western North American Indian dataset compiled by Jorgensen (1980, 1999),
extracted from [the D-PLACE data repository](https://github.com/D-PLACE/dplace-data).

This package is based on dplace-data, version v2.0.1.

For details of error corrections made in dplace-data v2.0.1 and made in this
package since dplace-data v2.0.1, see [NOTES.md](NOTES.md).

## Installation

You can install the development version of wnai from
[GitHub](https://github.com/mnacamura/wnai) with:

``` r
devtools::install_github("mnacamura/wnai")
```

## Data description

### `wnai::societies`

- Source: https://github.com/D-PLACE/dplace-data/tree/v2.0.1/datasets/WNAI/societies.csv
- Only the following columns are selected (and renamed). 

| Column name  | Original column name in D-PLACE | Description                                                                         |
| ------------ | ------------------------------- | ----------------------------------------------------------------------------------- |
| `id`         | `id`                            | D-PLACE-wide id for the society                                                     |
| `name`       | `pref_name_for_society`         | name of the society                                                                 |
| `alt_names`  | `alt_names_by_society`          | alternative names of the society                                                    |
| `glottocode` | `glottocode`                    | code for the most specific Glottolog languoid which can be assigned to this society |
| `latitude`   | `Lat`                           | location of the society in latitude                                                 |
| `longitude`  | `Long`                          | location of the society in longitude                                                |

### `wnai::variables`

- Source: https://github.com/D-PLACE/dplace-data/tree/v2.0.1/datasets/WNAI/variables.csv
- Only the following columns are selected (and renamed). 

| Column name   | Original column name in D-PLACE | Description                                                     |
| ------------- | ------------------------------- | --------------------------------------------------------------- |
| `id`          | `id`                            | D-PLACE-wide id for the variable                                |
| `name`        | `title`                         | name of the variable                                            |
| `type`        | `type`                          | type of the variable: `cat`egorical, `ord`inal, or `cont`inuous |
| `categories`  | `category`                      | categories assigned to the variable (comma separated)           |
| `definitions` | `definition`                    | definitions of terms used in the `name` column                  |

### `wnai::codes`

- Source: https://github.com/D-PLACE/dplace-data/tree/v2.0.1/datasets/WNAI/codes.csv
- This is a nested data frame for each variable's codes.
- Only the following columns are selected (and renamed). 

| Column name         | Original column name in D-PLACE | Description                                |
| ------------------- | ------------------------------- | ------------------------------------------ |
| `var_id`            | `var_id`                        | D-PLACE-wide id for the variable           |
| `codes`             |                                 | a data frame of codes used in the variable |
| `codes.code`        | `code`                          | code in the variable                       |
| `codes.name`        | `name`                          | short description of the code              |
| `codes.description` | `description`                   | longer description of the code             |

### `wnai::data`

- Source: https://github.com/D-PLACE/dplace-data/tree/v2.0.1/datasets/WNAI/data.csv
- Transshaped the original data to a matrix form of societies x variables.
- Only the following columns are selected (and renamed). 

| Column name         | Original column name in D-PLACE | Description                             |
| ------------------- | ------------------------------- | --------------------------------------- |
| `soc_id`            | `soc_id`                        | D-PLACE-wide id for the society         |
| `WNAI8`..`WNAI438`  |                                 | values of 429 variables for the society |

## References

1. Jorgensen, J. G. (1980) _Western Indians: Comparative Environments, Languages and Cultures of 172 Western American Indian Tribes_. W. H. Freeman.
2. Jorgensen, J. G. (1999) Codebook for Western Indians data. _World Cultures_ 10: 144–293.
3. Kirby, K. R., Gray, R. D., Greenhill, S. J., Jordan, F. M., Gomes-Ng, S., Bibiko, H.-J., Blasi, D. E., Botero, C. A., Bowern, C., Ember, C. R., Leehr, D., Low, B. S., McCarter, J., Divale, W., Gavin, M. C. (2018) _D-PLACE/dplace-data: D-PLACE – the Database of Places, Language, Culture and Environment (Version v2.0.1) [Data set]_. Zenodo. http://doi.org/10.5281/zenodo.1466634.
