##########################################
# digital design 21, Register            #
# Author : Arjan Lemmens                 #
# date   : 3-28-2019                     #
##########################################

restart -f

force Clk 1
force enReg 1
force Nrst 1
force control 00
force GND 0
force Din 00000000
run 500

force Clk 0
run 500

force Clk 1
force Din 00101001
run 500

force Clk 0 
run 500

force Clk 1
force Nrst 0
run 500

force Clk 0 
run 500

force Clk 1
force Nrst 1 
run 500

force Clk 0 
run 500

force Clk 1
run 500

force Clk 0 
run 500

force Clk 1
force enReg 0
run 500

force Clk 0 
run 500

force Clk 1
force enReg 1
force control 01
force Din 11111111
run 500

force Clk 0
run 500

force Clk 1
force Din 00000000
run 500

force Clk 0
run 500

force Clk 1
force control 10
force Din 10101010
run 500

force Clk 0
run 500

force Clk 1
run 500

force Clk 0
run 500

force Clk 1
force control 11
force Din 00110011
run 500

force Clk 0
run 500

force Clk 1
run 500

force Clk 0
run 500

force Clk 1
run 500

force Clk 0 
run 500