restart -f

# 10 MHz klok definieren:
force clk 1 0, 0 50 -rep 100

force data_in 0
force save_data 0
force nrst 0
run 50

force nrst 1
force data_in 1
run 100

force save_data 1
run 100

force data_in 0
run 100

force data_in 1 
run 120

force nrst 0
force save_data 0
run 40

force nrst 1
force save_data 1
run 140