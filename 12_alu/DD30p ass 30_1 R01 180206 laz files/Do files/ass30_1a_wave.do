onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -height 30 /ass30_1a_calc/clk
add wave -noupdate -divider {inp contr}
add wave -noupdate -height 30 /ass30_1a_calc/clear
add wave -noupdate -height 30 /ass30_1a_calc/load
add wave -noupdate -height 30 -label /ass30_1a_calc/function_code /ass30_1a_calc/calcunit_toplevel/function_code
add wave -noupdate -divider {inp data}
add wave -noupdate -height 30 /ass30_1a_calc/opnd
add wave -noupdate -divider {outp data}
add wave -noupdate -height 30 /ass30_1a_calc/acu
add wave -noupdate -height 30 /ass30_1a_calc/carry
add wave -noupdate -height 30 /ass30_1a_calc/zero
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {353 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 201
configure wave -valuecolwidth 38
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
WaveRestoreZoom {0 ns} {2783 ns}
