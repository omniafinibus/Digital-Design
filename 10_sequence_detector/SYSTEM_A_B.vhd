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
-- CREATED		"Fri May 10 22:05:38 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY SYSTEM_A_B IS 
	PORT
	(
		data_in :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		nrst :  IN  STD_LOGIC;
		NUMA :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		NUMB :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END SYSTEM_A_B;

ARCHITECTURE bdf_type OF SYSTEM_A_B IS 

COMPONENT system_a
	PORT(data_in : IN STD_LOGIC;
		 nrst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 num : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT system_b
	PORT(data_in : IN STD_LOGIC;
		 nrst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 num : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;



BEGIN 



b2v_inst1 : system_a
PORT MAP(data_in => data_in,
		 nrst => nrst,
		 clk => clk,
		 num => NUMA);


b2v_inst2 : system_b
PORT MAP(data_in => data_in,
		 nrst => nrst,
		 clk => clk,
		 num => NUMB);


END bdf_type;