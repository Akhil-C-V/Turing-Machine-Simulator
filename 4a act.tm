#initial stage
#checks the first character
#f its an "a" then it goes to state 1 and if its a "b" it goes to state 2
#If the first character is a "#", the TM halts and rejects because it cannot satisfy the given statement when its first because its not surrounded by the same character

0 a 1 a R
0 b 2 b R
0 # -2 # S

#stage 1
#The TM goes to state 1 if the first character is an "a"
#It checks if the following character is a "#",
#The TM halts and rejects if the following character is "a" or "b" because then there are two consequtive letters, causing the statement to fail

1 # 3 # R
1 a -2 a R
1 b -2 b R

#stage 2
#The TM goes to state 1 if the first character is an "b"
#It checks if the following character is a "#",
#The TM halts and rejects if the following character is "a" or "b" because then there are two consequtive letters, causing the statement to fail

2 # 4 # R
2 a -2 a R
2 b -2 b R

#stage 3
#The TM goes to state 3 if the first character is an "a"
#This state checks if the following character is the same as the first, which is an "a"
#If the following character is an "b" or "#" then the TM halts and rejects because it violates the properties of the given statement

3 a 5 a R
3 b -2 b S
3 # -2 # S

#stage 4
#The TM goes to state 4 if the first character is an "b"
#This state checks if the following character is the same as the first, which is an "a"
#If the following character is an "a" or "#" then the TM halts and rejects because it violates the properties of the given statement
4 a -2 a S
4 b 5 b R
4 # -2 # S

#stage 5
#This final state checks to ensure that there are no trailing characters because there can only be 1 "#" surrounded by the same "a" or "b"
#If the following character is blank then the statement halts and accepts, otherwise it halts and rejects
 
5 B -1 B S
5 a -2 a S
5 b -2 b S
5 # -2 # S
