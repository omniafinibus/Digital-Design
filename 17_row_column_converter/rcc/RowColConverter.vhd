-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 17.0.0 Build 595 04/25/2017 SJ Lite Edition"
-- CREATED		"Thu Feb 25 14:57:20 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY RowColConverter IS 
	PORT
	(
		i_avail :  IN  STD_LOGIC;
		o_rdy :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		nrst :  IN  STD_LOGIC;
		data_in :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		i_rdy :  OUT  STD_LOGIC;
		o_avail :  OUT  STD_LOGIC;
		data_out :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END RowColConverter;

ARCHITECTURE bdf_type OF RowColConverter IS 

COMPONENT address_counter
	PORT(incr : IN STD_LOGIC;
		 nrst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 last : OUT STD_LOGIC;
		 address : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT shift_register
	PORT(data_in : IN STD_LOGIC;
		 save_data : IN STD_LOGIC;
		 nrst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 output : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT controller
	PORT(i_avail : IN STD_LOGIC;
		 o_rdy : IN STD_LOGIC;
		 last_row : IN STD_LOGIC;
		 last_col : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 nrst : IN STD_LOGIC;
		 i_rdy : OUT STD_LOGIC;
		 o_avail : OUT STD_LOGIC;
		 save : OUT STD_LOGIC;
		 next_row : OUT STD_LOGIC;
		 next_col : OUT STD_LOGIC;
		 save_shft : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT rcc_register
	PORT(nrst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 save : IN STD_LOGIC;
		 data_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 data_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT column_selectora
	PORT(bit_sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 data_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 data_out : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	col_address :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	col_sel_out :  STD_LOGIC;
SIGNAL	last_col :  STD_LOGIC;
SIGNAL	last_row :  STD_LOGIC;
SIGNAL	next_col :  STD_LOGIC;
SIGNAL	next_row :  STD_LOGIC;
SIGNAL	reg_out :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	row_address :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	save_shift_reg :  STD_LOGIC;
SIGNAL	save_to_register :  STD_LOGIC;


BEGIN 



b2v_col_counter : address_counter
PORT MAP(incr => next_col,
		 nrst => nrst,
		 clk => clk,
		 last => last_col,
		 address => col_address);


b2v_inst : shift_register
PORT MAP(data_in => col_sel_out,
		 save_data => save_shift_reg,
		 nrst => nrst,
		 clk => clk,
		 output => data_out);


b2v_inst2 : controller
PORT MAP(i_avail => i_avail,
		 o_rdy => o_rdy,
		 last_row => last_row,
		 last_col => last_col,
		 clk => clk,
		 nrst => nrst,
		 i_rdy => i_rdy,
		 o_avail => o_avail,
		 save => save_to_register,
		 next_row => next_row,
		 next_col => next_col,
		 save_shft => save_shift_reg);


b2v_inst4 : rcc_register
PORT MAP(nrst => nrst,
		 clk => clk,
		 save => save_to_register,
		 data_in => data_in,
		 sel => row_address,
		 data_out => reg_out);


b2v_inst6 : column_selectora
PORT MAP(bit_sel => col_address,
		 data_in => reg_out,
		 data_out => col_sel_out);


b2v_row_counter : address_counter
PORT MAP(incr => next_row,
		 nrst => nrst,
		 clk => clk,
		 last => last_row,
		 address => row_address);


END bdf_type;