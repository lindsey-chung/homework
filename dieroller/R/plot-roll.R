# ===================================================================
# Title: Plot Roll Functions
# Description: This script writes the plot functions for roll objects
# Output: functions that plot roll objects
# Author: Lindsey Chung
# Date: April 27, 2018
# ===================================================================


#' @title Plot Roll Objects
#' @description plots the relative frequencies of a series of rolls
#' @param roll an object of class 'roll'
#' @export
#' @examples
#' # Create a die and toss it 100 times
#' die1 = die()
#' roll100 = roll(die1, times = 100)
#' # Plot the frequencies
#' plot(roll100)
plot.roll = function (roll) {
  barplot(frequencies(roll),
          names.arg = roll$sides,
          xlab = 'sides of die',
          ylab = 'relative frequencies',
          col = 'grey80',
          border = NA)
  title(sprintf('Relative Frequencies in a Series of %s Die Rolls', roll$total))
}



# Private Function
frequencies = function (roll) {
  freq = rep(0, 6)
  for (i in 1:6) {
    freq[i] = sum(roll$rolls == roll$sides[i]) / roll$total
  }
  return (freq)
}

