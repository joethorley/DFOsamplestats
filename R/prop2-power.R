#' Power for Two Sample Test Proportion
#' 
#' Uses `stats::power.prop.test()` to calculate the statistical 
#' power (probability of a p-value < 0.05)
#' for a test of a difference in the proportion of samples
#' appearing in two groups.
#'
#' @param p1 Proportion appearing in first group.
#' @param p2 Proportion appearing in second group.
#' @param n Total number of samples.
#' @param one_sided A flag specifying whether to perform a one sided test.
#'
#' @return A real scalar of the power.
#' @export
#'
#' @examples
#' prop2_power(0.9, 0.1, 10)
#' prop2_power(0.1, 0.9, 10)
#' prop2_power(0.01, 0.09, 10)
#' prop2_power(0.45, 0.55, 10)
#' prop2_power(0.005, 0.0075, 1000)
#' prop2_power(0.005, 0.0075, 1000, one_sided = TRUE)
prop2_power <- function(p1, p2, n, one_sided = FALSE) {
  chk_number(p1)
  chk_number(p2)
  chk_range(p1)
  chk_range(p2)
  chk_lte(sum(c(p1, p2)), value = 1, x_name = "The sum of `p1` and `p2`")
  chk_whole_number(n)
  chk_gt(n)
  chk_flag(one_sided)

  alternative <- if(one_sided) "one.sided" else "two.sided"
  
  stats::power.prop.test(n = n, p1 = p1, p2 = p2, power = NULL, alternative = alternative)$power
}
