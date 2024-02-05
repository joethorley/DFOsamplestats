#' Sample Size for Two Sample Test Proportion
#' 
#' Uses `stats::power.prop.test()` to calculate the number of samples that
#' must be included in a study 
#' to achieve a statistical power of 0.8 at a significance level of 0.05 
#' for a test of a difference in the proportion of samples
#' appearing in one of two groups.
#'
#' @param p1 Proportion appearing in one group.
#' @param p2 Proportion appearing in other group.
#' @param one_sided A flag specifying whether to perform a one sided test.
#'
#' @return A integer of the required number of individuals. 
#' @export
#'
#' @examples
#' prop2_power(0.9, 0.1)
#' prop2_power(0.1, 0.9)
#' prop2_power(0.01, 0.09)
#' prop2_power(0.45, 0.55)
#' prop2_power(0.005, 0.0075)
prop2_power <- function(p1, p2, one_sided = FALSE) {
  chk_numeric(p1)
  chk_numeric(p2)
  chk_scalar(p1)
  chk_scalar(p2)
  chk_range(p1)
  chk_range(p2)
  chk_lte(sum(c(p1, p2)), value = 1, x_name = "The sum of `p1` and `p2`")
  chk_flag(one_sided)
  
  if(is.na(p1) | is.na(p2)) {
    return(NA_integer_)
  }
  
  alternative <- if(one_sided) "one.sided" else "two.sided"
  
  stats::power.prop.test(p1 = p1, p2 = p2, power = 0.8, alternative = alternative)$n |>
    ceiling() |>
    as.integer()
}
