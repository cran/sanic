% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/solve.R
\name{solve2}
\alias{solve2}
\title{Solve Systems of Equations}
\usage{
solve2(a, b, ...)
}
\arguments{
\item{a}{Square numeric matrix with the coefficients of the linear system.
Both dense and sparse matrices are supported (see \code{\link{sparsify}}).}

\item{b}{Numeric vector or matrix at the right-hand side of the linear
system. If missing, 'b' is set to an identity matrix and 'a' is
inverted.}

\item{...}{Dispatched to methods in the solvers.}
}
\value{
Solves for \eqn{x} and returns a numeric matrix with the results.
}
\description{
Solve systems of equations \eqn{Ax = b}{Ax = b} using an automatically
chosen direct method (see \code{\link{solve_chol}}). Methods are chosen for
speed at reasonable accuracy. Please choose a suitable method manually if
numerical stability is the main consideration.
}
\examples{
set.seed(42)
x <- rnorm(3)

# Solve using a general matrix
A <- matrix(rnorm(9), nrow = 3, ncol = 3)
b <- A \%*\% x
norm(solve2(A, b) - x)

# Solve using a symmetric matrix
A <- crossprod(matrix(rnorm(9), nrow = 3, ncol = 3))
b <- A \%*\% x
norm(solve2(A, b) - x)

# Solve using a square matrix
A <- matrix(rnorm(12), nrow = 4, ncol = 3)
b <- A \%*\% x
norm(solve2(A, b) - x)

}
