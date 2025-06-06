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
-- CREATED		"Wed Mar 10 12:42:51 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY register_row IS 
	PORT
	(
		save :  IN  STD_LOGIC;
		nrst :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		data_in :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		data_out :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END register_row;

ARCHITECTURE bdf_type OF register_row IS 

COMPONENT register_bitslice
	PORT(data_in : IN STD_LOGIC;
		 save : IN STD_LOGIC;
		 nrst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 data_out : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	data_out_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(3 DOWNTO 0);


BEGIN 



b2v_reg0 : register_bitslice
PORT MAP(data_in => data_in(0),
		 save => save,
		 nrst => nrst,
		 clk => clk,
		 data_out => data_out_ALTERA_SYNTHESIZED(0));


b2v_reg1 : register_bitslice
PORT MAP(data_in => data_in(1),
		 save => save,
		 nrst => nrst,
		 clk => clk,
		 data_out => data_out_ALTERA_SYNTHESIZED(1));


b2v_reg2 : register_bitslice
PORT MAP(data_in => data_in(2),
		 save => save,
		 nrst => nrst,
		 clk => clk,
		 data_out => data_out_ALTERA_SYNTHESIZED(2));


b2v_reg3 : register_bitslice
PORT MAP(data_in => data_in(3),
		 save => save,
		 nrst => nrst,
		 clk => clk,
		 data_out => data_out_ALTERA_SYNTHESIZED(3));

data_out <= data_out_ALTERA_SYNTHESIZED;

END bdf_type;