###################################
# Digital Design 11, assignment 2 #
###################################


#clear all simulation data and set start time to 0 (-f to force without popup)
restart -f

#test input 0000
force a "0000"
#run for 15 ns
run 15

#test input 0001
force a "0001"
#run for 15 ns
run 15

#test input 0010
force a "0010"
#run for 15 ns
run 15

#test input 0011
force a "0011"
#run for 15 ns
run 15

#test input 0100
force a "0100"
#run for 15 ns
run 15

#test input 0101
force a "0101"
#run for 15 ns
run 15

#test input 0110
force a "0110"
#run for 15 ns
run 15

#test input 0111
force a "0111"
#run for 15 ns
run 15

#test input 1000
force a "1000"
#run for 15 ns
run 15

#test input 1001
force a "1001"
#run for 15 ns
run 15

#test input 1010
force a "1010"
#run for 15 ns
run 15

#test input 1011
force a "1011"
#run for 15 ns
run 15

#test input 1100
force a "1100"
#run for 15 ns
run 15

#test input 1101
force a "1101"
#run for 15 ns
run 15

#test input 1110
force a "1110"
#run for 15 ns
run 15

#test input 1111
force a "1111"
#run for 15 ns
run 15

#test input 0000 aging to start over
force a "0000"
#run for 20 ns
run 20
