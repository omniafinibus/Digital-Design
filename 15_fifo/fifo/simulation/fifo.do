restart -f

# 10 MHz klok definieren:
force clk 1 0, 0 50 -rep 100

# Initialisatie

force nrst 0
force pop 0
force push 0
force data_in "XXXX"
run 50

force nrst 1
run 100

# push(0)
force data_in "0001"
force push 1
run 100

force data_in "XXXX"
force push 0
run 100

# pop(0)
force pop 1
run 100

force pop 0
run 100

# push(1)
force data_in "0010"
force push 1
run 100

force data_in "XXXX"
force push 0
run 100

# push(2)
force data_in "0011"
force push 1
run 100

force data_in "XXXX"
force push 0
run 100

# push(3)
force data_in "0100"
force push 1
run 100

force data_in "XXXX"
force push 0
run 100

# push(4)
force data_in "0101"
force push 1
run 100

force data_in "XXXX"
force push 0
run 100

# push(5)
force data_in "0110"
force push 1
run 100

force data_in "XXXX"
force push 0
run 100

# pop(1)
force pop 1
run 100

force pop 0
run 100

# pop(2)
force pop 1
run 100

force pop 0
run 100

# pop(3)
force pop 1
run 100

force pop 0
run 100

# pop(4)
force pop 1
run 100

force pop 0
run 100

# pop(5)
force pop 1
run 100

force pop 0
run 100

force nrst 0
run 50

force nrst 1
run 50

# push(0)
force data_in "0001"
force push 1
run 100

force push 0
force pop 1
force data_in "XXXX"
run 100

# push(1)
force pop 0
force push 1
force data_in "0010"
run 100

# push(2)
force data_in "0011"
run 100

# push(3)
force data_in "0100"
run 100

# push(4)
force data_in "0101"
run 100

# pop
force push 0
force pop 1
force data_in "XXXX"
run 500

force pop 0
force nrst 0
run 50

force nrst 1
run 50

force push 1
force pop 1
force data_in "0001"
run 100

force push 0
force pop 0
force data_in "XXXX"
run 100

force push 1
force pop 1
force nrst 0 
force data_in "0001"
run 50

force push 0
force pop 0
force nrst 1 
force data_in "XXXX"
run 150