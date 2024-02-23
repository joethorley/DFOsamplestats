
<!-- README.md is generated from README.Rmd. Please edit that file -->

# DFOsamplestats

<!-- badges: start -->

[![R-CMD-check](https://github.com/poissonconsulting/DFOsamplestats/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/poissonconsulting/DFOsamplestats/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of DFOsamplestats is to provide functions to facilitate
frequentist power analyses for return rates.

## Installation

`DFOsamplestats` can be installed from GitHub using the pak package:

``` r
install.packages("pak")
pak::pak("poissonconsulting/DFOsamplestats")
```

## Usage

`DFOsamplestats` provides functions to calculate the power (at a
significance level of 0.05) and sample size to achieve a power of 0.8
for the difference in the rate between two groups.

``` r
library(DFOsamplestats)
rate2_power(p1 = 0.005, p2 = 0.0075, n = 31197)
#> [1] 0.8000008
rate2_samplesize(p1 = 0.005, p2 = 0.0075)
#> [1] 31197
```

`DFOsamplestats` also provides functions to estimate the effect size and
p-values based on the number of individuals returning in each group
given the number tagged.

``` r
rate_effect(r = c(156,  234), n = 31197)
#> # A tibble: 2 × 7
#>   group     r     n estimate   lower  upper    pvalue
#>   <fct> <int> <int>    <dbl>   <dbl>  <dbl>     <dbl>
#> 1 1       156 15598   0.0100 0.00855 0.0117 0        
#> 2 2       234 15598   0.0150 0.0132  0.0170 0.0000789
```

And to simulate data

``` r
set.seed(99)
rate_sim(p = c(0.005, 0.0075), n = 31197)
#> # A tibble: 2 × 4
#>   group      p     n     r
#>   <fct>  <dbl> <dbl> <int>
#> 1 1     0.005  15598    69
#> 2 2     0.0075 15598   115
rate_sim(p = c(0.005, 0.0075), n = 31197)
#> # A tibble: 2 × 4
#>   group      p     n     r
#>   <fct>  <dbl> <dbl> <int>
#> 1 1     0.005  15598    85
#> 2 2     0.0075 15598   125
```

Finally `DFOsamplestats` provides a function to perform a full power
analysis.

``` r
set.seed(100)
rate2_power_analysis(p1 = 0.005, p2 = 0.0075, n = 31197)
#> [1] 0.8
```

It is worth noting that `rate2_power()`, which is a wrapper on
`stats::power.prop.test()`, uses a heuristic to calculate the power. As
a result it is quicker but less reliable at small sample sizes than
`rate2_power_analysis()` which performs a full power analysis (although
calculation of the p-values still assumes that the likelihood profile is
normally distributed).

To understand why `rate2_power()` is unreliable at small sample sizes
consider the fact that it is not possible to get a significant result
with just 5 samples yet it estimates the power to be 0.39 with 5 samples
and a rate of 0.1!

``` r
rate_effect(0, 5)
#> # A tibble: 1 × 7
#>   group     r     n estimate lower upper pvalue
#>   <fct> <int> <int>    <dbl> <dbl> <dbl>  <dbl>
#> 1 1         0     5 2.21e-11     0     1   1.00
rate2_power(0.1, 5)
#> [1] 0.3877521
rate2_power_analysis(0.1, 5)
#> [1] 0
```

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/DFOsamplestats/issues).

[Pull
requests](https://github.com/poissonconsulting/DFOsamplestats/pulls) are
always welcome.
