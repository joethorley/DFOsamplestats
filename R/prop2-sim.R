#' Simulate Data for Two Sample Test Proportion
#'
#' @param p1 Probability of appearing in first group.
#' @param n Total number of samples.
#'
#' @return A real vector of the number in the first and second group.
#' @export
#'
#' @examples
#' set.seed(99)
#' prop2_sim(0.9, 10)
#' set.seed(99)
#' prop2_sim(0.9, 10)
#' prop2_sim(0.9, 10)
#' set.seed(99)
#' prop2_sim(0.1, 10)
#' set.seed(99)
#' prop2_sim(0.45, 10)
prop2_sim <- function(p1, n) {
  chk_number(p1)
  chk_range(p1)
  chk_whole_number(n)
  chk_gt(n)
  
  n1 <- stats::rbinom(1, n, p1)
  n2 <- n - n1
  as.integer(c(n1, n2))
}
