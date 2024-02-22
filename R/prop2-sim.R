#' Simulate Data for Two Sample Test Proportion
#'
#' @inheritParams params
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
prop2_sim <- function(p1, n, p2 = 1 - p1) {
  chk_number(p1)
  chk_number(p2)
  chk_range(p1)
  chk_range(p2)
  chk_lte(sum(c(p1, p2)), value = 1, x_name = "The sum of `p1` and `p2`")
  chk_whole_number(n)
  chk_gt(n)
  
  p <- c(p1, p2)
  p3 <- 1 - sum(p)
  p[3] <- p3
  
  samples <- stats::rmultinom(1, n, prob = p) |> as.vector()
  samples[1:2]
}
