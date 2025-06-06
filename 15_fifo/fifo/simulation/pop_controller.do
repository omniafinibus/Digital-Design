restart -f

# 10 MHz klok definieren:
force clk 1 0, 0 50 -rep 100

# Initialisatie

force pop 0
force zero 01
force nrst 0
run 100

force nrst 1
run 50

force pop 1
force zero 00
run 100

force pop 0
run 100

force pop 1
run 100

force pop 0
force zero 01
run 100

force pop 1
run 100

force pop 0
force zero 00
run 100

force pop 1
run 100

force pop 0
force zero 11
run 100

force pop 1
run 100

force pop 0
run 40

force zero 00
force nrst 0
run 100

force nrst 1
run 50

force pop 1
run 100

force pop 0
run 100