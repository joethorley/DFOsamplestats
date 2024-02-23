#' Estimate Rates with Confidence Limits and P-Values
#' 
#' Estimates 95% confidence limits using Wald method.
#' The p-value for the first group is for p = 0.5 while the p-value for the
#' subsequent groups is for equal probabilities.
#' 
#' @inheritParams params
#' @return A data frame with six columns of group, r, n, the estimate of the rate, 
#' the lower and upper 95% confidence limits and the p-value.
#' @seealso [`rate_sim()`] and [`rate2_power_analysis()`]
#' @export
#'
#' @examples
#' rate_effect(5, 10)
#' rate_effect(c(1,9), c(10,10))
#' rate_effect(c(1,9), 20)
rate_effect <- function(r, n, alternative = "two.sided") {
  chk_vector(r)
  chk_vector(n)
  chk_whole_numeric(r)
  chk_whole_numeric(n)
  check_dim(n, values = c(1, length(r)))
  chk_gte(r)
  chk_gte(n)
  chk_lte(r, n)
  chk_string(alternative)
  chk_subset(alternative, c("two.sided", "greater", "less"))
  
  if(!length(r)) {
    return(tibble::tibble(group = factor(), r = integer(0), n = integer(0), estimate = numeric(0), lower = numeric(0), upper = numeric(0), pvalue = numeric(0)))
  }
  
  if(length(n) == 1) {
    n <- round(n / length(r))
    chk_lte(r, n)
  }
  
  r <- as.integer(r)
  n <- as.integer(n)
  group <- factor(1:length(r))
  
  data <- tibble::tibble(group = group, r = r, n = n)
  
  if(nrow(data) == 1) {
    mod <- stats::glm(cbind(r,n-r)~ 1, data = data, family = stats::binomial)
  } else {
    mod <- stats::glm(cbind(r,n-r)~ group, data = data, family = stats::binomial)
  }
  pred <- stats::predict(mod, se.fit = TRUE)
  data$estimate <- unname(pred$fit)
  data$lower <- data$estimate + stats::qnorm(0.025) * pred$se.fit
  data$upper <- data$estimate + stats::qnorm(0.975) * pred$se.fit
  data$estimate <- stats::plogis(data$estimate)
  data$lower <- stats::plogis(data$lower)
  data$upper <- stats::plogis(data$upper)
  coef <- summary(mod)$coefficients
  data$pvalue <- as.vector(coef[,"Pr(>|z|)"])
  greater <- data$estimate > data$estimate[1]
  greater[1] <- data$estimate[1] > 0.5
  
  if(alternative == "greater") {
    data$pvalue[greater] <- data$pvalue[greater] / 2
    data$pvalue[!greater] <- 1
  } else if(alternative == "less") {
    data$pvalue[!greater] <- data$pvalue[!greater] / 2
    data$pvalue[greater] <- 1      
  }
  data
}
