#' Simulate Data for Rates
#'
#' @inheritParams params
#' @return A tibble with four columns of the group, p, n and r (integer vector of the simulated number of individuals in each group).
#' @seealso [`rate_effect()`] and [`rate2_power_analysis()`]
#' @export
#'
#' @examples
#' set.seed(99)
#' rate_sim(0.9, 10)
#' set.seed(99)
#' rate_sim(0.9, 10)
#' rate_sim(0.9, 10)
#' set.seed(100)
#' rate_sim(c(0.9, 0.3), 20)
rate_sim <- function(p, n) {
  
  chk_vector(p)
  chk_vector(n)
  chk_numeric(p)
  chk_whole_numeric(n)
  check_dim(n, values = c(1, length(p)))
  chk_range(p)
  chk_gte(n)
  
  # need to make column for each value in 
  if(!length(p)) {
    return(tibble::tibble(group = factor(), p = numeric(0), n = integer(0), r = integer(0)))
  }
  
  if(length(n) == 1) {
    n <- round(n / length(p))
  }
  r <- stats::rbinom(length(p), n, p)
  tibble::tibble(group = factor(1:length(p)), p = p, n = n, r = r)
}
