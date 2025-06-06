##########################################
# digital design 21, assignment 2  D-FF  #
# Author : Arjan Lemmens                 #
# date   : 2-28-2019                     #
##########################################

#Name in binary = 1100 101 1101


#initilization
restart -f

force nrst 	1
run 10

#m  1011

force clk 	1
run 10

force D 	1
run 40

force clk 	0
run 50

force clk 	1
run 10

force D 	0
run 40

force clk 	0
run 50

force clk 	1
run 10

force D 	1
run 40

force clk 	0
run 50

force clk 	1
run 10

force D 	1
run 40

force clk 	0
run 50


#e 101

force clk 	1
run 10

force D 	1
run 40

force clk 	0
run 50

force clk 	1
run 10

force D 	0
run 40

force clk 	0
run 50

force clk 	1
run 10

force D 	1
run 40

force clk 	0
run 50


#L 0011

force clk 	1
run 10

force D 	0
run 40

force clk 	0
run 50

force clk 	1
run 10

force D 	0
run 40

force clk 	0
run 50

force clk 	1
run 10

force D 	1
run 40

force clk 	0
run 50

force clk 	1
run 10

force D 	1
run 40

force clk 	0
run 50

 
