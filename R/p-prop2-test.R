#' P-value for Exact Two Sample Test Proportions
#' 
#' Uses `stats::binom.test()` to calculate the exact p-value for a
#' a two sample test of a difference in the probability of being in n1 vs n2.
#'
#' @param n1 Number of samples in first group.
#' @param n2 Number of samples in second group.
#' @param one_sided A flag specifying whether to perform a one sided test.
#'
#' @return A numeric scalar of the p-value. 
#' @export
#'
#' @examples
#' prop2_power(6, 0)
#' prop2_power(3, 3)
#' prop2_power(0, 6)
#' prop2_power(106, 100)
#' prop2_power(106, 100, one_sided = TRUE)
#' prop2_power(100, 106, one_sided = TRUE)
prop2_power <- function(n1, n2, one_sided = FALSE) {
  chk_whole_number(n1)
  chk_whole_number(n2)
  chk_scalar(n1)
  chk_scalar(n2)
  chk_gte(n1)
  chk_gte(n2)
  chk_flag(one_sided)
  
  x <- n1
  n <- n1 + n2
  
  alternative <- if(one_sided) {
    if(n1 <= n2) "less" else "greater"
  }
  else {
    "two.sided"
  }
  
  stats::binom.test(x, n, alternative = alternative)$p.value
}
