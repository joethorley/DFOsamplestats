#' Calculate P-Value for Rate
#'
#' @inheritParams params
#' @return A data frame with four columns of group, r, n, and the p-value.
#' The p-value for the first group is for p = 0.5 while the p-value for the
#' subsequent groups is for equal probabilities.
#' @export
#'
#' @examples
#' rate_pvalue(5, 10)
#' rate_pvalue(c(1,9), c(10,10))
#' rate_pvalue(c(1,9), 20)
rate_pvalue <- function(r, n) {
  chk_vector(r)
  chk_vector(n)
  chk_whole_numeric(r)
  chk_whole_numeric(n)
  check_dim(n, values = c(1, length(r)))
  chk_gte(r)
  chk_gte(n)
  chk_lte(r, n)
  
  if(!length(r)) {
    return(tibble::tibble(group = factor(), r = integer(0), n = integer(0), pvalue = numeric(0)))
  }
  
  mod_data <- .glm_ci(r, n)
  mod <- mod_data$mod
  data <- mod_data$data
  coef <- summary(mod)$coefficients
  data$pvalue <- as.vector(coef[,"Pr(>|z|)"])
  data
}
