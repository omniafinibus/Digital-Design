##########################################
# digital design 21, FullSystem          #
# Author : Arjan Lemmens                 #
# date   : 3-28-2019                     #
##########################################

restart -f


restart -f

force clock_1 1
force enReg 0
force Nrst 0
force control 00
force enGen 0
force enFast 0
force GND 0
run 20

force clock_1 0
run 20

force clock_1 1
force Nrst 1
run 20

force clock_1 0 
run 20

force clock_1 1
force Nrst 0
run 20

force clock_1 0 
run 20

force clock_1 1
force Nrst 1 
run 20

force clock_1 0 
run 20

force clock_1 1
run 20

force clock_1 0 
run 20

force clock_1 1
force enReg 1
run 20

force clock_1 0 
run 20

force clock_1 1
force enReg 0
force control 01
run 20

force clock_1 0
run 20

force clock_1 1
force enGen 1
force enFast 1
run 20

force clock_1 0
run 20

force clock_1 1
force control 10
run 20

force clock_1 0
run 20

force clock_1 1
run 20

force clock_1 0
run 20

force clock_1 1
force control 11
run 20

force clock_1 0
run 20

force clock_1 1
run 20

force clock_1 0
run 20

force clock_1 1
run 20

force clock_1 0 
run 20

force clock_1 1
run 20

force clock_1 0 
run 20