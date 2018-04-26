# ===================================================================
# Title: Die Functions
# Description: This script writes the die functions
# Output: functions that simulate making a die
# Author: Lindsey Chung
# Date: April 27, 2018
# ===================================================================


#' @title Die
#' @description creates a die and prints its info
#' @param sides vector of sides
#' @param prob vector of probabilities
#' @return printed die output
#' @export
#' @examples
#' # default
#' die1 = die()
#'
#' # funky die
#' color_die = die(sides = c('red', 'orange', 'yellow', 'green', 'blue', 'purple'))
#'
#' # loaded die
#' loaded = die(prob = c(0.1, 0.1, 0.1, 0.1, 0.1, 0.5))
#'
die = function(sides = c(1:6), prob = rep(1/6, 6)) {
  check_sides(sides)
  check_prob(prob)
  my_die = list(sides = sides, prob = prob)
  class(my_die) = 'die'
  return(my_die)
}



# private function to check vector of sides
check_sides = function (sides){
  if (length(sides) != 6) {
    stop("'sides' must be a vector of length 6")
  } else if (!is.numeric(sides) & !is.character(sides)) {
    stop("'sides' must be a character or numeric vector")
  } else {
    TRUE
  }
}



# private function to check vector of probabilities
check_prob = function (prob) {
  if (sum(prob) != 1) {
    stop("elements in 'prob' must add up to 1")
  } else if (length(prob) != 6 | !is.numeric(prob)) {
    stop("'prob' must be a numeric vector of length 6")
  } else if (any(prob < 0) | any(prob > 1)) {
    stop("'prob' values must be between 0 and 1")
  } else if (any(is.na(prob))) {
    stop("'prob' cannot contain missing values")
  } else {
    TRUE
  }
}



#' @export
print.die = function (die) {
  cat('object "die"', '\n\n')
  print(data.frame(die[1], die[2]))
}
