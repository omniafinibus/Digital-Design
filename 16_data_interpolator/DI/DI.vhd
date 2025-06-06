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
-- CREATED		"Fri Apr 02 21:03:40 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY DI IS 
	PORT
	(
		i_avail :  IN  STD_LOGIC;
		o_rdy :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		nrst :  IN  STD_LOGIC;
		data_in :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		i_rdy :  OUT  STD_LOGIC;
		o_avail :  OUT  STD_LOGIC;
		data_out :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END DI;

ARCHITECTURE bdf_type OF DI IS 

COMPONENT \8bit_adder\
	PORT(data_in1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 data_in2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 c_out : OUT STD_LOGIC;
		 data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT controller
	PORT(i_avail : IN STD_LOGIC;
		 o_rdy : IN STD_LOGIC;
		 nrst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 i_rdy : OUT STD_LOGIC;
		 o_avail : OUT STD_LOGIC;
		 sel : OUT STD_LOGIC;
		 save_inpt : OUT STD_LOGIC;
		 save_prev : OUT STD_LOGIC;
		 save_shft : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT register_row
	PORT(save : IN STD_LOGIC;
		 nrst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT byte_selector
	PORT(sel : IN STD_LOGIC;
		 data_in1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 data_in2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT shift_register
	PORT(carry : IN STD_LOGIC;
		 save : IN STD_LOGIC;
		 nrst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	c_out :  STD_LOGIC;
SIGNAL	data_out_addr :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	data_out_inpt_reg :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	data_out_prev_reg :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	data_out_shft_reg :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	save_inpt :  STD_LOGIC;
SIGNAL	save_prev :  STD_LOGIC;
SIGNAL	save_shft :  STD_LOGIC;
SIGNAL	sel :  STD_LOGIC;


BEGIN 



b2v_adder : \8bit_adder\
PORT MAP(data_in1 => data_out_inpt_reg,
		 data_in2 => data_out_prev_reg,
		 c_out => c_out,
		 data_out => data_out_addr);


b2v_controller : controller
PORT MAP(i_avail => i_avail,
		 o_rdy => o_rdy,
		 nrst => nrst,
		 clk => clk,
		 i_rdy => i_rdy,
		 o_avail => o_avail,
		 sel => sel,
		 save_inpt => save_inpt,
		 save_prev => save_prev,
		 save_shft => save_shft);


b2v_input_reg : register_row
PORT MAP(save => save_inpt,
		 nrst => nrst,
		 clk => clk,
		 data_in => data_in,
		 data_out => data_out_inpt_reg);


b2v_prev_reg : register_row
PORT MAP(save => save_prev,
		 nrst => nrst,
		 clk => clk,
		 data_in => data_out_inpt_reg,
		 data_out => data_out_prev_reg);


b2v_selector : byte_selector
PORT MAP(sel => sel,
		 data_in1 => data_out_inpt_reg,
		 data_in2 => data_out_shft_reg,
		 data_out => data_out);


b2v_shift_reg : shift_register
PORT MAP(carry => c_out,
		 save => save_shft,
		 nrst => nrst,
		 clk => clk,
		 data_in => data_out_addr,
		 data_out => data_out_shft_reg);


END bdf_type;