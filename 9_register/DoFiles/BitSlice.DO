##########################################
# digital design 21, bitSlice            #
# Author : Arjan Lemmens                 #
# date   : 3-28-2019                     #
##########################################

restart -f

force Clk 1
force enReg 1
force Nrst 1
force control 00
force GND 0
force D 0
run 20

force Clk 0
run 20

force Clk 1
force D 1
run 20

force Clk 0
run 20

force Clk 1
force Nrst 0
run 20

force Clk 0
run 20

force Clk 1
force Nrst 1
run 20

force Clk 0
run 20

force Clk 1
force D 0
force enReg 0
run 20

force Clk 0
run 20 

force Clk 1
force enReg 1
force control 01
run 20

force Clk 0
run 20

force Clk 1
force D 1
force control 10
run 20

force Clk 0
run 20

force Clk 1
force D 0
run 20

force Clk 0
run 20

force Clk 1
force control 11
force D 1

force Clk 0
run 20

force Clk 1
run 20

force Clk 0
run 20
