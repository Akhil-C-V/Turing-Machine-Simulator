# This is the Turing machine example
# from Lecture 3, reversing
# a string. One difference to note, 
# here the input alphabet consists
# of the symbols a and b instead of 0 and 1.  
# This will avoid confusion
#between states (which have to be numbers)
# and input symbols.

# The initial state is always 0.  The halt
# state is -3.

# In state 0 we move right to the first 
#blank, mark a # symbol,
# and move to the left in state 1.
# The blank symbol is always denoted by
# upper case B.  Note that we do not need
# to specify transitions
# from state 0 if the input is # or X,
# because this cannot occur
# if the input is well-formed (contains
# only a and b.

0 a 0 a R
0 b 0 b R
0 B 1 # L

# In state 1, we scan left past all the X's
# till we get a, b or blank.  If we see a or b
# we cross it off (X) and remember the symbol
# in the next state.

1 a 2 X R
1 b 3 X R
1 X 1 X L

#But if we see a blank, we initiate the cleanup
#phase (state 4)

1 B 4 B R

# In state 2, we scan right over all non-blank symbols
# until we see a blank, where we right the remembered 
# a.

2 a 2 a R
2 b 2 b R
2 X 2 X R
2 # 2 # R
2 B 5 a L

# State 3 works the same, writing b in place of a.

3 a 3 a R
3 b 3 b R
3 X 3 X R
3 # 3 # R
3 B 5 b L

# In state 5 we go left past all the a's and b's 
#until we hit the #, then return to state 1

5 a 5 a L
5 b 5 b L
5 # 1 # L

#In the cleanup phase in state 4, we scan right
#over all the X's and erase them. When we hit
# the # symbol, we erase it as well and halt.

4 X 4 B R
4 # -3 B R

