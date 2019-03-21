library(testthat)
source("functions.R")

context("Test for range value")
test_that("range works as expected",{
  x <- c(1, 2, 3, 4, 5)
  expect_equal(stat_range(x),4)
  expect_length(stat_range(x),1)
  expect_type(stat_range(x),"double")
})
test_that("range works as expected",{
  y <- c(1, 2, 3, 4, NA)
  expect_equal(stat_range(y),NA_real_)
  expect_length(stat_range(y),1)
  expect_type(stat_range(y),"double")
})
test_that("range works as expected",{
  z <- c(TRUE, FALSE, TRUE)
  expect_equal(stat_range(z),1L)
  expect_length(stat_range(z),1)
  expect_type(stat_range(z),"integer")
})
test_that("range works as expected",{
  w <- letters[1:5]
  expect_error(stat_range(w))
})

context("Test for centers")
test_that("centers work as expected",{
  x = c(1,2,3,4,5)
  expect_equal(stat_centers(x),c(3,3))
  expect_type(stat_centers(x),"double")
  expect_length(stat_centers(x),2)
})

test_that("centers work as expected",{
  y = c(TRUE,FALSE,TRUE,FALSE)
  expect_equal(stat_centers(y),c(0.5,0.5))
  expect_type(stat_centers(y),"double")
  expect_length(stat_centers(y),2)
})

context("Test for spreads")

test_that("spreads work as expected",{
  x = c(1,2,3,4,5)
  expect_equal(stat_spreads(x),c(4,2,sd(x)))
  expect_type(stat_spreads(x),"double")
  expect_length(stat_spreads(x),3)
})

