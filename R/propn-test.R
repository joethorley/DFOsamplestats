#' P-value for Exact Multiple Sample Test Proportions
#' 
#' Uses `stats::prop.test()` to calculate the exact p-value for a
#' multiple sample test of a difference in the probability of being in the groups.
#'
#' @param ns A vector of the number of samples in each group.
#'
#' @return A numeric scalar of the p-value. 
#' @export
#'
#' @examples
#' propn_test(c(106, 100))
#' propn_test(c(106, 100, 90))
#' propn_test(c(106, 80))
#' propn_test(c(106, 80, 106))
propn_test <- function(ns) {
  chk_whole_numeric(ns)
  chk_vector(ns)
  chk_length(ns, 2L, 10L)
  chk_gte(ns)

  if(anyNA(ns)) return(NA_real_)

  x <- ns
  n <- rep(sum(ns), length(x))
  
  t <- stats::prop.test(x, n)
  return(t)
  estimate <- unname(t$estimate)
  ci <- t$conf.int
  pvalue <- t$p.value
  
  tibble::tibble(estimate = estimate, lower = ci[1], upper = ci[2], 
                 pvalue = pvalue, svalue = svalue)
}
