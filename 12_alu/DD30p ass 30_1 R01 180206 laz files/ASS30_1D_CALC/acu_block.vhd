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
-- CREATED		"Mon Jan 22 22:18:51 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY acu_block IS 
	PORT
	(
		load :  IN  STD_LOGIC;
		clear :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		sum :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		acu :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END acu_block;

ARCHITECTURE bdf_type OF acu_block IS 

COMPONENT acu_slice
	PORT(clk : IN STD_LOGIC;
		 clear : IN STD_LOGIC;
		 load : IN STD_LOGIC;
		 sum : IN STD_LOGIC;
		 acu : INOUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	acu_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(3 DOWNTO 0);


BEGIN 



b2v_inst : acu_slice
PORT MAP(clk => clk,
		 clear => clear,
		 load => load,
		 sum => sum(0),
		 acu => acu_ALTERA_SYNTHESIZED(0));


b2v_inst2 : acu_slice
PORT MAP(clk => clk,
		 clear => clear,
		 load => load,
		 sum => sum(1),
		 acu => acu_ALTERA_SYNTHESIZED(1));


b2v_inst3 : acu_slice
PORT MAP(clk => clk,
		 clear => clear,
		 load => load,
		 sum => sum(2),
		 acu => acu_ALTERA_SYNTHESIZED(2));


b2v_inst4 : acu_slice
PORT MAP(clk => clk,
		 clear => clear,
		 load => load,
		 sum => sum(3),
		 acu => acu_ALTERA_SYNTHESIZED(3));

acu <= acu_ALTERA_SYNTHESIZED;

END bdf_type;