context('checking die()')


test_that('die() creates the correct object', {
  expect_is(die(), 'die')
  expect_type(die(), 'list')
  expect_length(die(), 2)
  expect_named(die()[1], 'sides')
  expect_named(die()[2], 'prob')
})



context('checking roll()')


test_that('roll() creates the correct object', {
  expect_is(roll(die(), times = 10), 'roll')
  expect_type(roll(die(), times = 10), 'list')
  expect_length(roll(die(), times = 10), 4)
})
