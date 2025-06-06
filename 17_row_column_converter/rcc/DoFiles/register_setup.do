onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider {control inputs}
add wave -noupdate -height 30 -label nrst /rcc_register/nrst
add wave -noupdate -height 30 -label clock /rcc_register/clk

add wave -noupdate -divider {save mux}
add wave -noupdate -height 30 -label save /rcc_register/save
add wave -noupdate -height 30 -label select /rcc_register/sel
add wave -noupdate -height 30 -label mux_out_0 /rcc_register/save_out0
add wave -noupdate -height 30 -label mux_out_1 /rcc_register/save_out1
add wave -noupdate -height 30 -label mux_out_2 /rcc_register/save_out2
add wave -noupdate -height 30 -label mux_out_3 /rcc_register/save_out3

add wave -noupdate -divider {registers}
add wave -noupdate -height 30 -hex {data_in {data_in0 data_in1 data_in2 data_in3}}
add wave -noupdate -height 30 -hex {reg0_out {data_in00 data_in01 data_in02 data_in03}}
add wave -noupdate -height 30 -hex {reg1_out {data_in10 data_in11 data_in12 data_in13}}
add wave -noupdate -height 30 -hex {reg2_out {data_in20 data_in21 data_in22 data_in23}}
add wave -noupdate -height 30 -hex {reg3_out {data_in30 data_in31 data_in32 data_in33}}

add wave -noupdate -divider {mux out}
add wave -noupdate -height 30 -label select /rcc_register/sel
add wave -noupdate -height 30 -label data_out /rcc_register/data_out


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
