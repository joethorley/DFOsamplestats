prop2_pvalue_fun <- function(x, one_sided) {
  prop2_pvalue(x[1], x[2], one_sided = one_sided)
}

#' Power for Two Sample Test Proportion
#'
#' @param p1 Proportion appearing in first group.
#' @param n Total number of samples.
#' @param one_sided A flag specifying whether to perform a one sided test.
#' @param nsims A whole number of the number of simulations to perform.
#'
#' @return A real scalar of the power.
#' @export
#'
#' @examples
#' set.seed(99)
#' prop2_power_analysis(0.9, 10)
#' set.seed(99)
#' prop2_power_analysis(0.9, 10)
#' prop2_power_analysis(0.9, 10)
#' set.seed(99)
#' prop2_power_analysis(0.1, 10)
#' set.seed(99)
#' prop2_power_analysis(0.45, 500)
prop2_power_analysis <- function(p1, n, one_sided = FALSE, nsims = 1000) {
  chk_number(p1)
  chk_range(p1)
  chk_whole_number(n)
  chk_gt(n)
  chk_flag(one_sided)
  chk_whole_number(nsims)
  chk_gte(nsims, 10)
  
  alternative <- if(one_sided) "one.sided" else "two.sided"

  sims <- lapply(rep(p1, nsims), FUN = prop2_sim, n = n)
  pvalues <- lapply(sims, FUN = prop2_pvalue_fun, one_sided = one_sided)
  sum(pvalues < 0.05) / length(pvalues)
}
