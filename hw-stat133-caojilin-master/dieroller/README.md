
<!-- README.md is generated from README.Rmd. Please edit that file -->
Overview
--------

`"dieroller"` is a minimal [R](http://www.r-project.org/) package that provides functions to simulate rolling a die.

-   `die()` creates a die object (of class `"die"`)
-   `roll()` rolls a die object, producing a `"roll"` object.
-   `plot()` method for a `"roll"` object to plot frequencies of heads.
-   `summary()` method for a `"roll"` object.

Motivation
----------

This package has been developed to illustrate some of the concepts behind the creation of an R package.

Installation
------------

Install the development version from GitHub via the package `"devtools"`:

``` r
# development version from GitHub:
#install.packages("devtools") 

# install "cointoss" (without vignettes)
devtools::install_github("gastonstat/cointoss")

# install "cointoss" (with vignettes)
devtools::install_github("gastonstat/cointoss", build_vignettes = TRUE)
```

Usage
-----

``` r
library(dieroller)

# default die
die1 <- die()
die1
#> object 'die'
#> 
#> $side
#> [1] 1 2 3 4 5 6
#> 
#> $prob
#> [1] 0.1666667 0.1666667 0.1666667 0.1666667 0.1666667 0.1666667

# 1 roll of die1
roll(die1)
#> object "roll"
#> 
#> [1] 6

# 10 rolls of die1
roll10 <- roll(die1, times = 10)
roll10
#> object "roll"
#> 
#>  [1] 1 3 5 3 5 2 6 4 4 1

# summary
summary(roll10)
#> summary "roll"
#> 
#>   side count prop
#> 1    1     2  0.2
#> 2    2     1  0.1
#> 3    3     2  0.2
#> 4    4     2  0.2
#> 5    5     2  0.2
#> 6    6     1  0.1


# 100 rolls
roll100 <- roll(die1, times = 100)

# summary
summary(roll100)
#> summary "roll"
#> 
#>   side count prop
#> 1    1    14 0.14
#> 2    2    13 0.13
#> 3    3    14 0.14
#> 4    4    20 0.20
#> 5    5    15 0.15
#> 6    6    24 0.24
```
