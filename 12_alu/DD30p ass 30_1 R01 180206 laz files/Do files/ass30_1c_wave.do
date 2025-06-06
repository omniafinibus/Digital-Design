onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -height 30 /ass30_1c_calc/clk
add wave -noupdate -divider {inp contr}
add wave -noupdate -height 30 /ass30_1c_calc/clear
add wave -noupdate -height 30 /ass30_1c_calc/load
add wave -noupdate -divider {inp data}
add wave -noupdate -height 30 /ass30_1c_calc/opnd
add wave -noupdate -height 30 -label /ass30_1c_calc/functioncode /ass30_1c_calc/b2v_inst3/b2v_inst3/line__20/function_code
add wave -noupdate -divider signals
add wave -noupdate -height 30 /ass30_1c_calc/sum
add wave -noupdate -height 30 /ass30_1c_calc/cout
add wave -noupdate -divider {outp data}
add wave -noupdate -height 30 /ass30_1c_calc/acu
add wave -noupdate -height 30 /ass30_1c_calc/carry
add wave -noupdate -height 30 /ass30_1c_calc/zero
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {300 ns} 0}
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
WaveRestoreZoom {0 ns} {2783 ns}
