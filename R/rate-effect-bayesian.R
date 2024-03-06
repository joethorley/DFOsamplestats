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
#' set.seed(99)
#' rate_effect_bayesian(0, 5)
#' rate_effect_bayesian(0, 5, 10, 10)
#' rate_effect_bayesian(c(0,5), c(5,5), 10, 10)
rate_effect_bayesian <- function(r, n, alpha = 1, beta = 1, alternative = "two.sided") {
  if (!requireNamespace("rjags", quietly = TRUE)) {
    stop(
      "Package \"rjags\" must be installed to use this function.",
      call. = FALSE
    )
  }
  if (!requireNamespace("mcmcr", quietly = TRUE)) {
    stop(
      "Package \"mcmcr\" must be installed to use this function.",
      call. = FALSE
    )
  }
  
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
  list <- as.list(data)
  list$group <- NULL
  list$nObs <- nrow(data)
  
  file <- tempfile()
  writeLines("model {
        for(i in 1:nObs) {
          bGroup[i] ~ dbeta(alpha[i], beta[i])
          r[i] ~ dbin(bGroup[i], n[i])
          bDiff[i] <- bGroup[i] - bGroup[1]
        }
      }", con = file)
  
  
  seed <- round(stats::runif(1, 0, 100000))
  inits <- list(.RNG.name = "base::Wichmann-Hill", .RNG.seed = seed)
  model <- rjags::jags.model(file, data = list, n.chains = 3, quiet = TRUE, inits = inits)
  utils::capture.output(mcmc <- rjags::jags.samples(model, variable.names = c("bGroup", "bDiff"), n.iter = 500))
  group <- mcmc$bGroup
  group <- stats::coef(group)
  group$pvalue <- 1/2^group$svalue
  group$svalue <- NULL
  group$term <- NULL
  group$diff <- group$estimate - 0.5
  
  if(nrow(data) > 1) {
    diff <- mcmc$bDiff
    diff <- stats::coef(diff)
    diff$pvalue <- 1/2^diff$svalue
    group$pvalue[2:nrow(data)] <- diff$pvalue[2:nrow(data)]
    group$diff[2:nrow(data)] <- diff$estimate[2:nrow(data)]
  }
  if(alternative != "two.sided") {
    group$pvalue <- group$pvalue / 2
    if(alternative == "greater") {
      group$pvalue[group$diff < 0] <- 1
    } else {
      group$pvalue[group$diff > 0] <- 1
    }
  }
  group$diff <- NULL
  
  cbind(data, group)
}
