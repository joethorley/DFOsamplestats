#' P-value for Multiple Sample Test Proportions
#' 
#' @param ns A vector of the number of samples in each group.
#'
#' @return A numeric scalar of the p-value. 
#' @export
#'
#' @examples
#' propn_pvalue(c(106, 100))
#' propn_pvalue(c(106, 100, 90))
#' propn_pvalue(c(106, 80))
#' propn_pvalue(c(106, 80, 106))
propn_pvalue <- function(ns) {
  chk_whole_numeric(ns)
  chk_vector(ns)
  chk_length(ns, 2L, 10L)
  chk_gte(ns)
  
  if(anyNA(ns)) return(NA_real_)
  
  x <- ns
  n <- rep(sum(ns), length(x))
  
  stats::prop.test(x, n)$p.value
}
