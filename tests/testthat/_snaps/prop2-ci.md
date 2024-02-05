# multiplication works

    Code
      prop2_ci(6, 0)
    Output
      # A tibble: 1 x 4
        term   estimate lower upper
        <term>    <dbl> <dbl> <dbl>
      1 p[1]          1 0.541     1
    Code
      prop2_ci(3, 3)
    Output
      # A tibble: 1 x 4
        term   estimate lower upper
        <term>    <dbl> <dbl> <dbl>
      1 p[1]        0.5 0.118 0.882
    Code
      prop2_ci(0, 6)
    Output
      # A tibble: 1 x 4
        term   estimate lower upper
        <term>    <dbl> <dbl> <dbl>
      1 p[1]          0     0 0.459
    Code
      prop2_ci(106, 100)
    Output
      # A tibble: 1 x 4
        term   estimate lower upper
        <term>    <dbl> <dbl> <dbl>
      1 p[1]      0.515 0.444 0.585
    Code
      prop2_ci(100, 106)
    Output
      # A tibble: 1 x 4
        term   estimate lower upper
        <term>    <dbl> <dbl> <dbl>
      1 p[1]      0.485 0.415 0.556

