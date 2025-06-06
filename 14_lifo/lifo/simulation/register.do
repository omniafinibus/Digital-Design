restart -f

# 10 MHz klok definieren:
force clk 1 0, 0 50 -rep 100

force sel 00
force data_in0 0
force data_in1 0
force data_in2 0
force data_in3 0
force nrst 0
force save 0
run 50

force nrst 1
force data_in0 0
force data_in1 0
force data_in2 0
force data_in3 1
force save 1
run 100

force sel 01
force data_in0 0
force data_in1 0
force data_in2 1
force data_in3 0
run 100

force sel 10
force data_in0 0
force data_in1 0
force data_in2 1
force data_in3 1
run 100

force sel 11
force data_in0 0
force data_in1 1
force data_in2 0
force data_in3 0
run 100

force save 0
run 20

force nrst 1
run 40

force nrst 0
run 40

force nrst 1
force save 1
force sel 11
force data_in0 0
force data_in1 0
force data_in2 0
force data_in3 1
run 100

force data_in0 0
force data_in1 0
force data_in2 1
force data_in3 0
run 100

force save 0
force sel 00
force data_in0 0
force data_in1 0
force data_in2 1
force data_in3 1
run 100