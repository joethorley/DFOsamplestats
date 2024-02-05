#' P-value for Multiple Sample Test Proportions
#' 
#' @param ns A vector of the number of samples in each group.
#' @param p A vector of the null probabilities of succes If NULL the
#' probabilities are assumed to be equal.
#'
#' @return A numeric scalar of the p-value. 
#' @export
#'
#' @examples
#' propn_pvalue(c(106, 100))
#' propn_pvalue(c(106, 100, 90))
#' propn_pvalue(c(106, 80))
#' propn_pvalue(c(106, 80, 106))
#' propn_pvalue(c(60, 40))
#' propn_pvalue(c(60, 40), p = c(0.6, 0.4))
#' propn_pvalue(c(60, 40), p = c(0.4, 0.6))
propn_pvalue <- function(ns, p = NULL) {
  chk_whole_numeric(ns)
  chk_vector(ns)
  chk_length(ns, 2L, 10L)
  chk_gte(ns)
  chk_null_or(p, vld = vld_numeric)
  chk_null_or(p, vld = vld_vector)
  chk_null_or(p, vld = vld_range)
  chk_null_or(p, vld = vld_not_any_na)
  if(!is.null(p)) {
    chk_lte(sum(c(p)), value = 1, x_name = "The sum of `p`")
  }
  if(anyNA(ns)) return(NA_real_)
  
  x <- ns
  n <- rep(sum(ns), length(x))
  
  stats::prop.test(x, n, p = p)$p.value
}
