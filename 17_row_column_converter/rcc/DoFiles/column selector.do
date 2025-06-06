restart -f

force data_in 1110
force bit_sel 00
run 50

force data_in 0001
run 50

force data_in 1101
force bit_sel 01
run 50

force data_in 0010
run 50

force data_in 1011
force bit_sel 10
run 50

force data_in 0100
run 50

force data_in 0111
force bit_sel 11
run 50

force data_in 1000
run 50