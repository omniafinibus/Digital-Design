restart -f

# 10 MHz klok definieren:
force clk 1 0, 0 50 -rep 100

force i_avail 0
force o_rdy 0
force nrst 0
force data_in 0000
run 50

force nrst 1
run 100

force i_avail 1
run 100

force data_in 0011
force i_avail 0
run 100

force data_in 0000
run 100

force i_avail 1
run 100

force data_in 0101
force i_avail 0
run 100

force data_in 0000
run 100

force i_avail 1
run 100

force data_in 1100
force i_avail 0
run 100

force data_in 0000
run 100

force i_avail 1
run 100

force data_in 1010
force i_avail 0
run 100

force data_in 0000
run 1000

force o_rdy 1
run 100

force o_rdy 0
run 1100

force o_rdy 1
run 100

force o_rdy 0
run 1100

force o_rdy 1
run 100

force o_rdy 0
run 1100

force o_rdy 1
run 100

force o_rdy 0
run 200
{#}{
force i_avail 1
run 100

force data_in 0101
force i_avail 0
run 100

force data_in 0000
run 100

force i_avail 1
run 100

force data_in 1010
force i_avail 0
run 100

force data_in 0000
run 100

force i_avail 1
run 100

force data_in 0000
force i_avail 0
run 100

force data_in 0000
run 100

force i_avail 1
run 100

force data_in 0110
force i_avail 0
run 100

force data_in 0000
run 1000

force o_rdy 1
run 100

force o_rdy 0
run 1100

force o_rdy 1
run 100

force o_rdy 0
run 1100

force o_rdy 1
run 100

force o_rdy 0
run 1100
}