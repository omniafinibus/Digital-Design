##########################################
# Digital Design 11, assignment 4    4bit#
##########################################

restart -f

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



#  make sure you simulate all  important input combinations
#  situations: 0+0;  ...
#result      : 0&0

#0000 0000
#0010 1100
#1111 1111
#0000 1111
#0001 1111
#1110 0100


#Description                VHDL Value   Decimal
#character literal sequence 1111         15
#binary radix               2#1111       15
#octal radix                8#17         15
#decimal radix              10#15        15
#hexadecimal radix          16#F         15
