context('checking check_sides()')


test_that('check_sides() with okay vectors', {
  expect_true(check_sides(c('a', 'b', 'c', 'd', 'e', 'f')))
  expect_true(check_sides(c(2:7)))
})


test_that('check_sides() fails with invalid lengths', {
  expect_error(check_sides(1:4))
  expect_error(check_sides('one', 'two'))
})


test_that('check_sides() fails with invalid types', {
  expect_error(check_sides(TRUE, FALSE, NULL, NA, TRUE, FALSE))
})




context('checking check_prob()')


test_that('check_prob() works with okay vectors', {
  expect_true(check_prob(rep(1/6, 6)))
  expect_true(check_prob(c(0.1, 0.1, 0.1, 0.1, 0.1, 0.5)))
  expect_true(check_prob(c(0, 0, 0, 0, 0, 1)))
})


test_that('check_prob() fails with invalid length or type', {
  expect_error(check_prob(rep(1/4, 4)))
  expect_error(check_prob(rep('one sixth', 6)))
  expect_error(check_prob(1))
  expect_error(check_prob(c(0.25, 0.25, 0.25, 0.25, NA, NA)))
})


test_that('check_prob fails with invalid numbers', {
  expect_error(check_prob(c(2, 2, 2, -2, -2, -1)))
  expect_error(check_prob(c(0.1, 0.1, 0.1, 0.1, 0.1, 0.4)))
  expect_error(check_prob(c(-1/4, 1/4, 1/4, 1/4, 1/4, 1/4)))
  expect_error(check_prob(c(rep(0.5, 6))))
})


context('checking check_times()')


test_that('check_times() works with okay values', {
  expect_true(check_times(1))
  expect_true(check_times(826))
})


test_that('check_times() fails with invalid values', {
  expect_error(check_times('one'))
  expect_error(check_times(NA))
  expect_error(check_times(9.5))
  expect_error(check_times(-10))
})


