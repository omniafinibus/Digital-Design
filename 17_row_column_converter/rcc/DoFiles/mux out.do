restart -f

force sel 00
force data_in0 1111
force data_in1 1001
force data_in2 0110
force data_in3 0000
run 100

force sel 01
run 100

force sel 10
run 100

force sel 11
run 100