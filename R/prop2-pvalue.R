#' P-Value for Exact Two Sample Test Proportions
#'
#' @inheritParams params
#' @return A real scalar of the p-value.
#' @export
#'
#' @examples
#' prop2_pvalue(6, 0)
#' prop2_pvalue(3, 3)
#' prop2_pvalue(0, 6)
#' prop2_pvalue(106, 100)
#' prop2_pvalue(106, 100, alternative = "greater")
#' prop2_pvalue(106, 100, alternative = "less")
#' prop2_pvalue(100, 106, alternative = "less")
prop2_pvalue <- function(n1, n2, alternative = "two.sided") {
  chk_whole_number(n1)
  chk_whole_number(n2)
  chk_scalar(n1)
  chk_scalar(n2)
  chk_gte(n1)
  chk_gte(n2)
  chk_string(alternative)
  chk_subset(alternative, c("two.sided", "greater", "less"))
  
  x <- n1
  n <- n1 + n2
  
  stats::binom.test(x, n, alternative = alternative)$p.value
}
