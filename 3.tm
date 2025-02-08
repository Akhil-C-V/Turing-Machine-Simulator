#Initial Stage
#Sets first letter as X as a counter to mark the first spot
#If its blank, TM reaches a halting state because everything has a space now
0 a 1 X R
0 b 2 X R
0 B -3 B R

#Stage 1
#The TM goes to stage 2 if the first character is an "a" and cycles through the entire input until it reaches a blank spot where the TM goes to stage 3
1 a 1 a R
1 b 1 b R
1 B 3 B R

#stage 2
#The TM goes to stage 2 if the selected character is a "b" and cycles through the entire input until it reaches a blank spot where the TM goes to stage 4
2 a 2 a R
2 b 2 b R
2 B 4 B R

#stage 3
#The TM goes to stage 3 if the selected character is an a
#If the spot is blank then a will be printed and the TM goes to stage 5
#If there is a character taking the spot then the TM goes to stage 6
3 B 5 a R
3 a 6 a R
3 b 6 b R

#stage 4
#The TM is in stage 4 when the selected character is an "b"
#If the current spot is blank then "b" will be printed and the TM goes to stage 5
#If there is a character taking the spot then the TM goes to stage 7
4 B 5 b R
4 a 7 a R
4 b 7 b R

#stage 5
#The TM goes to stage 5 when "a" or "b" has been printed
#This stage is cycles the tape back to the beginning until it reaches the "X" (the new first character)
5 a 5 a L
5 b 5 b L
5 B 5 B L
5 X 0 B R

#stage 6
#The TM is in stage 6 when the selected character is an "a"
#Stage 6 is a skipping stage where it moves the tape to the right because a character is taking the spot and then the TM goes back to stage 3 to print "a"
6 B 3 B R

#stage 7
#The TM is in stage 7 when the selected character is a "b"
#Stage 7 is a skipping stage where it moves the tape to the right because a character is taking the spot and the TM goes back to stage 4 to print "b"
7 B 4 B R

