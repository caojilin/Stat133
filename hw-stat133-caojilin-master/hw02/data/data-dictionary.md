1 This is a collection of data sets about Golden State Warriors's players' data.

2 sources: data sets come from class's github.


3 These are the descriptions of variables. 
• period: an NBA game is divided in 4 periods of 12 mins each. For example, a value
			for period = 1 refers to the first period (the first 12 mins of the game).
• minutes_remaining and seconds_remaining have to do with the amount of time in
			minutes and seconds, respectively, that remained to be played in a given period.
• shot_made_flag indicates whether a shot was made (y) or missed (n).
• action_type has to do with the basketball moves used by players, either to pass by
			defenders to gain access to the basket, or to get a clean pass to a teammate to score a
			two pointer or three pointer.
• shot_type indicates whether a shot is a 2-point field goal, or a 3-point field goal.
• shot_distance: distance to the basket (measured in feet).
• x and y refer to the court coordinates (measured in inches) where a shot occurred .

4 All raw tables have such information as below
No missing values
13 variables:

 $ team_name        : chr  "Golden State Warriors" "Golden State Warriors" "Golden State Warriors" "Golden 							  State Warriors" ...
 $ game_date        : chr  "12/15/16" "10/28/16" "11/1/16" "12/1/16" ...
 $ season           : int  2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 ...
 $ period           : int  3 3 2 3 3 4 3 2 3 3 ...
 $ minutes_remaining: int  3 9 5 5 2 5 9 1 10 3 ...
 $ seconds_remaining: int  51 14 8 27 4 36 51 40 59 54 ...
 $ shot_made_flag   : chr  "y" "y" "y" "y" ...
 $ action_type      : chr  "Cutting Finger Roll Layup Shot" "Cutting Finger Roll Layup Shot" "Cutting Finger 			 			   Roll Layup Shot" "Cutting Finger Roll Layup Shot" ...
 $ shot_type        : chr  "2PT Field Goal" "2PT Field Goal" "2PT Field Goal" "2PT Field Goal" ...
 $ shot_distance    : int  3 2 2 0 2 0 0 2 1 1 ...
 $ opponent         : chr  "New York Knicks" "New Orleans Pelicans" "Portland Trail Blazers" "Houston 								  Rockets" ...
 $ x                : int  25 9 -22 2 1 2 -1 28 13 -9 ...
 $ y                : int  21 26 2 7 26 7 2 0 6 8 ...


