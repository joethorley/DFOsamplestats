#' Plot Density for Beta Distribution
#'
#' @inheritParams params
#'
#' @export
#'
#' @examples
#' plot_dbeta()
#' plot_dbeta(10, 10)
plot_dbeta <- function(alpha = 1, beta = 1) {
  data <- data.frame(x = seq(0, 1, length.out = 100))
  data$y <- stats::dbeta(data$x, shape1 = alpha, shape2 = beta)
  plot(y ~ x, data = data, type = "l", ylab = "Probability Density", xlab = "Rate")
}
