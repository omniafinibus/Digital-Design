restart -f

# 10 MHz klok definieren:
force clk 1 0, 0 50 -rep 100

force data_in 0000
force save 0
force nrst 0
run 50

force nrst 1
force data_in 1001
force save 1
run 100

force data_in 0110
run 100

force save 0
force data_in 1111
run 120

force nrst 0
run 40

force nrst 1
run 40