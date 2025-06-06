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
-- CREATED		"Fri Apr 05 14:23:49 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY computer IS 
	PORT
	(
		nrst :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		ovf :  OUT  STD_LOGIC;
		zero :  OUT  STD_LOGIC;
		address :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		rega :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		regb :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		s :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END computer;

ARCHITECTURE bdf_type OF computer IS 

COMPONENT prog_mem
	PORT(address : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 instruction : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

COMPONENT cpu
	PORT(nrst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 instruction : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 ovf : OUT STD_LOGIC;
		 zero : OUT STD_LOGIC;
		 address : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 rega : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 regb : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 s : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	address_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	instruction :  STD_LOGIC_VECTOR(6 DOWNTO 0);


BEGIN 



b2v_inst : prog_mem
PORT MAP(address => address_ALTERA_SYNTHESIZED,
		 instruction => instruction);


b2v_inst4 : cpu
PORT MAP(nrst => nrst,
		 clk => clk,
		 instruction => instruction,
		 ovf => ovf,
		 zero => zero,
		 address => address_ALTERA_SYNTHESIZED,
		 rega => rega,
		 regb => regb,
		 s => s);

address <= address_ALTERA_SYNTHESIZED;

END bdf_type;