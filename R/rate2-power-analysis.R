rate_sim_iter <- function(i, p, n) {
  rate_sim(p, n)
}

#' Power Analysis for Rates
#' 
#' If p2 is NULL estimates the power for detecting whether p1 is different from 0.5.
#' Other estimates the power for detecting a difference between the two groups.
#'
#' @inheritParams params
#' @return A real scalar of the power.
#' @export
rate2_power_analysis <- function(p1, n, p2 = NULL, nsims = 1000) {
  chk_whole_number(nsims)
  chk_gte(nsims, 10)
  
  p <- c(p1, p2)
  
  sims <- lapply(1:nsims, FUN = rate_sim_iter, p = p, n = n)
  # 
  # pvalues <- lapply(sims, FUN = prop2_pvalue_fun, alternative = alternative)
  # pvalues <- unlist(pvalues)
  # sum(pvalues < 0.05) / length(pvalues)
}
