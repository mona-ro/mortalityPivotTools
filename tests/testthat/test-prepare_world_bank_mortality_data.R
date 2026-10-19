library(testthat)
library(mortalityPivotTools)

test_that("prepare_world_bank_mortality_data returns the expected columns", {
  result <- prepare_world_bank_mortality_data(
    maternal_mortality,
    "maternal_mortality"
  )

  expect_true(all(c("iso", "year", "maternal_mortality") %in% names(result)))
  expect_true(is.numeric(result$year))
  expect_equal(
    nrow(result),
    nrow(maternal_mortality) * sum(grepl("^X", names(maternal_mortality)))
  )
})