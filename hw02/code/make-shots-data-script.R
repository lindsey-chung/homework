# ==============================================================
# Title: HW 02 Data Script
# Description: This script prepares the basketball shot data.
# Inputs: data files 'andre-iguodala.csv', 'draymond-green.csv',
#     'kevin-durant.csv', 'klay-thompson.csv',
#     'stephen-curry.csv'
# Output: shots-data-summary.txt
# Author: Lindsey Chung
# Date due: March 9th, 2018
# ==============================================================

# Make data frames
iguodala = read.csv('../data/andre-iguodala.csv', stringsAsFactors = FALSE)
green = read.csv('../data/draymond-green.csv', stringsAsFactors = FALSE)
durant = read.csv('../data/kevin-durant.csv', stringsAsFactors = FALSE)
thompson = read.csv('../data/klay-thompson.csv', stringsAsFactors = FALSE)
curry = read.csv('../data/stephen-curry.csv', stringsAsFactors = FALSE)

# Add name column
iguodala$name = rep('Andre Iguodala', nrow(iguodala))
green$name = rep('Draymond Green', nrow(green))
durant$name = rep('Kevin Durant', nrow(durant))
thompson$name = rep('Klay Thompson', nrow(thompson))
curry$name = rep('Stephen Curry', nrow(curry))

# Make shot_made_flag more descriptive
iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] = 'made shot'
iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] = 'missed shot'
green$shot_made_flag[green$shot_made_flag == 'y'] = 'made shot'
green$shot_made_flag[green$shot_made_flag == 'n'] = 'missed shot'
durant$shot_made_flag[durant$shot_made_flag == 'y'] = 'made shot'
durant$shot_made_flag[durant$shot_made_flag == 'n'] = 'missed shot'
thompson$shot_made_flag[thompson$shot_made_flag == 'y'] = 'made shot'
thompson$shot_made_flag[thompson$shot_made_flag == 'n'] = 'missed shot'
curry$shot_made_flag[curry$shot_made_flag == 'y'] = 'made shot'
curry$shot_made_flag[curry$shot_made_flag == 'n'] = 'missed shot'

# Add minute column
iguodala$minute = 12 * iguodala$period - iguodala$minutes_remaining
green$minute = 12 * green$period - green$minutes_remaining
durant$minute = 12 * durant$period - durant$minutes_remaining
thompson$minute = 12 * thompson$period - thompson$minutes_remaining
curry$minute = 12 * curry$period - curry$minutes_remaining

# Sink summaries to output/
sink(file = '../output/andre-iguodala.summary.txt')
summary(iguodala)
sink()

sink(file = '../output/draymond-green-summary.txt')
summary(green)
sink()

sink(file = '../output/kevin-durant-summary.txt')
summary(durant)
sink()

sink(file = "../output/klay-thompson-summary.txt")
summary(thompson)
sink()

sink(file = '../output/stephen-curry-summary.txt')
summary(curry)
sink()

# Stack tables
shots = rbind(iguodala, green, durant, thompson, curry)

# Send to data/
write.csv(
  shots,
  '../data/shots-data.csv'
)

# Sink summary to output/
sink('../output/shots-data-summary.txt')
summary(shots)
sink()
