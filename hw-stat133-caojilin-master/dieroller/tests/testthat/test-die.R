context("Check die arguments")

test_that("check_sides with ok vectors", {

  expect_true(check_sides(c('i', 'ii', 'iii', 'iv', 'v', 'vi')))

})


test_that("check_sides fails with invalid lengths", {

  expect_error(check_sides(c('a', 'b', 'c', 'd', 'e')))

})


test_that("check_sides fails with invalid types", {

  expect_error(check_sides(c(F,T,F,T,F,T)))

})

test_that("check_prob with ok vectors", {

  expect_true(check_prob(c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35)))

})



test_that("check_prob fails with invalid lengths", {

  expect_error(check_prob(rep(1/7,7)))

})


test_that("check_prob fails with invalid numbers", {

  expect_error(check_prob(c(0.2, 0.1, 0.1, 0.1, 0.5, 0.1)))

})

context("test a die")

test_that("test a die",{
  expect_is(die(), "die")
  expect_equal(sum(die()$prob), 1)
  die1 = die()
  expect_equal(length(die1$side),length(die1$prob))
})
