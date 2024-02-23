#' Estimate Rates with Confidence Limits and P-Values
#' 
#' Estimates 95% confidence limits using Wald method.
#' The p-value for the first group is for p = 0.5 while the p-value for the
#' subsequent groups is for equal probabilities.
#' 
#' @inheritParams params
#' @return A data frame with six columns of group, r, n, the estimate of the rate, 
#' the lower and upper 95% confidence limits and the p-value.
#' @export
#'
#' @examples
#' rate_effect(5, 10)
#' rate_effect(c(1,9), c(10,10))
#' rate_effect(c(1,9), 20)
rate_effect <- function(r, n) {
  chk_vector(r)
  chk_vector(n)
  chk_whole_numeric(r)
  chk_whole_numeric(n)
  check_dim(n, values = c(1, length(r)))
  chk_gte(r)
  chk_gte(n)
  chk_lte(r, n)
  
  if(!length(r)) {
    return(tibble::tibble(group = factor(), r = integer(0), n = integer(0), estimate = numeric(0), lower = numeric(0), upper = numeric(0)))
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
    mod <- glm(cbind(r,n-r)~ 1, data = data, family = binomial)
  } else {
    mod <- glm(cbind(r,n-r)~ group, data = data, family = binomial)
  }
  pred <- predict(mod, se.fit = TRUE)
  data$estimate <- unname(pred$fit)
  data$lower <- data$estimate + qnorm(0.025) * pred$se.fit
  data$upper <- data$estimate + qnorm(0.975) * pred$se.fit
  data$estimate <- plogis(data$estimate)
  data$lower <- plogis(data$lower)
  data$upper <- plogis(data$upper)
  coef <- summary(mod)$coefficients
  data$pvalue <- as.vector(coef[,"Pr(>|z|)"])
  data
}
