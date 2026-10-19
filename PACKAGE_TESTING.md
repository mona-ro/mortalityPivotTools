# Package Testing Guide

This guide explains how to test the `mortalityPivotTools` package after installing it from GitHub.

## 1. Install the package

```r
devtools::install_github("mona-ro/mortalityPivotTools")
```

**Checks:** Whether the package can be installed from GitHub.

## 2. Load the package

```r
library(mortalityPivotTools)
```

**Checks:** Whether the installed package loads without errors.

## 3. Load the example dataset

```r
data("maternal_mortality")
head(maternal_mortality)
str(maternal_mortality)
```

**Checks:** Whether the example dataset is included and accessible.

## 4. Test the main function

```r
result <- prepare_world_bank_mortality_data(
  maternal_mortality,
  "maternal_mortality"
)

head(result)
```

**Checks:** Whether the function converts the data from wide format to long format, with country codes, years, and mortality values.

## 5. Check the output columns

```r
names(result)

stopifnot(
  all(c("iso", "year", "maternal_mortality") %in%
        names(result))
)
```

**Checks:** Whether the expected output columns are present.

## 6. Check the year data type

```r
is.numeric(result$year)
```

**Checks:** Whether years are stored as numeric values.

Expected result: `TRUE`.

## 7. Check the number of rows

```r
expected_rows <- nrow(maternal_mortality) *
  sum(grepl("^X", names(maternal_mortality)))

nrow(result)
expected_rows

stopifnot(nrow(result) == expected_rows)
```

**Checks:** Whether every original country-year entry is represented in the long-format output, including entries with missing values.

## 8. Test a custom output column name

```r
result2 <- prepare_world_bank_mortality_data(
  maternal_mortality,
  "mmr"
)

names(result2)
head(result2)

stopifnot("mmr" %in% names(result2))
```

**Checks:** Whether users can specify their own output column name.

## 9. Check missing values

```r
sum(is.na(result$maternal_mortality))
```

**Checks:** Whether missing mortality observations remain represented after reshaping.

For the included dataset, the observed result was 426 missing values.

## 10. Check the documentation

```r
?prepare_world_bank_mortality_data
?maternal_mortality
```

**Checks:** Whether users can access the function and dataset help pages.

## 11. Run the automated package tests

```r
devtools::test()
```

**Checks:** Whether the package's included automated tests pass.

## Review summary

During testing, record whether installation, dataset access, data conversion, custom column naming, documentation, and automated tests work as expected. Document any errors or suggestions for improvement.