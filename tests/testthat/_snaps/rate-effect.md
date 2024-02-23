# rate_ci works

    Code
      rate_effect(r = integer(0), n = integer(0))
    Output
      # A tibble: 0 x 7
      # i 7 variables: group <fct>, r <int>, n <int>, estimate <dbl>, lower <dbl>,
      #   upper <dbl>, pvalue <dbl>
    Code
      rate_effect(r = 5, n = 10)
    Output
      # A tibble: 1 x 7
        group     r     n estimate lower upper pvalue
        <fct> <int> <int>    <dbl> <dbl> <dbl>  <dbl>
      1 1         5    10      0.5 0.225 0.775      1
    Code
      rate_effect(r = c(3, 7), n = 20)
    Output
      # A tibble: 2 x 7
        group     r     n estimate  lower upper pvalue
        <fct> <int> <int>    <dbl>  <dbl> <dbl>  <dbl>
      1 1         3    10    0.300 0.0998 0.624 0.220 
      2 2         7    10    0.700 0.376  0.900 0.0825
    Code
      rate_effect(r = c(3, 7), n = c(20, 20))
    Output
      # A tibble: 2 x 7
        group     r     n estimate  lower upper  pvalue
        <fct> <int> <int>    <dbl>  <dbl> <dbl>   <dbl>
      1 1         3    20    0.150 0.0492 0.376 0.00561
      2 2         7    20    0.35  0.177  0.574 0.154  
    Code
      rate_effect(c(1, 9), c(10, 10))
    Output
      # A tibble: 2 x 7
        group     r     n estimate  lower upper  pvalue
        <fct> <int> <int>    <dbl>  <dbl> <dbl>   <dbl>
      1 1         1    10    0.100 0.0139 0.467 0.0371 
      2 2         9    10    0.900 0.533  0.986 0.00320
    Code
      rate_effect(c(1, 9), 20)
    Output
      # A tibble: 2 x 7
        group     r     n estimate  lower upper  pvalue
        <fct> <int> <int>    <dbl>  <dbl> <dbl>   <dbl>
      1 1         1    10    0.100 0.0139 0.467 0.0371 
      2 2         9    10    0.900 0.533  0.986 0.00320
    Code
      rate_effect(c(1, 9), 40)
    Output
      # A tibble: 2 x 7
        group     r     n estimate   lower upper  pvalue
        <fct> <int> <int>    <dbl>   <dbl> <dbl>   <dbl>
      1 1         1    20   0.0500 0.00700 0.282 0.00411
      2 2         9    20   0.45   0.253   0.664 0.0143 
    Code
      rate_effect(9, 10)
    Output
      # A tibble: 1 x 7
        group     r     n estimate lower upper pvalue
        <fct> <int> <int>    <dbl> <dbl> <dbl>  <dbl>
      1 1         9    10    0.900 0.533 0.986 0.0371
    Code
      rate_effect(9, 10, alternative = "greater")
    Output
      # A tibble: 1 x 7
        group     r     n estimate lower upper pvalue
        <fct> <int> <int>    <dbl> <dbl> <dbl>  <dbl>
      1 1         9    10    0.900 0.533 0.986 0.0186
    Code
      rate_effect(9, 10, alternative = "less")
    Output
      # A tibble: 1 x 7
        group     r     n estimate lower upper pvalue
        <fct> <int> <int>    <dbl> <dbl> <dbl>  <dbl>
      1 1         9    10    0.900 0.533 0.986      1
    Code
      rate_effect(r = c(3, 7), n = c(20, 20), alternative = "greater")
    Output
      # A tibble: 2 x 7
        group     r     n estimate  lower upper pvalue
        <fct> <int> <int>    <dbl>  <dbl> <dbl>  <dbl>
      1 1         3    20    0.150 0.0492 0.376 1     
      2 2         7    20    0.35  0.177  0.574 0.0769
    Code
      rate_effect(r = c(3, 7), n = c(20, 20), alternative = "less")
    Output
      # A tibble: 2 x 7
        group     r     n estimate  lower upper  pvalue
        <fct> <int> <int>    <dbl>  <dbl> <dbl>   <dbl>
      1 1         3    20    0.150 0.0492 0.376 0.00280
      2 2         7    20    0.35  0.177  0.574 1      
    Code
      rate_effect(r = c(25, 35), n = c(100, 100), alternative = "greater")
    Output
      # A tibble: 2 x 7
        group     r     n estimate lower upper pvalue
        <fct> <int> <int>    <dbl> <dbl> <dbl>  <dbl>
      1 1        25   100    0.250 0.175 0.344 1     
      2 2        35   100    0.35  0.263 0.448 0.0621
    Code
      rate_effect(r = c(25, 35), n = c(100, 100), alternative = "less")
    Output
      # A tibble: 2 x 7
        group     r     n estimate lower upper      pvalue
        <fct> <int> <int>    <dbl> <dbl> <dbl>       <dbl>
      1 1        25   100    0.250 0.175 0.344 0.000000982
      2 2        35   100    0.35  0.263 0.448 1          

