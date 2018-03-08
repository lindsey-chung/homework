# Data Dictionary

This data is about the Golden State Warriors players Stephen Curry, Andre Iguodala, Kevin Durant, Klay Thompson, and Draymond Green. It takes note of many aspects of each shot taken. See below for a description of the variables

### Original Variables
1. team_name - character
2. game_date - character
3. season - integer, 2016
4. period - integer, 1:4 depending on what quarter the shot was taken in
5. minutes_remaining - integer, the number of remaining minutes in the period
6. seconds_remaining - integer, the number of remaining seconds in the minute when the shot was taken
8. shot_made_flag - character, either 'y' for shot made or 'n' for shot missed
9. action_type - specific style of shot taken
10. shot_type - character, either '2PT Field Goal' or '3PT Field Goal'
11. shot_distace - integer, distance in feet from basket when shot was taken
12. opponent - character, name of opposing team
13. x - integer, x-coordinate in inches on court where shot was taken
14. y - integer, y-coordinate in inches on court where shot was taken

### Added and Changed Variables
8. shot_made_flag - 'y' was changed to 'made shot' and 'n' was changed to 'missed shot'  
13\. name - name of player who was shooting  
14\. minute - overall minute of game when shot was taken