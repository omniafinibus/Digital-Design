onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -height 30 -label clock /lifo/clk

add wave -noupdate -divider {control inputs}
add wave -noupdate -height 30 -label nrst /lifo/nrst

add wave -noupdate -divider {push controller}
add wave -noupdate -height 30 -label push /lifo/push
add wave -noupdate -height 30 -label zero_full /lifo/zero(1)
add wave -noupdate -height 30 -label full /lifo/full
add wave -noupdate -height 30 -label increase /lifo/incr
add wave -noupdate -height 30 -label push_pointer /lifo/push_pntr

add wave -noupdate -divider {saved values}
add wave -noupdate -height 30 -label data_in /lifo/data_in
add wave -noupdate -height 30 -label reg_row0 /lifo/b2v_register_bank/data_row0
add wave -noupdate -height 30 -label reg_row1 /lifo/b2v_register_bank/data_row1
add wave -noupdate -height 30 -label reg_row2 /lifo/b2v_register_bank/data_row2
add wave -noupdate -height 30 -label reg_row3 /lifo/b2v_register_bank/data_row3
add wave -noupdate -height 30 -label data_out_reg_bank /lifo/data_out_reg_bank

add wave -noupdate -divider {pop_controller}
add wave -noupdate -height 30 -label pop /lifo/pop
add wave -noupdate -height 30 -label zero_empty /lifo/zero(0)
add wave -noupdate -height 30 -label empty /lifo/empty
add wave -noupdate -height 30 -label decrease /lifo/decr
add wave -noupdate -height 30 -label pop_pointer /lifo/pop_pntr
add wave -noupdate -height 30 -label data_out /lifo/data_out

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
