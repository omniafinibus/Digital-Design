restart -f

# 10 MHz klok definieren:
force clk 1 0, 0 50 -rep 100

# Initialisatie

force pop 0
force push 0
force zero 00
force nrst 0
run 40

force nrst 1
run 50

force push 1
run 100

force zero 01
run 100

force zero 10
run 100

force zero 00
force push 0
force nrst 0
run 50

force nrst 1
run 50

force pop 1
run 100

force zero 01
run 100

force zero 10
run 100

force zero 00
force pop 0
force nrst 0
run 50

force nrst 1
run 50

force pop 1
force push 1
run 100

force zero 01
run 100

force zero 10
run 100
