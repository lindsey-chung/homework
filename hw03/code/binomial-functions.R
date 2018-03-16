# ==============================================================
# Title: HW 03 Data Script
# Description: This script writes binomial probability functions
# Inputs
# Outputs: the following functions
#     is_integer()
#     is_positive()
#     is_nonnegative()
#     is_positive_integer()
#     is_nonneg_integer()
#     is_probability()
#     bin_factorial()
#     bin_combinations()
#     bin_probaility()
#     bin_distribution()
# Author: Lindsey Chung
# Date due: March 23, 2018
# ==============================================================

#' @title Integer Test
#' @description tests if the input is an integer or not
#' @param x
#' @return TRUE or FALSE
is_integer = function(x) {
  if (x %% 1 == 0) {
    return (TRUE)
  } else {
    return(FALSE)
  }
}

#' @title Positivity Test
#' @description tests if the input is positive or not
#' @param x
#' @return TRUE or FALSE
is_positive = function(x) {
  if (x > 0) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

#' @title Non-Negativity Test
#' @description tests if the input is not negative
#' @param x
#' @return TRUE or FALSE
is_nonnegative = function(x) {
  if (x < 0){
    return(FALSE)
  } else {
    return(TRUE)
  }
}

#' @title Positive Integer Test
#' @description tests if the input is a positive integer
#' @param x
#' @return TRUE or FALSE
is_positive_integer = function(x) {
  if (is_positive(x) == TRUE & is_integer(x) == TRUE) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

#' @title Non-Negative Integer Test
#' @description tests if the input is a non-negative integer
#' @param x
#' @return TRUE or FALSE
is_nonneg_integer = function(x) {
  if (is_nonnegative(x) == TRUE & is_integer(x) == TRUE) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

#' @title Probability Test
#' @description tests if the input is a valid probability value
#' @param x
#' @return TRUE or FALSE
is_probability = function(x) {
  if (x <= 1 & x >= 0) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

#' @title Factorial
#' @description finds the factorial of the input
#' @param x, a non-negative integer
#' @return the factorial
bin_factorial = function(x) {
  if (x == 0) {
    return(1)
  } else {
    fact = 1
    for (i in 1:x) {
      fact = fact * i
    }
    return(fact)
  }
}

#' @title Combinations
#' @description finds the number of combinations of k successes in n trials
#' @param n, k
#' @return the number of combinations
bin_combinations = function(n, k) {
  bin_factorial(n) / (bin_factorial(k) * bin_factorial(n-k))
}

#' @title Binomial Probability
#' @description finds the probability of getting a certain number
#'              of successes in a number of trials
#' @param trials, success, prob
#' @return probability
bin_probability = function(trials, success, prob) {
  if (is_nonneg_integer(trials) == FALSE) {
    stop('number of trials must be a non-negative integer')
  } else if (is_nonneg_integer(success) == FALSE) {
    stop('number of successes must be a non-negative integer')
  } else if (is_probability(prob) == FALSE) {
    stop('probability must be a value in [0, 1]')
  } else {
    bin_combinations(trials, success) * prob^success * (1 - prob)^(trials - success)
  }
}

#' @title Binomial Distribution
#' @description shows the probabilities of different numbers of successes
#' @param trials, prob
#' @return a data frame of numbers of successes and their probabilities
bin_distribution = function(trials, prob) {
  success = c(0:trials)
  probability = rep(0, trials)
  for (i in 1:(trials + 1)) {
    probability[i] = bin_probability(trials, i-1, prob)
  }
  cbind(success, probability)
}
