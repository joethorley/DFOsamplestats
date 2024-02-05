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
#' propn_estimate(c(106, 100))
#' propn_estimate(c(106, 100, 90))
#' propn_estimate(c(106, 80))
#' propn_estimate(c(106, 80, 106))
propn_estimate <- function(ns) {
  chk_whole_numeric(ns)
  chk_vector(ns)
  chk_length(ns, 2L, 10L)
  chk_gte(ns)

  if(anyNA(ns)) return(NA_real_)

  x <- ns
  n <- rep(sum(ns), length(x))
  
  t <- stats::prop.test(x, n)
  estimate <- unname(t$estimate)
  ci <- t$conf.int
  if(is.null(ci)) {
    ci <- rep(NA_real_, 2)
  }
  term = term::as_term(paste0("p[", 1:length(x),"]"))
  tibble::tibble(term = term, estimate = estimate, lower = ci[1], upper = ci[2])
}
