onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider {control inputs}
add wave -noupdate -height 20 -label nrst /rowcolconverter/nrst
add wave -noupdate -height 20 -label clock /rowcolconverter/clk

add wave -noupdate -divider {recieve handshake}
add wave -noupdate -height 20 -label in_avail /rowcolconverter/i_avail
add wave -noupdate -height 20 -label in_ready /rowcolconverter/i_rdy

add wave -noupdate -divider {row control}
add wave -noupdate -height 20 -label next_row /rowcolconverter/next_row
add wave -noupdate -height 20 -label row_address /rowcolconverter/row_address
add wave -noupdate -height 20 -label last_row /rowcolconverter/last_row

add wave -noupdate -divider {register control}
add wave -noupdate -height 20 -label data_in /rowcolconverter/data_in
add wave -noupdate -height 20 -label reg_00 /rowcolconverter/b2v_inst4/b2v_inst/data_out
add wave -noupdate -height 20 -label reg_01 /rowcolconverter/b2v_inst4/b2v_inst2/data_out
add wave -noupdate -height 20 -label reg_10 /rowcolconverter/b2v_inst4/b2v_inst3/data_out
add wave -noupdate -height 20 -label reg_11 /rowcolconverter/b2v_inst4/b2v_inst4/data_out
add wave -noupdate -height 20 -label save_input /rowcolconverter/save_to_register
add wave -noupdate -height 20 -label register_output /rowcolconverter/reg_out

add wave -noupdate -divider {shift register control}
add wave -noupdate -height 20 -label shift_input /rowcolconverter/col_sel_out
add wave -noupdate -height 20 -label save_shift /rowcolconverter/save_shift_reg
add wave -noupdate -height 20 -label data_out /rowcolconverter/data_out

add wave -noupdate -divider {column control}
add wave -noupdate -height 20 -label next_col /rowcolconverter/next_col
add wave -noupdate -height 20 -label column_address /rowcolconverter/col_address
add wave -noupdate -height 20 -label last_col /rowcolconverter/last_col

add wave -noupdate -divider {transmit handshake}
add wave -noupdate -height 20 -label out_avail /rowcolconverter/o_avail
add wave -noupdate -height 20 -label out_ready /rowcolconverter/o_rdy


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
