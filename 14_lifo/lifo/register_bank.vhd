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
-- CREATED		"Wed Mar 10 12:43:34 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY register_bank IS 
	PORT
	(
		nrst :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		save :  IN  STD_LOGIC;
		data_in :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		pop_pntr :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		push_pntr :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		data_out :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END register_bank;

ARCHITECTURE bdf_type OF register_bank IS 

COMPONENT in_mux
	PORT(save_in : IN STD_LOGIC;
		 sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 save_out0 : OUT STD_LOGIC;
		 save_out1 : OUT STD_LOGIC;
		 save_out2 : OUT STD_LOGIC;
		 save_out3 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT out_mux
	PORT(data_in0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 data_in1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 data_in2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 data_in3 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 data_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT register_row
	PORT(save : IN STD_LOGIC;
		 nrst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 data_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 data_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	data_row0 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	data_row1 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	data_row2 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	data_row3 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	save_out0 :  STD_LOGIC;
SIGNAL	save_out1 :  STD_LOGIC;
SIGNAL	save_out2 :  STD_LOGIC;
SIGNAL	save_out3 :  STD_LOGIC;


BEGIN 



b2v_in_mux : in_mux
PORT MAP(save_in => save,
		 sel => push_pntr,
		 save_out0 => save_out0,
		 save_out1 => save_out1,
		 save_out2 => save_out2,
		 save_out3 => save_out3);


b2v_out_mux : out_mux
PORT MAP(data_in0 => data_row0,
		 data_in1 => data_row1,
		 data_in2 => data_row2,
		 data_in3 => data_row3,
		 sel => pop_pntr,
		 data_out => data_out);


b2v_reg_row0 : register_row
PORT MAP(save => save_out0,
		 nrst => nrst,
		 clk => clk,
		 data_in => data_in,
		 data_out => data_row0);


b2v_reg_row1 : register_row
PORT MAP(save => save_out1,
		 nrst => nrst,
		 clk => clk,
		 data_in => data_in,
		 data_out => data_row1);


b2v_reg_row2 : register_row
PORT MAP(save => save_out2,
		 nrst => nrst,
		 clk => clk,
		 data_in => data_in,
		 data_out => data_row2);


b2v_reg_row3 : register_row
PORT MAP(save => save_out3,
		 nrst => nrst,
		 clk => clk,
		 data_in => data_in,
		 data_out => data_row3);


END bdf_type;