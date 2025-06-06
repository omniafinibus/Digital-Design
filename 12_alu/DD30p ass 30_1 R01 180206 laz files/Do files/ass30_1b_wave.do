onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -height 30 /ass30_1b_calc/clk
add wave -noupdate -divider {inp contr}
add wave -noupdate -height 30 /ass30_1b_calc/clear
add wave -noupdate -height 30 /ass30_1b_calc/load
add wave -noupdate -height 30 -label /ass30_1b_calc/function_code /ass30_1b_calc/ALU_operation/function_code
add wave -noupdate -divider {inp data}
add wave -noupdate -height 30 /ass30_1b_calc/opnd
add wave -noupdate -divider signals
add wave -noupdate -height 30 /ass30_1b_calc/sum
add wave -noupdate -height 30 /ass30_1b_calc/Cout
add wave -noupdate -divider {outp data}
add wave -noupdate -height 30 /ass30_1b_calc/acu
add wave -noupdate -height 30 /ass30_1b_calc/carry
add wave -noupdate -height 30 /ass30_1b_calc/zero
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {400 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 201
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1249 ns}
