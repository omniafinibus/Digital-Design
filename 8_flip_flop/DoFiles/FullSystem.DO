##########################################
# digital design 21, assignment 2  D-FF  #
# Author : Arjan Lemmens                 #
# date   : 2-28-2019                     #
##########################################

#Name in binary = 1100 101 1101


#initilization
restart -f

force nrst 	1
force clk 	1
force L0 0
force L1 0
force L2 0
force L3 0
run 50

force clk 	0
run 50

force nrst 	1
run 10

#L  1100

force clk 	1
run 10

force inp 	1
run 40

force clk 	0
run 50

force clk 	1
run 10

force inp 	1
run 40

force clk 	0
run 50

force clk 	1
run 10

force inp 	0
run 40

force clk 	0
run 50

force clk 	1
run 10

force inp 	0
run 40

force clk 	0
run 50


#e 101

force clk 	1
run 10

force inp 	1
run 40

force clk 	0
run 50

force clk 	1
run 10

force inp 	0
run 40

force clk 	0
run 50

force clk 	1
run 10

force inp 	1
run 40

force clk 	0
run 50


#m 1101

force clk 	1
run 10

force inp 	1
run 40

force clk 	0
run 50

force clk 	1
run 10

force inp 	0
run 40

force clk 	0
run 50

force clk 	1
run 10

force inp 	0
run 40

force clk 	0
run 50

force clk 	1
run 10

force inp 	1
run 40

force clk 	0
run 50

 
