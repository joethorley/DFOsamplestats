#' Pvalue to Svalue
#'
#' @param x A numeric vector of pvalues.
#'
#' @return A numeric vector of the equivalent svalues.
#' @export
#'
#' @examples
#' p2svalue(c(1, 0.5, 0.25, 0.05, 0.01, 0.001, 0.0001))
p2svalue <- function(x) {
  chk_numeric(x)
  chk_range(x)
  -log(x, base = 2)
}