#' Calculate Sample Size for Two Sample Test Proportion
#' 
#' Uses [`stats::power.prop.test()`] to calculate the total number of samples that
#' must be included in a study 
#' to achieve a statistical power of 0.8 at a significance level of 0.05 
#' for a test of a difference in the proportion of samples
#' appearing in two groups.
#' 
#' It is worth noting that `n` is the total number of samples required in the study,
#' unlike with [`stats::power.prop.test()`] where it is the total number of 
#' samples in each group.
#'
#' @inheritParams params
#'
#' @return A integer of the required total sample size. 
#' @export
#'
#' @examples
#' prop2_samplesize(0.9)
#' prop2_samplesize(0.1)
#' prop2_samplesize(0.01, 0.09)
#' prop2_samplesize(0.45)
#' prop2_samplesize(0.005, 0.0075)
#' prop2_samplesize(0.005, 0.0075, alternative = "less")
#' prop2_samplesize(0.005, 0.0075, alternative = "greater")
prop2_samplesize <- function(p1, p2 = 1 - p1, alternative = "two.sided") {
  chk_number(p1)
  chk_number(p2)
  chk_range(p1)
  chk_range(p2)
  chk_lte(sum(c(p1, p2)), value = 1, x_name = "The sum of `p1` and `p2`")
  chk_string(alternative)
  chk_subset(alternative, c("two.sided", "greater", "less"))
  
  if((alternative == "greater" & p1 < p2) | (alternative == "less" & p1 > p2)) {
    return(Inf)
  }
  if(alternative %in% c("greater", "less")) {
    alternative <- "one.sided"
  }
  
  n <- stats::power.prop.test(p1 = p1, p2 = p2, power = 0.8, alternative = alternative)$n
  n <- n * 2
  n |> 
    ceiling() |>
    as.integer()
}
