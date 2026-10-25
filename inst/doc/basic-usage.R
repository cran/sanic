## -----------------------------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(sanic)

## -----------------------------------------------------------------------------
A <- matrix(c(4, 1, 1, 3), nrow = 2)
b <- c(1, 2)
fits <- cbind(
  LU = solve_lu(A, b),
  QR = solve_qr(A, b),
  Cholesky = solve_chol(A, b),
  CG = solve_cg(sparsify(A), b, type = "CG", tol = 1e-10)
)
fits

# Check how closely each result reproduces b.
r <- A %*% fits - matrix(b, nrow = 2, ncol = ncol(fits))
sqrt(colSums(r^2)) / sqrt(sum(b^2))

## -----------------------------------------------------------------------------
X <- cbind(intercept = 1, time = 0:4)
y <- c(1, 2, 2, 4, 4)
cbind(
  QR = solve_qr(X, y),
  LSCG = solve_cg(sparsify(X), y, type = "LSCG", tol = 1e-10)
)

