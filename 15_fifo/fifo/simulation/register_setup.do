onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider {control inputs}
add wave -noupdate -height 20 -label nrst /register_bank/nrst
add wave -noupdate -height 20 -label clock /register_bank/clk

add wave -noupdate -divider {save mux}
add wave -noupdate -height 20 -label save /register_bank/save
add wave -noupdate -height 20 -label push_pointer /register_bank/push_pntr

add wave -noupdate -divider {registers}
add wave -noupdate -height 20 -label data_in /register_bank/data_in
add wave -noupdate -height 20 -label mux_out_0 /register_bank/save_out0
add wave -noupdate -height 20 -label data_row0 /register_bank/data_row0
add wave -noupdate -height 20 -label mux_out_1 /register_bank/save_out1
add wave -noupdate -height 20 -label data_row1 /register_bank/data_row1
add wave -noupdate -height 20 -label mux_out_2 /register_bank/save_out2
add wave -noupdate -height 20 -label data_row2 /register_bank/data_row2
add wave -noupdate -height 20 -label mux_out_3 /register_bank/save_out3
add wave -noupdate -height 20 -label data_row3 /register_bank/data_row3

add wave -noupdate -divider {mux out}
add wave -noupdate -height 20 -label pop_pointer /register_bank/pop_pntr
add wave -noupdate -height 20 -label data_out /register_bank/data_out


TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {200 ns} 0}
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
