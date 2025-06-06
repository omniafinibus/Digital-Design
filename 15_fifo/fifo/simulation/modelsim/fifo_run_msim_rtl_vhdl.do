transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/alemm/OneDrive - Office 365 Fontys/Elektrotechniek/S4/Digital Design/Assignment 3/FIFO/fifo/register_bitslice.vhd}
vcom -93 -work work {C:/Users/alemm/OneDrive - Office 365 Fontys/Elektrotechniek/S4/Digital Design/Assignment 3/FIFO/fifo/out_mux.vhd}
vcom -93 -work work {C:/Users/alemm/OneDrive - Office 365 Fontys/Elektrotechniek/S4/Digital Design/Assignment 3/FIFO/fifo/in_mux.vhd}
vcom -93 -work work {C:/Users/alemm/OneDrive - Office 365 Fontys/Elektrotechniek/S4/Digital Design/Assignment 3/FIFO/fifo/comparator.vhd}
vcom -93 -work work {C:/Users/alemm/OneDrive - Office 365 Fontys/Elektrotechniek/S4/Digital Design/Assignment 3/FIFO/fifo/address_counter.vhd}
vcom -93 -work work {C:/Users/alemm/OneDrive - Office 365 Fontys/Elektrotechniek/S4/Digital Design/Assignment 3/FIFO/fifo/pop_controller.vhd}
vcom -93 -work work {C:/Users/alemm/OneDrive - Office 365 Fontys/Elektrotechniek/S4/Digital Design/Assignment 3/FIFO/fifo/push_controller.vhd}

