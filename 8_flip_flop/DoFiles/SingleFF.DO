##########################################
# Digital Design 21, assignment 2  D-FF  #
# Author : Arjan Lemmens                 #
# Date   : 2-28-2019                     #
##########################################

#initilization
restart -f

force Nrst 	1
force Clk 	0
run 20

force Clk 	1
force D 0
run 20

force Clk 	0
run 20

force Clk 	1
force D 0
run 20

force Clk 	0
run 20

force Clk 	1
force D 1
run 20

force Clk 	0
run 20

force Clk 	1
force D 0 
run 20

force Clk 	0
run 20

force Clk 	1
force D 1
run 20

force Clk 	0
run 20

force Clk 	1
force D 1
run 20

force Clk 	0
run 20

force Clk 	1
force D 1
run 20

force Clk 	0
run 20

force Clk 	1
force Nrst 0
force D 1
run 40

force Clk 	0
run 20

force Clk 	1
force D 0
run 40