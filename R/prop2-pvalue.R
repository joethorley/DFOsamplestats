#' P-Value for Exact Two Sample Test Proportions
#'
#' @param n1 Number of samples in first group.
#' @param n2 Number of samples in second group.
#' @param alternative A string specifying whether to perform a "two.sided",
#' or "less" or "greater" one-sided test.
#'
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
