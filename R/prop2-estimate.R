#' Estimate, Confidence Interval and P-Value for Exact Two Sample Test Proportions
#' 
#' Uses `stats::binom.test()` to calculate the estimate 95% Confidence Interval
#' and P-value for the probability of being in n1 vs n2.
#'
#' @param n1 Number of samples in first group.
#' @param n2 Number of samples in second group.
#' @param one_sided A flag specifying whether to perform a one sided test.
#'
#' @return A numeric vector of the estimate and lower and upper 95% confidence limits.
#' @export
#'
#' @examples
#' prop2_estimate(6, 0)
#' prop2_estimate(3, 3)
#' prop2_estimate(0, 6)
#' prop2_estimate(106, 100)
#' prop2_estimate(106, 100, one_sided = TRUE)
#' prop2_estimate(100, 106, one_sided = TRUE)
prop2_estimate <- function(n1, n2, one_sided = FALSE) {
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
  
  t <- stats::binom.test(x, n, alternative = alternative)
  estimate <- unname(t$estimate)
  ci <- t$conf.int
  tibble::tibble(term = term::as_term("p[1]"), 
                 estimate = estimate, lower = ci[1], upper = ci[2])
}
