
<!-- README.md is generated from README.Rmd. Please edit that file -->

# DFOsamplestats

<!-- badges: start -->

[![R-CMD-check](https://github.com/poissonconsulting/DFOsamplestats/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/poissonconsulting/DFOsamplestats/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of DFOsamplestats is to provide functions to facilitate power
analyses for return rates.

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

`DFOsamplestats` also provides a function to perform a full power
analysis.

``` r
set.seed(100)
rate2_power_analysis(p1 = 0.005, p2 = 0.0075, n = 31197)
#> [1] 0.8
```

### Bayesian

Finally `DFOsamplestats` provide `rate_effect_bayesian()` and
`rate2_power_analysis_bayesian()` to estimate effect sizes and power
incorporating prior information.

``` r
set.seed(100)
rate_effect_bayesian(r = 1, n = 10, alpha = 5, beta = 5)
#> Registered S3 method overwritten by 'mcmcr':
#>   method               from 
#>   as.mcmc.list.mcarray rjags
#>   group r  n alpha beta estimate     lower     upper     pvalue
#> 1     1 1 10     5    5 0.294849 0.1278991 0.5086098 0.06363121
rate2_power_analysis(p1 = 0.005, p2 = 0.0075, n = 31197, nsims = 100)
#> [1] 0.77
```

### Heuristics

It is worth noting that `rate2_power()`, which is a wrapper on
`stats::power.prop.test()`, uses a heuristic to calculate the power. As
a result it is quicker but less reliable at small sample sizes than
`rate2_power_analysis()` which performs a full power analysis. However,
`rate2_power_analysis()` still assumes that the likelihood profile is
normally distributed which is typically not the case with little data at
very low or high rates. For the most reliable estimate use
`rate2_power_analysis_bayesian()` with `nsims = 1000`.

``` r
set.seed(100)
rate_effect(0, 5)
#> # A tibble: 1 × 7
#>   group     r     n estimate lower upper pvalue
#>   <fct> <int> <int>    <dbl> <dbl> <dbl>  <dbl>
#> 1 1         0     5 2.21e-11     0     1   1.00
rate_effect_bayesian(0, 5)
#>   group r n alpha beta  estimate       lower     upper     pvalue
#> 1     1 0 5     1    1 0.1075121 0.004024161 0.4667683 0.03583214

rate2_power(0.1, 5)
#> [1] 0.3877521
rate2_power_analysis(0.1, 5)
#> [1] 0
rate2_power_analysis_bayesian(0.1, 5, nsims = 100)
#> [1] 0.66
```

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/DFOsamplestats/issues).

[Pull
requests](https://github.com/poissonconsulting/DFOsamplestats/pulls) are
always welcome.
