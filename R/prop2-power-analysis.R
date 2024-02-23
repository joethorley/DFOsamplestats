prop2_pvalue_fun <- function(x, alternative) {
  prop2_pvalue(x[1], x[2], alternative = alternative)
}

#' Power Analysis for Two Sample Test Proportion
#'
#' @inheritParams params
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
prop2_power_analysis <- function(p1, n, p2 = 1 - p1, alternative = "two.sided", nsims = 1000) {
  chk_number(p1)
  chk_number(p2)
  chk_range(p1)
  chk_range(p2)
  chk_lte(sum(c(p1, p2)), value = 1, x_name = "The sum of `p1` and `p2`")
  chk_whole_number(n)
  chk_gt(n)
  chk_string(alternative)
  chk_subset(alternative, c("two.sided", "greater", "less"))
  chk_whole_number(nsims)
  chk_gte(nsims, 10)
  
  sims <- lapply(rep(p1, nsims), FUN = prop2_sim, n = n, p2 = p2)
  pvalues <- lapply(sims, FUN = prop2_pvalue_fun, alternative = alternative)
  pvalues <- unlist(pvalues)
  sum(pvalues < 0.05) / length(pvalues)
}
