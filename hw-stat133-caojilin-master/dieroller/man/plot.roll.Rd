% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot-roll.R
\name{plot.roll}
\alias{plot.roll}
\title{Plot of object roll}
\usage{
\method{plot}{roll}(object)
}
\arguments{
\item{object}{an object of class \code{"roll"}}
}
\description{
Plots the relative frequencies of a series of rolls
}
\examples{
 \dontrun{
 # create a die and roll it 50 times
 die1 <- die()
 roll50 <- roll(die1, times = 50)

 plot(roll50)
 }
}
