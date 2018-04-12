# ==========================================================================
# Title: Regex Functions
# Description: This script writes some regex functions.
# Inputs: 
# Outputs: the following functions
#             split_chars()
#             num_vowels()
#             count_vowels()
#             reverse_chars()
#             reverse_words()
# Author: Lindsey Chung
# Date: April 13, 2018
# ==========================================================================

library(stringr)

#' @title Split Character
#' @description splits all characters of input into single character elements
#' @param string string to be split
#' @return vector of single character elements
split_chars = function (string) {
  list = str_extract_all(string = string, pattern = '.')
  return(list[[1]])
}


#' @title Number of Vowels
#' @description counts number of each vowel
#' @param vec vector with each element a single character
#' @return numeric vector of number of vowels
num_vowels = function (vec) {
  count = c(0, 0, 0, 0, 0)
  vowels = c('a', 'e', 'i', 'o', 'u')
  names(count) = vowels
  for (i in 1:length(vec)) {
    if (str_detect(vec[i], 'a|A')) {
      count[1] = count[1] + 1
    } else if (str_detect(vec[i], 'e|E')) {
      count[2] = count[2] + 1
    } else if (str_detect(vec[i], 'i|I')) {
      count[3] = count[3] + 1
    } else if (str_detect(vec[i], 'o|O')) {
      count[4] = count[4] + 1
    } else if (str_detect(vec[i], 'u|U')) {
      count[5] = count[5] + 1
    }
  }
  return(count)
}

#' @title Counting Vowels
#' @description counts number of each vowel
#' @param string string of characters
#' @return numeric vector of number of vowels
count_vowels = function (string) {
  num_vowels(split_chars(string))
}

#' @title Reversing Characters
#' @description reverses the string by character
#' @param string string of characters
#' @return character vector with reversed characters
reverse_chars = function (string) {
  reverse = character(0)
  split_string = split_chars(string)
  for (i in 1:length(split_string)) {
    reverse = paste0(reverse, split_string[length(split_string) - (i - 1)])
  }
  return(reverse)
}

#' @title Reversing Sentences by Words
#' @description reverses the string by word
#' @param string string of characters (a sentence)
#' @return character vector with reversed words
reverse_words = function (string) {
  split_string = str_split(string, ' ')[[1]]
  reverse = character(0)
  for (i in 1:length(split_string)) {
    reverse = paste(reverse, split_string[length(split_string) - (i - 1)])
  }
  reverse = str_sub(reverse, start = 2, end = -1)
  return(reverse)
}
