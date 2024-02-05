
<!-- README.md is generated from README.Rmd. Please edit that file -->

# DFOsamplestats

<!-- badges: start -->

[![R-CMD-check](https://github.com/poissonconsulting/DFOsamplestats/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/poissonconsulting/DFOsamplestats/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/poissonconsulting/DFOsamplestats/branch/main/graph/badge.svg)](https://app.codecov.io/gh/poissonconsulting/DFOsamplestats?branch=main)
<!-- badges: end -->

The goal of DFOsamplestats is to …

## Installation

`DFOsamplestats` can be installed from GitHub using the remotes package:

``` r
install.packages("remotes")
remotes::install_github("poissonconsulting/DFOsamplestats")
```

## Usage

`DFOsamplestats` provides functions to calculate the power (at a
significance level of 0.05) or sample size to achieve a power of 0.8 at
a significance level of 0.05 using `stats::power.prop.test()`. It is
important to note that `n` is the total number of samples in the study
(not the number of samples in each group).

``` r
library(DFOsamplestats)
prop2_power(0.1, n = 10)
#> [1] 0.8288838
prop2_samplesize(0.1)
#> [1] 10
```

`DFOsamplestats` also provides functions to calculate the p-value and
95% confidence intervals based on the number of samples appearing in
each group.

``` r
prop2_pvalue(1, 9)
#> [1] 0.02148438
prop2_ci(1, 9)
#> # A tibble: 1 × 4
#>   term   estimate   lower upper
#>   <term>    <dbl>   <dbl> <dbl>
#> 1 p[1]        0.1 0.00253 0.445
```

`DFOsamplestats` also provides a function to simulate data.

``` r
set.seed(42)
prop2_sim(0.1, 10)
#> [1] 2 8
set.seed(42)
prop2_sim(0.1, 10)
#> [1] 2 8
prop2_sim(0.1, 10)
#> [1] 3 7
```

which is called internally by a function which performs a full power
analysis.

``` r
prop2_power_analysis(0.1, 10)
#> [1] 0.741
```

It is worth noting that the power estimated by
`prop2_power_analysis(0.1, 10)` is slightly less than that estimated by
`prop2_power(0.1, 10)`. This is because `prop2_power()` uses a
heuristic. To understand why `prop2_power()` is less reliable at small
sample sizes consider the fact that it is not possible to get a
significant result with just 5 samples.

``` r
prop2_pvalue(0, 5)
#> [1] 0.0625
prop2_power(0.1, 5)
#> [1] 0.3877521
prop2_power_analysis(0.1, 5)
#> [1] 0
```

This is because

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/DFOsamplestats/issues).

[Pull
requests](https://github.com/poissonconsulting/DFOsamplestats/pulls) are
always welcome.
