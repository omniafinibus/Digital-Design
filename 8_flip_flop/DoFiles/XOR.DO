##########################################
# Digital Design 21, assignment 2  D-FF  #
# Author : Arjan Lemmens                 #
# Date   : 2-28-2019                     #
##########################################

#initilization
restart -f

force a 0
force b 0
run 20

force a 1
force b 0
run 20

force a 0
force b 1
run 20

force a 1
force b 1
run 20

force a 0
force b 0
run 20