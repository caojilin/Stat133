context("check roll arguments")

test_that("check_times with ok values",{
  expect_true(check_times(50))
})

test_that("check_times with negative values",{
  expect_error(check_times(-5))
})

test_that("check_times with decimal numbers",{
  expect_error(check_times(3.1))
})

context("test roll")

test_that("test roll is correct",{
  expect_is(roll(die(),50), "roll")
})

test_that("test summary is correct",{
  expect_equal(sum(summary(roll(die(),5))$freqs$prop), 1 )
  roll5 = roll(die(),5)
  sum1 = summary(roll5)
  expect_equal(length(sum1$freqs$side),length(sum1$freqs$prop))
})

test_that("test summary.roll is correct",{
  expect_is(summary(roll(die(),50)), "summary.roll")
})
