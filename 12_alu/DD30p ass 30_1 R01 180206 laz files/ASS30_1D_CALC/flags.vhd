-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition"
-- CREATED		"Tue Feb 06 17:34:14 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY flags IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		clear :  IN  STD_LOGIC;
		load :  IN  STD_LOGIC;
		cout :  IN  STD_LOGIC;
		sum :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		carry :  OUT  STD_LOGIC;
		zero :  OUT  STD_LOGIC
	);
END flags;

ARCHITECTURE bdf_type OF flags IS 

COMPONENT flag_carry
	PORT(clk : IN STD_LOGIC;
		 clear : IN STD_LOGIC;
		 load : IN STD_LOGIC;
		 cout : IN STD_LOGIC;
		 carry : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT flag_zero
	PORT(clk : IN STD_LOGIC;
		 clear : IN STD_LOGIC;
		 load : IN STD_LOGIC;
		 sum : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 zero : OUT STD_LOGIC
	);
END COMPONENT;



BEGIN 



b2v_inst : flag_carry
PORT MAP(clk => clk,
		 clear => clear,
		 load => load,
		 cout => cout,
		 carry => carry);


b2v_inst2 : flag_zero
PORT MAP(clk => clk,
		 clear => clear,
		 load => load,
		 sum => sum,
		 zero => zero);


END bdf_type;