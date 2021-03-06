% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/solve_iterative.R
\name{solve_cg}
\alias{solve_cg}
\title{Solve a System of Equations using Iterative Methods}
\usage{
solve_cg(
  a,
  b,
  x0,
  type = c("BiCGSTAB", "LSCG", "CG"),
  tol,
  iter,
  verbose = FALSE
)
}
\arguments{
\item{a}{Square numeric matrix with the coefficients of the linear system.
Both dense and sparse matrices are supported (see \link{sparsify}).}

\item{b}{Numeric vector or matrix at the right-hand side of the linear
system. If missing, 'b' is set to an identity matrix and 'a' is
inverted.}

\item{x0}{Numeric vector or matrix with an initial guess. Must be of the
same dimension as 'b'.}

\item{type}{Character scalar. Whether to use the BiCGSTAB, least squares
CG or classic CG method.}

\item{tol}{Numeric scalar with the desired tolerance. Defaults to the
machine precision.}

\item{iter}{Integer scalar with the maximum number of iterations. Defaults
to the theoretical maximum, i.e. the number of columns in 'a'.}

\item{verbose}{Logical scalar. Whether to print iterations and tolerance.}
}
\value{
Solves for \eqn{x} and returns a numeric matrix with the results.
}
\description{
Function to use Conjugate Gradient (CG) methods to solver systems of
equations.
}
\examples{
# Solve via least squares or bi-conjugate gradient methods
A <- matrix(rnorm(9), nrow = 3, ncol = 3)
# The matrix A should be of class 'dgCMatrix' (otherwise it is converted)
A <- sparsify(A)
x <- rnorm(3)
b  <- A \%*\% x

x_bi <- solve_cg(A, b)
x_ls <- solve_cg(A, b, type = "LS")

# Solve via conjugate gradient for symmetric matrices
AA <- A \%*\% A
b <- AA \%*\% x
x_cg <- solve_cg(AA, b, type = "CG")

}
