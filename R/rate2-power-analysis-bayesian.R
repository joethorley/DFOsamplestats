rate_sim_iter_bayesian <- function(i, p, n, alpha, beta, alternative, niter) {
  sim <- rate_sim(p, n)
  effect <- rate_effect_bayesian(r = sim$r, n = sim$n, 
                                 alpha = alpha, 
                                 beta = beta, alternative = alternative,
                                 niter = niter)
  effect$pvalue[nrow(effect)]
}

#' Power Analysis for Rates using Bayesian Model
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
#' rate2_power_analysis_bayesian(0.9, 10, nsims = 100)
#' rate2_power_analysis_bayesian(0.005, p2 = 0.0075, n = 1000, alternative = "greater", nsims = 100)
rate2_power_analysis_bayesian <- function(p1, n, p2 = NULL, alpha1 = 1, beta1 = 1, alpha2 = alpha1, beta2 = beta1, alternative = "two.sided", nsims = 1000, niter = 10000) {
  chk_whole_number(nsims)
  chk_gte(nsims, 10)
  
  p <- c(p1, p2)
  alpha <- alpha1
  beta <- beta1
  
  if(!is.null(p2)) {
    alpha <- c(alpha, alpha2)
    beta <- c(beta, beta2)
  }
  pvalues <- vapply(1:nsims, FUN = rate_sim_iter_bayesian, FUN.VALUE = 1, 
                    p = p, n = n, alpha = alpha, beta = beta, alternative = alternative, niter = niter)
  sum(pvalues < 0.05) / length(pvalues)
}
