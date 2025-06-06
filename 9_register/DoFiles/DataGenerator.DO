##########################################
# digital design 21, assignment 3 8 bit  #
# Author : Arjan Lemmens                 #
# date   : 3-28-2019                     #
##########################################

restart -f

force NRST 0
force EnGen 0
force enFast 0
force clk 1
run 500

force clk 0
run 500

force clk 1
force EnGen 1
force NRST 1
run 500

force clk 0
run 500

force clk 1
run 500

force clk 0
run 500

force clk 1
run 500

force clk 0
run 500

force clk 1
force EnGen 0
run 500

force clk 0
run 500

force clk 1
force EnGen 1
force NRST 0 
run 500

force clk 0
run 500

force clk 1
force NRST 1
force enFast 1
run 500

force clk 0
run 500

force clk 1
run 500

force clk 0
run 500

force clk 1
run 500

force clk 0
run 500

force clk 1
force EnGen 0
run 500

force clk 0
run 500

force clk 1
force EnGen 1
run 500

force clk 0
run 500

force clk 1
force NRST 0
run 500