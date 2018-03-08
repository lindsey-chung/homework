# ==============================================================
# Title: HW 02 Shot Charts Script
# Description: This script creates shot charts.
# Inputs: data files 'andre-iguodala.csv', 'draymond-green.csv',
#     'kevin-durant.csv', 'klay-thompson.csv',
#     'stephen-curry.csv'
# Output: 'andre-iguodala-shot-chart.pdf',
#     'draymond-green-shot-chart.pdf',
#     'kevin-durant-shot-chart.pdf',
#     'klay-thompson-shot-chart.pdf',
#     'stephen-curry-shot-chart.pdf'
# Author: Lindsey Chung
# Date due: March 9th, 2018
# ==============================================================

library(ggplot2)
library(jpeg)
library(grid)

# Court image
court_file = '../images/nba-court.jpeg'
court_image = rasterGrob(
  readJPEG(court_file),
  width = unit(1, 'npc'),
  height = unit(1, 'npc')
)

# Shot charts
iguodala_shot_chart = ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()

green_shot_chart = ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()

durant_shot_chart = ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()

thompson_shot_chart = ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()

curry_shot_chart = ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()

# Save to images/
pdf(file = '../images/andre-iguodala-shot-chart.pdf',
    width = 6.5, height = 5)
iguodala_shot_chart
dev.off()

pdf(file = '../images/draymond-green-shot-chart.pdf',
    width = 6.5, height = 5)
green_shot_chart
dev.off()

pdf(file = '../images/kevin-durant-shot-chart.pdf',
    width = 6.5, height = 5)
durant_shot_chart
dev.off()

pdf(file = '../images/klay-thompson-shot-chart.pdf',
    width = 6.5, height = 5)
thompson_shot_chart
dev.off()

pdf(file = '../images/stephen-curry-shot-chart.pdf',
    width = 6.5, height = 5)
curry_shot_chart
dev.off()

# Facetted shot chart
gsw_shot_chart = ggplot(data = shots) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') +
  facet_wrap(~ name) +
  theme_minimal()

pdf(file = '../images/gsw-shot-charts.pdf',
    width = 8, height = 7)
gsw_shot_chart
dev.off()
