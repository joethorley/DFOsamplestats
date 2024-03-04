#' Estimate Rates with Credible Limits and P-Values
#' 
#' Estimates rates with 95% credible limits.
#' The credible limits and p-values are estimate using MCMC sample.
#' The p-value for the first group is for p1 = 0.5 while the p-value for
#' subsequent groups is for pn = p1.
#' 
#' @inheritParams params
#' @return A data frame with eight columns of group, r, n, alpha, beta, the estimate of the rate, 
#' the lower and upper 95% confidence limits and the p-value.
#' @seealso [`rate_effect()`]
#' @export
#'
#' @examples
#' \dontrun{
#' rate_effect_bayesian(0, 5)
#' rate_effect_bayesian(0, 5, 10, 10)
#' }
rate_effect_bayesian <- function(r, n, alpha = 1, beta = 1, alternative = "two.sided") {
  chk_vector(r)
  chk_vector(n)
  chk_vector(alpha)
  chk_vector(beta)
  chk_whole_numeric(r)
  chk_whole_numeric(n)
  chk_numeric(alpha)
  chk_numeric(beta)
  check_dim(n, values = c(1, length(r)))
  check_dim(alpha, values = c(1, length(r)))
  check_dim(beta, values = c(1, length(r)))
  chk_gte(r)
  chk_gte(n)
  chk_lte(r, n)
  chk_gte(alpha, 1)
  chk_gte(beta, 1)
  chk_string(alternative)
  chk_subset(alternative, c("two.sided", "greater", "less"))
  
  if(!length(r)) {
    return(tibble::tibble(
      group = factor(), 
      r = integer(0), 
      n = integer(0), 
      alpha = numeric(0),
      beta = numeric(0),
      estimate = numeric(0), 
      lower = numeric(0), 
      upper = numeric(0), 
      pvalue = numeric(0)))
  }
  
  if(length(n) == 1) {
    n <- round(n / length(r))
    chk_lte(r, n)
  }
  if(length(alpha) == 1) {
    alpha <- rep(alpha, length(r))
  }
  if(length(beta) == 1) {
    beta <- rep(beta, length(r))
  }
  
  r <- as.integer(r)
  n <- as.integer(n)
  alpha <- as.numeric(alpha)
  beta <- as.numeric(beta)
  group <- factor(1:length(r))
  
  data <- tibble::tibble(group = group, r = r, n = n, alpha = alpha, beta = beta)
  
  .NotYetImplemented()
}
