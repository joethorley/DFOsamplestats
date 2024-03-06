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
      1     1 5 10     1    1 0.4977119 0.2412192 0.7604824 0.0006662225
    Code
      rate_effect_bayesian(r = c(3, 7), n = 20)
    Output
        group r  n alpha beta  estimate     lower     upper       pvalue
      1     1 3 10     1    1 0.3311584 0.1249844 0.5945658 0.0006662225
      2     2 7 10     1    1 0.6730253 0.4097815 0.8887971 0.0726182545
    Code
      rate_effect_bayesian(r = c(3, 7), n = c(20, 20))
    Output
        group r  n alpha beta  estimate      lower     upper       pvalue
      1     1 3 20     1    1 0.1728394 0.05610194 0.3599811 0.0006662225
      2     2 7 20     1    1 0.3572862 0.18898925 0.5796157 0.1285809460
    Code
      rate_effect_bayesian(c(1, 9), c(10, 10))
    Output
        group r  n alpha beta  estimate      lower     upper       pvalue
      1     1 1 10     1    1 0.1534602 0.02364851 0.4118703 0.0006662225
      2     2 9 10     1    1 0.8441471 0.55049250 0.9799965 0.0006662225
    Code
      rate_effect_bayesian(c(1, 9), 20)
    Output
        group r  n alpha beta  estimate      lower     upper       pvalue
      1     1 1 10     1    1 0.1552281 0.02282724 0.4353249 0.0006662225
      2     2 9 10     1    1 0.8615610 0.58395245 0.9768188 0.0006662225
    Code
      rate_effect_bayesian(c(1, 9), 40)
    Output
        group r  n alpha beta   estimate      lower     upper       pvalue
      1     1 1 20     1    1 0.08108071 0.01436807 0.2283429 0.0006662225
      2     2 9 20     1    1 0.44517008 0.26907447 0.6766329 0.0006662225
    Code
      rate_effect_bayesian(9, 10)
    Output
        group r  n alpha beta  estimate     lower     upper       pvalue
      1     1 9 10     1    1 0.8488637 0.5805715 0.9760804 0.0006662225
    Code
      rate_effect_bayesian(9, 10, alternative = "greater")
    Output
        group r  n alpha beta  estimate     lower     upper       pvalue
      1     1 9 10     1    1 0.8573601 0.5588315 0.9834538 0.0003331113
    Code
      rate_effect_bayesian(9, 10, alternative = "less")
    Output
        group r  n alpha beta estimate     lower    upper pvalue
      1     1 9 10     1    1 0.856621 0.5937632 0.980208      1
    Code
      rate_effect_bayesian(r = c(3, 7), n = c(20, 20), alternative = "greater")
    Output
        group r  n alpha beta  estimate      lower     upper     pvalue
      1     1 3 20     1    1 0.1653368 0.04943963 0.3568286 1.00000000
      2     2 7 20     1    1 0.3653082 0.18619231 0.5794257 0.06229181
    Code
      rate_effect_bayesian(r = c(3, 7), n = c(20, 20), alternative = "less")
    Output
        group r  n alpha beta  estimate      lower     upper       pvalue
      1     1 3 20     1    1 0.1742454 0.04874204 0.3739947 0.0003331113
      2     2 7 20     1    1 0.3601216 0.19805289 0.5662988 1.0000000000
    Code
      rate_effect_bayesian(r = c(25, 35), n = c(100, 100), alternative = "greater")
    Output
        group  r   n alpha beta  estimate     lower     upper    pvalue
      1     1 25 100     1    1 0.2456946 0.1781291 0.3416187 1.0000000
      2     2 35 100     1    1 0.3546761 0.2628360 0.4600338 0.0562958
    Code
      rate_effect_bayesian(r = c(25, 35), n = c(100, 100), alternative = "less")
    Output
        group  r   n alpha beta  estimate     lower     upper       pvalue
      1     1 25 100     1    1 0.2501343 0.1696751 0.3339015 0.0003331113
      2     2 35 100     1    1 0.3501184 0.2649740 0.4443247 1.0000000000

