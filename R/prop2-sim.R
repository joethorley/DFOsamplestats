#' Simulate Data for Two Sample Test Proportion
#'
#' @param p1 Proportion appearing in first group.
#' @param p2 Proportion appearing in second group.
#' @param n Total number of samples.
#'
#' @return A real vector of the number in the first and second group.
#' @export
#'
#' @examples
#' prop2_sim(0.9, 0.1, 10)
#' prop2_sim(0.9, 0.1, 10)
#' prop2_sim(0.1, 0.9, 10)
#' prop2_sim(0.01, 0.09, 10)
#' prop2_sim(0.45, 0.55, 10)
#' prop2_sim(0.005, 0.0075, 1000)
prop2_sim <- function(p1, p2, n) {
  chk_number(p1)
  chk_number(p2)
  chk_range(p1)
  chk_range(p2)
  chk_lte(sum(c(p1, p2)), value = 1, x_name = "The sum of `p1` and `p2`")
  chk_whole_number(n)
  chk_gt(n)
  
  n1 <- stats::rbinom(1, n, p1)
  n2 <- stats::rbinom(1, n-n1, p2)
  c(n1, n2)
}
