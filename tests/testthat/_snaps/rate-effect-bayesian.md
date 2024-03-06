# rate_effect_bayesian works

    Code
      rate_effect_bayesian(r = integer(0), n = integer(0))
    Output
      # A tibble: 0 x 9
      # i 9 variables: group <fct>, r <int>, n <int>, alpha <dbl>, beta <dbl>,
      #   estimate <dbl>, lower <dbl>, upper <dbl>, pvalue <dbl>
    Code
      rate_effect_bayesian(r = 5, n = 10)
    Output
        group r  n alpha beta  estimate     lower     upper       pvalue
      1     1 5 10     1    1 0.4994782 0.2349923 0.7665628 3.333222e-05
    Code
      rate_effect_bayesian(r = c(3, 7), n = 20)
    Output
        group r  n alpha beta  estimate     lower     upper       pvalue
      1     1 3 10     1    1 0.3213334 0.1116669 0.6028889 3.333222e-05
      2     2 7 10     1    1 0.6740573 0.3870648 0.8886976 8.263058e-02
    Code
      rate_effect_bayesian(r = c(3, 7), n = c(20, 20))
    Output
        group r  n alpha beta  estimate      lower     upper       pvalue
      1     1 3 20     1    1 0.1725455 0.05350587 0.3584684 3.333222e-05
      2     2 7 20     1    1 0.3624148 0.18164472 0.5732216 1.502283e-01
    Code
      rate_effect_bayesian(c(1, 9), c(10, 10))
    Output
        group r  n alpha beta  estimate      lower     upper       pvalue
      1     1 1 10     1    1 0.1483582 0.02420723 0.4155067 3.333222e-05
      2     2 9 10     1    1 0.8499231 0.58735841 0.9768900 1.033299e-03
    Code
      rate_effect_bayesian(c(1, 9), 20)
    Output
        group r  n alpha beta  estimate      lower     upper       pvalue
      1     1 1 10     1    1 0.1479366 0.02282342 0.4095706 3.333222e-05
      2     2 9 10     1    1 0.8519098 0.58245234 0.9775477 8.333056e-04
    Code
      rate_effect_bayesian(c(1, 9), 40)
    Output
        group r  n alpha beta  estimate      lower     upper       pvalue
      1     1 1 20     1    1 0.0774555 0.01266531 0.2332262 3.333222e-05
      2     2 9 20     1    1 0.4501042 0.25672387 0.6615299 3.233226e-03
    Code
      rate_effect_bayesian(9, 10)
    Output
        group r  n alpha beta  estimate     lower     upper       pvalue
      1     1 9 10     1    1 0.8489855 0.5761052 0.9783689 3.333222e-05
    Code
      rate_effect_bayesian(9, 10, alternative = "greater")
    Output
        group r  n alpha beta  estimate     lower     upper       pvalue
      1     1 9 10     1    1 0.8543252 0.6053509 0.9766392 1.666611e-05
    Code
      rate_effect_bayesian(9, 10, alternative = "less")
    Output
        group r  n alpha beta  estimate     lower     upper pvalue
      1     1 9 10     1    1 0.8538202 0.5928915 0.9779913      1
    Code
      rate_effect_bayesian(r = c(3, 7), n = c(20, 20), alternative = "greater")
    Output
        group r  n alpha beta  estimate      lower     upper     pvalue
      1     1 3 20     1    1 0.1734443 0.05348113 0.3657620 1.00000000
      2     2 7 20     1    1 0.3596481 0.17946683 0.5706431 0.07751408
    Code
      rate_effect_bayesian(r = c(3, 7), n = c(20, 20), alternative = "less")
    Output
        group r  n alpha beta  estimate      lower     upper       pvalue
      1     1 3 20     1    1 0.1722781 0.05450717 0.3640557 1.666611e-05
      2     2 7 20     1    1 0.3581266 0.17872386 0.5604080 1.000000e+00
    Code
      rate_effect_bayesian(r = c(25, 35), n = c(100, 100), alternative = "greater")
    Output
        group  r   n alpha beta  estimate     lower     upper    pvalue
      1     1 25 100     1    1 0.2531104 0.1758473 0.3440845 1.0000000
      2     2 35 100     1    1 0.3511818 0.2632033 0.4509153 0.0651145
    Code
      rate_effect_bayesian(r = c(25, 35), n = c(100, 100), alternative = "less")
    Output
        group  r   n alpha beta  estimate     lower     upper       pvalue
      1     1 25 100     1    1 0.2531149 0.1752183 0.3442989 1.666611e-05
      2     2 35 100     1    1 0.3510046 0.2633201 0.4460307 1.000000e+00

# rate_effect_bayesian prior

    Code
      rate_effect_bayesian(1, 10, alpha = 10, beta = 2)
    Output
        group r  n alpha beta  estimate    lower    upper       pvalue
      1     1 1 10    10    2 0.5019055 0.295641 0.702916 3.333222e-05
    Code
      rate_effect_bayesian(10, 20)
    Output
        group  r  n alpha beta  estimate     lower     upper       pvalue
      1     1 10 20     1    1 0.4970124 0.2930054 0.7019452 3.333222e-05
    Code
      rate_effect_bayesian(NA_integer_, 10)
    Output
        group  r  n alpha beta estimate      lower     upper       pvalue
      1     1 NA 10     1    1 0.510529 0.02721977 0.9751937 3.333222e-05
    Code
      rate_effect_bayesian(NA_integer_, 1, alpha = 100, beta = 1)
    Output
        group  r n alpha beta  estimate     lower     upper       pvalue
      1     1 NA 1   100    1 0.9930632 0.9648527 0.9997409 3.333222e-05
    Code
      rate_effect_bayesian(NA_integer_, 1, alpha = 100, beta = 1, alternative = "greater")
    Output
        group  r n alpha beta  estimate     lower     upper       pvalue
      1     1 NA 1   100    1 0.9930173 0.9634937 0.9997548 1.666611e-05
    Code
      rate_effect_bayesian(NA_integer_, 1, alpha = 100, beta = 1, alternative = "less")
    Output
        group  r n alpha beta  estimate     lower    upper pvalue
      1     1 NA 1   100    1 0.9928711 0.9636971 0.999738      1
    Code
      rate_effect_bayesian(c(NA_integer_, NA), 1, alpha = c(2, 10), beta = c(10, 2))
    Output
        group  r n alpha beta  estimate      lower     upper       pvalue
      1     1 NA 0     2   10 0.1488431 0.02237816 0.4137401 3.333222e-05
      2     2 NA 0    10    2 0.8522715 0.58237166 0.9778634 2.333256e-04
    Code
      rate_effect_bayesian(c(1, 9), c(10, 10), 1)
    Output
        group r  n alpha beta  estimate      lower     upper       pvalue
      1     1 1 10     1    1 0.1500490 0.02309352 0.4216434 3.333222e-05
      2     2 9 10     1    1 0.8539097 0.58129816 0.9764429 4.333189e-04

