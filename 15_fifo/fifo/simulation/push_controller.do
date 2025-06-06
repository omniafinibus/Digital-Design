restart -f

# 10 MHz klok definieren:
force clk 1 0, 0 50 -rep 100

# Initialisatie

force push 0
force zero_full 0
force nrst 0
run 100

force nrst 1
run 50

force push 1
run 100

force push 0
run 100

force push 1
run 100

force push 0
force zero_full 1
run 100

force push 1
force zero_full 0
run 100

force push 0
run 40

force nrst 0
run 100

force nrst 1
run 50

force push 1
run 100

force push 0
run 100