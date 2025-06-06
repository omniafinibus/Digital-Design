##########################################
# Digital Design 12 mux					 #
##########################################

restart -f

force S1 0101
force Cout 1
force S2 1010
force Bout 0 
run 20

force sel 0
run 20

force sel 1
run 20