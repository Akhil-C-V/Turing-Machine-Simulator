#Initial state
#This state checks the 1st character and if its an "a" then it replaces it with "A" as a marker for the first character in the duplication and the TM goes to state 1
#If the 1st character is an "b" then it replaces it with "Z" as a marker for the first character in the duplication and the TM goes to state 2

0 a 1 A R
0 b 2 Z R

#state 1
#The TM goes to state 1 if the 1st character is an "a"
#This is a cycle state, which goes until the end of the tape and then marks the 1st blank as a "X" to remember the spot as an "a"

1 a 1 a R
1 b 1 b R
1 B 3 X L

#state 2
#The TM goes to state 1 if the 1st character is an "b"
#This is a cycle state, which goes until the end of the tape and then marks the 1st blank as a "Y" to remember the spot as an "b"

2 a 2 a R
2 b 2 b R
2 B 3 Y L

#state 3
#Both state 1 and 2 go to state 3, which goes to the front of the tape
#When the TM reaches the front of the tape it  prints the initial marker as the original letter "a" or "b" and goes to state 4

3 a 3 a L
3 b 3 b L
3 X 3 X L
3 Y 3 Y L
3 A 4 a R
3 Z 4 b R

#state 4
#This state decides if the next character is an "a" or "b" and sets them as the marker "A" or "Z", similar to the initial state
#If the marker is an "X" or "Y" then the tape has reached the end of the input and can now halt

4 a 5 A S
4 b 6 Z S
4 X -3 a S
4 Y -3 b S

#state 5
#The TM goes to state 5 if the new marker is for an "a" and then cycles to the end of the tape where it fills the blank with the "a" 
#When it reaches the back of the tape and prints "a" the TM then goes back to state 3 where it cycles back to the beginning

5 a 5 a R
5 b 5 b R
5 X 5 X R
5 Y 5 Y R
5 B 3 a L

#state 6
#The TM goes to state 5 if the new marker is for an "a" and then cycles to the end of the tape where it fills the blank with the "a"
#When it reaches the back of the tape and prints "b" the TM then goes back to state 3 where it cycles back to the beginning
 
6 a 6 a R
6 b 6 b R
6 X 6 X R
6 Y 6 Y R
6 B 3 b L

