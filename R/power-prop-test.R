#' Power Calculations for Two Sample Test Proportions
#' 
#' Uses `power.prop.test()` to calculate the number of individuals that
#' must be included in a study 
#' to achieve a statistical power of 0.8 at a significance level of 0.05 
#' for a one-sided test of a difference in the proportion of individuals
#' appearing in one of two groups.
#'
#' @param p1 Proportion appearing in one group.
#' @param p2 Proportion appearing in other group.
#'
#' @return A integer of the required number of individuals. 
#' @export
#'
#' @examples
#' power_prop_test(0.9, 0.1)
#' power_prop_test(0.1, 0.9)
#' power_prop_test(0.01, 0.09)
#' power_prop_test(0.45, 0.55)
#' power_prop_test(0.005, 0.0075)
power_prop_test <- function(p1, p2) {
  chk_numeric(p1)
  chk_numeric(p2)
  chk_scalar(p1)
  chk_scalar(p2)
  chk_range(p1)
  chk_range(p2)
  chk_lte(sum(c(p1, p2)), value = 1, x_name = "The sum of `p1` and `p2`")
  
  if(is.na(p1) | is.na(p2)) {
    return(NA_integer_)
  }
  
  stats::power.prop.test(p1 = p1, p2 = p2, power = 0.8, alternative = "one.sided")$n |>
    ceiling() |>
    as.integer()
}
