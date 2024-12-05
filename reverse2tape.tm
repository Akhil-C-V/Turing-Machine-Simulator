# Write string in reverse on second tape,
#erasing first tape
0 a:B 0 B:a R:L
0 b:B 0 B:b R:L
0 B:B 1 B:B R:R

# copy second tape to first tape
1 B:a 1 a:B R:R
1 B:b 1 b:B R:R
1 B:B -3 B:B S:S





