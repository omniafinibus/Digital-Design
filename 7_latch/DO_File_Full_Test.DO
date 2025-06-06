##########################################
# Digital Design 21, assignment 1        #
# Author : Arjan Lemmens                 #
# Date   : 2-2-2019                      #
##########################################

restart -f

force players 001
force n_reset 0
run 20

force n_reset 1
run 20

force players 010
force n_reset 0 
run 20

force n_reset 1
run 20

force players 100
force n_reset 0 
run 20

force n_reset 1
run 20