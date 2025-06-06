transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/alemm/OneDrive - Office 365 Fontys/Elektrotechniek/S4/Digital Design/Assignment 3/LIFO/lifo/out_mux.vhd}
vcom -93 -work work {C:/Users/alemm/OneDrive - Office 365 Fontys/Elektrotechniek/S4/Digital Design/Assignment 3/LIFO/lifo/in_mux.vhd}
vcom -93 -work work {C:/Users/alemm/OneDrive - Office 365 Fontys/Elektrotechniek/S4/Digital Design/Assignment 3/LIFO/lifo/register_bitslice.vhd}
vcom -93 -work work {C:/Users/alemm/OneDrive - Office 365 Fontys/Elektrotechniek/S4/Digital Design/Assignment 3/LIFO/lifo/address_counter.vhd}
vcom -93 -work work {C:/Users/alemm/OneDrive - Office 365 Fontys/Elektrotechniek/S4/Digital Design/Assignment 3/LIFO/lifo/comparator.vhd}
vcom -93 -work work {C:/Users/alemm/OneDrive - Office 365 Fontys/Elektrotechniek/S4/Digital Design/Assignment 3/LIFO/lifo/controller.vhd}

