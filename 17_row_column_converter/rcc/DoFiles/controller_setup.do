onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider {control inputs}
add wave -noupdate -height 30 -label nrst /controller/nrst
add wave -noupdate -height 30 -label clock /controller/clk

add wave -noupdate -divider {recieve handshake}
add wave -noupdate -height 30 -label in_avail /controller/i_avail
add wave -noupdate -height 30 -label in_ready /controller/i_rdy

add wave -noupdate -divider {states}
add wave -noupdate -height 30 -label prev_state /controller/p_s
add wave -noupdate -height 30 -label next_state /controller/n_s

add wave -noupdate -divider {register control}
add wave -noupdate -height 30 -label save_input /controller/save
add wave -noupdate -height 30 -label save_shift /controller/save_shft

add wave -noupdate -divider {address control}
add wave -noupdate -height 30 -label last_row /controller/last_row
add wave -noupdate -height 30 -label last_col /controller/last_col
add wave -noupdate -height 30 -label next_row /controller/next_row
add wave -noupdate -height 30 -label next_col /controller/next_col

add wave -noupdate -divider {transmit handshake}
add wave -noupdate -height 30 -label out_avail /controller/o_avail
add wave -noupdate -height 30 -label out_ready /controller/o_rdy


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
