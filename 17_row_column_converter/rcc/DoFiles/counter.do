restart -f

# 10 MHz klok definieren:
force clk 1 0, 0 50 -rep 100

force incr 0
force nrst 0
run 50

force nrst 1
force incr 1
run 200

force incr 0
run 200

force incr 1
run 320

force nrst 0
force incr 0
run 40

force nrst 1
force incr 1
run 140