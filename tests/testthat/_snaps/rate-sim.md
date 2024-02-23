# rate_sim works

    Code
      rate_sim(numeric(0), integer(0))
    Output
      # A tibble: 0 x 4
      # i 4 variables: group <fct>, p <dbl>, n <int>, r <int>
    Code
      set.seed(99)
      rate_sim(0.9, 10)
    Output
      # A tibble: 1 x 4
        group     p     n     r
        <fct> <dbl> <dbl> <int>
      1 1       0.9    10     9
    Code
      rate_sim(0.9, 10)
    Output
      # A tibble: 1 x 4
        group     p     n     r
        <fct> <dbl> <dbl> <int>
      1 1       0.9    10    10
    Code
      set.seed(100)
      rate_sim(c(0.9, 1), 10)
    Output
      # A tibble: 2 x 4
        group     p     n     r
        <fct> <dbl> <dbl> <int>
      1 1       0.9     5     5
      2 2       1       5     5
    Code
      rate_sim(c(0.9, 1), c(100, 1))
    Output
      # A tibble: 2 x 4
        group     p     n     r
        <fct> <dbl> <dbl> <int>
      1 1       0.9   100    92
      2 2       1       1     1

