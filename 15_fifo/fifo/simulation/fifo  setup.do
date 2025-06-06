onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -height 30 -label clock /fifo/clk

add wave -noupdate -divider {control inputs}
add wave -noupdate -height 30 -label nrst /fifo/nrst

add wave -noupdate -divider {push controller}
add wave -noupdate -height 20 -label push /fifo/push
add wave -noupdate -height 20 -label zero_full /fifo/zero(1)
add wave -noupdate -height 20 -label full /fifo/full
add wave -noupdate -height 20 -label save /fifo/save
add wave -noupdate -height 20 -label push_pointer /fifo/push_pntr

add wave -noupdate -divider {saved values}
add wave -noupdate -height 20 -label data_in /fifo/data_in
add wave -noupdate -height 20 -label reg_row0 /fifo/b2v_regitser_bank/b2v_reg_row0/data_out
add wave -noupdate -height 20 -label reg_row1 /fifo/b2v_regitser_bank/b2v_reg_row1/data_out
add wave -noupdate -height 20 -label reg_row2 /fifo/b2v_regitser_bank/b2v_reg_row2/data_out
add wave -noupdate -height 20 -label reg_row3 /fifo/b2v_regitser_bank/b2v_reg_row3/data_out
add wave -noupdate -height 20 -label data_out_reg_bank /fifo/data_out_reg_block
add wave -noupdate -height 20 -label data_out /fifo/data_out

add wave -noupdate -divider {pop_controller}
add wave -noupdate -height 20 -label pop /fifo/pop
add wave -noupdate -height 20 -label zero_empty /fifo/zero(0)
add wave -noupdate -height 20 -label empty /fifo/empty
add wave -noupdate -height 20 -label load /fifo/load
add wave -noupdate -height 20 -label pop_pointer /fifo/pop_pntr

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
