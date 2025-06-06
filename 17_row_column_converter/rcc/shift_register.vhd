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
-- CREATED		"Wed Mar 03 16:34:23 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY shift_register IS 
	PORT
	(
		data_in :  IN  STD_LOGIC;
		save_data :  IN  STD_LOGIC;
		nrst :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		output :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END shift_register;

ARCHITECTURE bdf_type OF shift_register IS 

COMPONENT register_bitslice
	PORT(data_in : IN STD_LOGIC;
		 save : IN STD_LOGIC;
		 nrst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 data_out : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	outp_data :  STD_LOGIC_VECTOR(3 DOWNTO 0);


BEGIN 



b2v_inst1 : register_bitslice
PORT MAP(data_in => data_in,
		 save => save_data,
		 nrst => nrst,
		 clk => clk,
		 data_out => outp_data(3));


b2v_inst2 : register_bitslice
PORT MAP(data_in => outp_data(3),
		 save => save_data,
		 nrst => nrst,
		 clk => clk,
		 data_out => outp_data(2));


b2v_inst3 : register_bitslice
PORT MAP(data_in => outp_data(2),
		 save => save_data,
		 nrst => nrst,
		 clk => clk,
		 data_out => outp_data(1));


b2v_inst4 : register_bitslice
PORT MAP(data_in => outp_data(1),
		 save => save_data,
		 nrst => nrst,
		 clk => clk,
		 data_out => outp_data(0));

output <= outp_data;

END bdf_type;