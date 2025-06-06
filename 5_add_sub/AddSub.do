##################################
# Digital Design 12 AddSub		 #
##################################

restart -f

#Adder
force Sel 0
force A 0000
force B 0000
run 20

force A 0010
force B 1100
run 20 

force A 1111
force B 1111
run 20

force A 0000
force B 1111
run 20

force A 0001
force B 1111
run 20

force A 1110
force B 0100
run 20

#Subtractor
force Sel 1
force A 0000
force B 0000
run 20

force A 0001
force B 0000
run 20

force A 0010
force B 1100
run 20 

force A 1111
force B 1111
run 20

force A 0000
force B 1111
run 20

force A 0001
force B 1111
run 20

force A 1110
force B 0100
run 20