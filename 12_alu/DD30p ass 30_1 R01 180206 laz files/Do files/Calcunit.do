# MODELSIM stimulusfile voor calcproef

restart -f

# 10 MHz klok definieren:
force clk 1 0, 0 50 -rep 100

# Initialisatie
force opnd 16#X
force load 0
force ca 0
force cb 0
force clear 1
run 100
force clear 0
run 100

# Test 1, laden accumulator met getal B
force ca 1
force opnd 16#B
force load 1
run 100
force opnd "XXXX"
force load 0
run 100
# totale sim tijd 600ns

# Test 2  AND met D en 7
force ca 0
force cb 1
force load 1
force opnd 16#D
run 100
force opnd 16#7
run 100
force opnd "XXXX"
force load 0
run 100
# totale sim tijd 900ns

# Test 3 achtereenvolgens optellen 0 B 2 A 1 7 9 en 0
force ca 1
force cb 0
run 100
force opnd 16#0
force load 1
run 100
force opnd 16#B
run 100
force opnd 16#2
run 100
force opnd 16#A
run 100
force opnd 16#1
run 100
force opnd 16#7
run 100
force opnd 16#9
run 100
force opnd 16#0
run 100
force load 0
force opnd "XXXX"
run 100
# totale sim tijd 1900

# test 4 schuifoperatie 5 maal
force ca 1
force cb 1
run 100
force load 1
run 500
force load 0
run 100
# totale sim tijd 2600 ns

# Test 5 subtract Zelf invullen
force ca 1
force cb 0
run 100
force opnd 16#9
force load 1
run 100
force load 0
force opnd "XXXX"
force ca 0
run 100
force opnd 16#1
force load 1
run 100
force opnd 16#8
run 100
force opnd 16#7
run 100
force opnd 16#F
run 100
force opnd "XXXX"
force load 0
run 100