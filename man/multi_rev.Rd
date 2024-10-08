% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mfi_calc.R
\name{multi_rev}
\alias{multi_rev}
\title{Reverses relevant MFI subscores}
\usage{
multi_rev(d, var)
}
\arguments{
\item{d}{data frame or tibble}

\item{var}{numeric vector of indices of columns to reverse}
}
\value{
data.frame or tibble depending on input
}
\description{
Reverses relevant MFI subscores
}
\examples{
# rep_len(sample(1:5),length.out = 100) |> matrix(ncol=10) |> multi_rev(2:4)
}
