# ===================================================================
# Title: Roll Functions
# Description: This script writes the roll functions
# Output: functions that simulate die rolling
# Author: Lindsey Chung
# Date: April 27, 2018
# ===================================================================


#' @title Roll a Die
#' @description rolls an object of class "die"
#' @param die an object of class die
#' @param times number of rolls
#' @return an object of class "rolls"
#' @export
#' @examples
#' die1 = die()
#'
#' # Default
#' roll10 = roll(die1, times = 10)
#'
#' # add 5 more rolls
#' roll15 = roll10 + 5
#'
roll = function (die, times = 1) {
  check_times(times)
  if (class(die) != 'die') {
    stop("roll() requires an object of class 'die'")
  }
  the_rolls = rolling(die, times = times)
  make_roll(die, the_rolls)
}



# private funciton to check times
check_times = function (times) {
  if (times %% 1 != 0 | times < 1) {
    stop("'times' must be an integer value of at least one")
  } else{
    TRUE
  }
}


# private function
rolling = function (x, times = 1) {
  sample(x$sides, size = times, replace = TRUE, prob = x$prob)
}



#' @title Make Roll Object
#' @description Constructor function for object "roll"
#' @param die object of class die
#' @param times integer number of rolls
#' @keywords internal
make_roll = function (die, the_rolls) {
  res = list(
    rolls = the_rolls,
    sides = die$sides,
    prob = die$prob,
    total = length(the_rolls)
  )
  class(res) = 'roll'
  return(res)
}



#' @export
print.roll = function (roll) {
  cat('object "roll"', '\n\n')
  print(roll$rolls)
}



#' @export
summary.roll = function (roll, ...) {
  proportions = rep(0, 6)
  for (i in 1:6) {
    proportions[i] = sum(roll$rolls == roll$sides[i]) / roll$total
  }
  counts = rep(0, 6)
  for (i in 1:6) {
    counts[i] = sum(roll$rolls == roll$sides[i])
  }
  freqs = data.frame(
    side = roll$sides,
    count = counts,
    prop = proportions
  )
  obj = list(freqs = freqs)
  class(obj) = 'summary.roll'
  obj
}



#' @export
print.summary.toss = function (summary) {
  cat('summary "roll"', '\n\n')
  print(summary[[1]])
}



#' @export
'[.roll' = function (roll, i) {
  roll$rolls[i]
}



#' @export
'[<-.roll' = function (roll, i, value) {
  if (!(value %in% roll$sides)) {
    stop('replacement value must be one of the sides')
  } else if (i > roll$total) {
    stop('index out of bounds')
  }
  roll$rolls[i] = value
  make_roll(die(sides = roll$sides, prob = roll$prob), roll$rolls)
}



#' @export
'+.roll' = function (roll, add_rolls) {
  if (add_rolls %% 1 != 0 | add_rolls < 1) {
    stop('number of added rolls must be an integer value of at least one')
  }
  roll$rolls = append(roll$rolls, sample(roll$sides, size = add_rolls, replace = TRUE, prob = roll$prob))
  new_roll = make_roll(die(sides = roll$sides, prob = roll$prob), roll$rolls)
  new_roll
}

