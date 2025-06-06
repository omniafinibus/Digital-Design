restart -f

# 10 MHz klok definieren:
force clk 1 0, 0 50 -rep 100

force i_avail 0
force o_rdy 0
force last_row 0
force last_col 0
force nrst 0
run 50

force nrst 1
force i_avail 1
run 100

force i_avail 0
run 100

force last_row 1
run 100

force last_row 0
run 100

force last_row 1
run 100

force last_row 0
run 100

force o_rdy 1
run 100

force o_rdy 0
run 100

force last_row 1
force last_col 1
run 100

force last_row 0
force last_col 0
force i_avail 1
run 50

force last_row 1
force i_avail 0
run 230

force nrst 0
run 60

force nrst 1
run 60
