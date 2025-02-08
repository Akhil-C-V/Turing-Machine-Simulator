# initial state
#This state checks the 1st character and if its an "a" then it replaces it with "A" as a marker
#If the 1st character is an "b" then it replaces it with "Z"
0 a 1 A R
0 b 1 Z R
0 B -2 B R

#This state checks the 2nd character and if its an "a" then it replaces it with "A" as a marker
#If the 1st character is an "b" then it replaces it with "Z"
1 a 2 A R
1 b 2 Z R
1 B -2 B L

#This state keeps everything the same and moves the tape to the left
2 a 3 a L
2 b 3 b L
2 B 3 B L

#This state changes the 2nd marker back to its original letter and moves to the tape to the right
3 Z 4 b R
3 A 4 a R

#This state does the same as state 2 but on the right half of the tape
5 B -2 B L
5 a 7 A L
5 b 7 Z L

#State 4 is a cycle state and moves the tape to the right
#If the tape is blank then it goes to state 6

4 a 5 a R
4 b 5 b R
4 B 6 B L

#This state helps us find the middle for separation of the input
#It changes the markers back to their original state
7 a 7 a L
7 b 7 b L
7 A 8 a R
7 Z 8 b R

#This state marks the 2nd half of the tape and places the respective marker depending on the letter
8 a 9 A R
8 b 9 Z R

#This is a cycle state used to find the 2nd character of the right half of the tape
9 a 9 a R
9 b 9 b R
9 A 2 A R
9 Z 2 Z R

#State 6 is used to find the middle to insert the "#"
6 a 10 B R
6 b 11 B R
6 A 13 a R
6 Z 13 b R

# This fills the blank and sends the TM to state 12 when there's an "a"
10 B 12 a L

# This fills the blank and sends the TM to state 12 when there's an "b"
11 B 12 b L

#This is a skipping state to skip blanks 
12 B 6 B L

#This places the "#" in the middle of the tape
13 B 14 # L

#This is a cycle state to take us to the start of the tape
#The TM is then to sent to state
14 a 14 a L
14 b 14 b L
14 B 15 B R

#This is a modified version of the solution from 4a


#initial state
#This marks "a" as x and goes to state 16
#This marks "b" as y and goes to state 17
15 a 16 x R
15 b 17 y R

#The TM goes to state 16 if the character was an "a"
#This is a cycle state where the TM keeps moving right until it hits a "#" where it then goes to state 18

16 a 16 a R
16 b 16 b R
16 # 18 # R

#The TM goes to state 16 if the character was a "b"
#This is a cycle state where the TM keeps moving right until it hits a "#" where it then goes to state 19

17 a 17 a R
17 b 17 b R
17 # 19 # R

#The TM goes to state 18 if the character was an "a"
#This checks the first character after "#"
#If the character is a "b" or "#" then the TM halts and rejects because it violates the properties of the given statement

18 a 20 x L
18 b -2 b L
18 # -2 # L
18 x 22 x R
18 y 22 y R

#The TM goes to state 19 if the character was an "b"
#This checks the first character after "#"
#If the character is a "a" or "#" then the TM halts and rejects because it violates the properties of the given statement

19 b 20 y L
19 a -2 a L
19 # -2 b L
19 x 23 x R
19 y 23 y R

#This is a cycle state where the tape keeps moving left until it hits one of the markers "x" or "y"

20 # 20 # L
20 a 20 a L
20 b 20 b L
20 x 21 x R
20 y 21 y R

#This state then makes a new marker and goes back to state 16/17 depending on the letter
#It halts in acceptance if it has cycled all the way through and has reached the "#" without any rejection
21 a 16 x R
21 b 17 y R
21 # -1 # R

#The TM goes to state 22 if the character was an "a"
#"This is a cycle state that replaces any "a" with "x"
#If there are any "b" through the cycle then the TM halts and rejects because there it violates the property of the given statement

22 x 22 x R
22 y 22 y R
22 a 24 x L
22 b -2 b L

#The TM goes to state 23 if the character was an "b"
#"This is a cycle state that replaces any "b" with "y"
#If there are any "a" or blanks through the cycle then the TM halts and rejects because there it violates the property of the given statement

23 x 23 x R
23 y 23 y R
23 a -2 a L
23 b 24 y L
23 B -2 B L

#This is a cycle state that goes to the start of the right side of the tape and sends the TM back to state 20
24 x 24 x L
24 y 24 y L
24 # 20 # L
