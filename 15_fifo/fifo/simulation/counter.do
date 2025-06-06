restart -f

# 10 MHz klok definieren:
force clk 1 0, 0 50 -rep 100

# Initialisatie

force incr 0
force nrst 0
run 25

force nrst 1
run 25

force incr 1
run 400

force incr 0
run 100

force nrst 0
run 100

force nrst 1
force incr 1
run 200
	
force incr 0
run 100