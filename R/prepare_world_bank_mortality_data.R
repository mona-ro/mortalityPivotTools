#' Prepare World Bank Mortality Data
#'
#' Converts World Bank mortality data from wide format to long format.
#' The input data should contain an `iso` column and year columns
#' beginning with "X", such as X2000 and X2001.
#'
#' @param data A data frame containing country codes and mortality data
#' in wide format.
#' @param mortality_variable_name A character string giving the name
#' for the output mortality column.
#'
#' @return A data frame containing `iso`, `year`, and the specified
#' mortality variable.
#'
#' @examples
#' prepare_world_bank_mortality_data(
#'   maternal_mortality,
#'   "maternal_mortality"
#' )
#'
#' @export
prepare_world_bank_mortality_data <- function(data, mortality_variable_name) {
  data |>
    tidyr::pivot_longer(
      cols = dplyr::starts_with("X"),
      names_to = "year",
      names_prefix = "X",
      values_to = mortality_variable_name
    ) |>
    dplyr::mutate(year = as.numeric(year)) |>
    dplyr::select(iso, year, dplyr::all_of(mortality_variable_name))
}