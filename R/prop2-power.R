#' Power for Two Sample Test Proportion
#' 
#' Uses `stats::power.prop.test()` to calculate the statistical 
#' power (probability of a p-value < 0.05)
#' for a test of a difference in the proportion of samples
#' appearing in two groups.
#'
#' @param p1 Proportion appearing in first group.
#' @param p2 Proportion appearing in second group.
#' @param n Total number of samples in study. This is different to
#'  `stats::power.prop.test()` where `n` is the number of samples in each group.
#' @param alternative A flag specifying whether to perform a one sided test.
#'
#' @return A real scalar of the power.
#' @export
#'
#' @examples
#' prop2_power(0.9, n = 10)
#' prop2_power(0.1, n = 10)
#' prop2_power(0.01, 0.09, n = 10)
#' prop2_power(0.45, 10)
#' prop2_power(0.005, p2 = 0.0075, 1000)
#' prop2_power(0.005, p2 = 0.0075, 1000, alternative = "greater")
prop2_power <- function(p1, n, p2 = 1 - p1, alternative = "two.sided") {
  chk_number(p1)
  chk_number(p2)
  chk_range(p1)
  chk_range(p2)
  chk_lte(sum(c(p1, p2)), value = 1, x_name = "The sum of `p1` and `p2`")
  chk_whole_number(n)
  chk_gt(n)
  chk_string(alternative)
  chk_subset(alternative, c("two.sided", "greater", "less"))

  if((alternative == "greater" & p1 < p2) | (alternative == "less" & p1 > p2)) {
    return(0)
  }
  if(alternative %in% c("greater", "less")) {
    alternative <- "one.sided"
  }
  n <- n/2
  
  stats::power.prop.test(n = n, p1 = p1, p2 = p2, power = NULL, alternative = alternative)$power
}
