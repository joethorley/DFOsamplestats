#' Calculate Estimate and Confidence Limits for Two Sample Test Proportion
#' 
#' Uses [`stats::binom.test`] to calculate the confidence intervals.
#' 
#' @inheritParams params
#' @return A data frame of the estimated proportion in the first group with lower and upper 95% confidence limits.
#' @export
#'
#' @examples
#' prop2_ci(6, 0)
#' prop2_ci(3, 3)
#' prop2_ci(0, 6)
#' prop2_ci(106, 100)
#' prop2_ci(100, 106)
prop2_ci <- function(n1, n2) {
  chk_whole_number(n1)
  chk_whole_number(n2)
  chk_scalar(n1)
  chk_scalar(n2)
  chk_gte(n1)
  chk_gte(n2)

  x <- n1
  n <- n1 + n2

  t <- stats::binom.test(x, n)
  estimate <- unname(t$estimate)
  ci <- t$conf.int
  tibble::tibble(term = term::as_term("p[1]"), 
                 estimate = estimate, lower = ci[1], upper = ci[2])
}
