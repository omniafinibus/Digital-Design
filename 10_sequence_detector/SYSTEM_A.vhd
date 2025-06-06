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
-- CREATED		"Fri May 10 19:41:54 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY SYSTEM_A IS 
	PORT
	(
		data_in :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		nrst :  IN  STD_LOGIC;
		num :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END SYSTEM_A;

ARCHITECTURE bdf_type OF SYSTEM_A IS 

COMPONENT counter
	PORT(ENABLE : IN STD_LOGIC;
		 NRST : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 DOUT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT detector
	PORT(data_in : IN STD_LOGIC;
		 nrst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 output : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	outputDetector :  STD_LOGIC;


BEGIN 



b2v_inst : counter
PORT MAP(ENABLE => outputDetector,
		 NRST => nrst,
		 CLK => clk,
		 DOUT => num);


b2v_inst1 : detector
PORT MAP(data_in => data_in,
		 nrst => nrst,
		 clk => clk,
		 output => outputDetector);


END bdf_type;