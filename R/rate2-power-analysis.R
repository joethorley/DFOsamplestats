rate_sim_iter <- function(i, p, n, alternative) {
  sim <- rate_sim(p, n)
  effect <- rate_effect(r = sim$r, n = sim$n, alternative = alternative)
  effect$pvalue[nrow(effect)]
}

#' Power Analysis for Rates
#' 
#' Uses [`rate_sim()`] and [`rate_effect()`] to simulate the statistical 
#' power (probability of a p-value < 0.05). 
#' If p2 is NULL estimates the power for detecting whether p1 is different from 0.5.
#' Otherwise estimates the power for detecting a difference between the two groups.
#'
#' @inheritParams params
#' @return A real scalar of the power.
#' @seealso [`rate2_power()`] and [`rate_effect()`]
#' @export
#' @examples
#' rate2_power_analysis(0.9, 10, nsims = 100)
#' rate2_power_analysis(0.005, p2 = 0.0075, n = 1000, alternative = "greater", nsims = 100)
rate2_power_analysis <- function(p1, n, p2 = NULL, alternative = "two.sided", nsims = 1000) {
  chk_whole_number(nsims)
  chk_gte(nsims, 10)
  
  p <- c(p1, p2)
  
  pvalues <- vapply(1:nsims, FUN = rate_sim_iter, FUN.VALUE = 1, 
                    p = p, n = n, alternative = alternative)
  sum(pvalues < 0.05) / length(pvalues)
}
