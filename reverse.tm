# A TM to reverse a string.  This is somewhat simpler than
# the solution to this problem given in the notes.

# The initial state is always 0.  The halt
# state is -3.

# In state 0 we move right past the X's until we 
# find a, b or a blank. Note that blanks are always
# represented by upper case B.  If we find a or b, we
# cross the symbol out with an X, remember a or b in
# the state, and begin a leftward journey.  If we find
# a blank, we begin the cleanup phase

0 X 0 X R
0 a 1 X L
0 b 2 X L
0 B 4 B L

# In state 1, we move left past X's, a's, b's until
# we hit a blank, then write the remembered symbol,
# and begin a scan back to the right in state 3.

1 X 1 X L
1 a 1 a L
1 b 1 b L
1 B 3 a R

# State 2 is the same, we just
#write  b when we find the blank

2 X 2 X L
2 a 2 a L
2 b 2 b L
2 B 3 b R

#In state 3 we scan right past the a's
#and b's that we've marked on the tape
# until we reach an X.  Then we're back 
# at the beginning

3 a 3 a R
3 b 3 b R
3 X 0 X R

# In the cleanup in state 4 we move left
# erasing X's. Halt when we get a, b or blank
# (so this will work even on the empty string)

4 X 4 B L
4 a -3 a L
4 b -3 b L
4 B -3 B L

