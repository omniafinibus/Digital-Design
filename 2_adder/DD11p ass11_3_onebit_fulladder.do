##########################################
# Digital Design 11, assignment 4   1bit #
##########################################

restart -f 

force A  0
force B  0
force Cin 0
run 20

force A  1
force B  0
force Cin 0
run 20

force A  0
force B  1
force Cin 0
run 20

force A  1
force B  1
force Cin 0
run 20

force A  0
force B  0
force Cin 1
run 20

force A  1
force B  0
force Cin 1
run 20

force A  0
force B  1
force Cin 1
run 20

force A  1
force B  1
force Cin 1
run 20