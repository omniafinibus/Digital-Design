restart -f

# 10 MHz klok definieren:
force clk 1 0, 0 50 -rep 100

# Initialisatie

force save 0
force nrst 0
force data_in "XXXX"
force pop_pntr "XX"
force push_pntr "XX"
run 50

force nrst 1
force push_pntr "00"
force save 1
force data_in "0001"
run 100

force push_pntr "11"
force data_in "1000"
run 100

force push_pntr "01"
force data_in "0010"
run 100

force push_pntr "10"
force data_in "0100"
run 100

force save 0
force data_in "XXXX"
force push_pntr "XX"
run 100

force pop_pntr "00"
run 100

force pop_pntr "01"
run 100

force pop_pntr "10"
run 100

force pop_pntr "11"
run 100

force pop_pntr "XX"
force nrst 0
run 100

force nrst 1
run 200