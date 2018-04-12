# ==========================================================================
# Title: Archive Functions
# Description: This script cleans messy data from HTML tables.
# Inputs: output of read_archive()
# Outputs: functions that will return a clean table and plot size over time
# Author: Lindsey Chung
# Date: April 13, 2018
# ==========================================================================

library(XML)
library(stringr)
library(ggplot2)

#' @title read archive
#' @description reads data about archived packages from r-project
#' @param pkg name of package
#' @return messy list of data
read_archive = function (pkg) {
  readHTMLTable(paste0('http://cran.r-project.org/src/contrib/Archive/', pkg), stringsAsFactors = FALSE)
}

get_name = function (x) {
  name = str_extract(x[[1]][ , 2], pattern = '[a-z]+|[A-Z]+')
  name = name[4:length(name) - 1]
  return(name)
}

get_version = function (x) {
  version = str_extract(x[[1]][ , 2], pattern = '[0-9](\\.[0-9]+)+')
  version = version[4:length(version) - 1]
  return(version)
}

get_date = function (x) {
  date = str_sub(x[[1]][ , 3], start = 1, end = 10)
  date = date[4:length(date) - 1]
  return(date)
}

get_size = function (x) {
  which_mb = str_detect(x[[1]][ , 4], pattern = 'M')
  which_mb = which_mb[4:length(which_mb) - 1]
  size_mb = 1000 * as.numeric(str_extract(x[[1]][ , 4], pattern = '[0-9]+\\.[0-9]+'))
  size_mb = size_mb[4:length(size_mb) - 1]
  which_decimal = str_detect(x[[1]][ , 4], pattern = '\\.')
  which_decimal = which_decimal[4:length(which_decimal) - 1]
  size_decimal = str_extract(x[[1]][ , 4], pattern = '[0-9]+\\.[0-9]+')
  size_decimal = size_decimal[4:length(size_decimal) - 1]
  size = str_extract(x[[1]][ , 4], pattern = '[0-9]+')
  size = size[4:length(size) - 1]
  size[which_decimal] = size_decimal[which_decimal]
  size[which_mb] = size_mb[which_mb]
  size = as.numeric(size)
  size = round(size, 3)
  return(size)
}

#' @title clean archive
#' @description cleans the data about package archives
#' @param x messy list of data
#' @return clean data frame
clean_archive = function (x) {
  clean_data = data.frame(name = character(length(x[[1]][ , 2]) - 3))
  clean_data$name = get_name(x)
  clean_data$version = get_version(x)
  clean_data$date = as.Date(get_date(x))
  clean_data$size = get_size(x)
  return(clean_data)
}

#' @title plot archive
#' @description plots the data in a timeline of date and size
#' @param dat clean data
#' @return plot
plot_archive = function (dat) {
  ggplot(data = dat) +
    geom_point(aes(x = date, y = size, color = 'orange'), show.legend = FALSE) +
    geom_step(aes(x = date, y = size, color = 'orange', alpha = 0.2), show.legend = FALSE) +
    theme_minimal() +
    labs(y = 'size (kilobytes)', title = 'Timeline of Version Sizes')
}



