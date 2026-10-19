# mortalityPivotTools

## Overview

`mortalityPivotTools` is an R package that converts World Bank mortality data from wide format to long format for easier data analysis.

The package includes an example dataset, `maternal_mortality`, and the function `prepare_world_bank_mortality_data()`.

## Installation

You can install the package from GitHub using:

```r
devtools::install_github("mona-ro/mortalityPivotTools")
```

## Example

```r
library(mortalityPivotTools)

# Convert maternal mortality data from wide to long format
long_data <- prepare_world_bank_mortality_data(
  maternal_mortality,
  "maternal_mortality"
)

head(long_data)
```

The output contains three columns:

* `iso`: Country code
* `year`: Year of observation
* `maternal_mortality`: Maternal mortality value

## Example dataset

The package includes `maternal_mortality`, an example dataset containing country codes and year-specific maternal mortality data.
