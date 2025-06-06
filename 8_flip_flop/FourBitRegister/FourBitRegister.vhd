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
-- CREATED		"Fri Mar 29 12:26:08 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY FourBitRegister IS 
	PORT
	(
		D :  IN  STD_LOGIC;
		Nrst :  IN  STD_LOGIC;
		Clk :  IN  STD_LOGIC;
		L3 :  OUT  STD_LOGIC;
		L2 :  OUT  STD_LOGIC;
		L1 :  OUT  STD_LOGIC;
		L0 :  OUT  STD_LOGIC
	);
END FourBitRegister;

ARCHITECTURE bdf_type OF FourBitRegister IS 

COMPONENT dataff
	PORT(D : IN STD_LOGIC;
		 Nrst : IN STD_LOGIC;
		 Clk : IN STD_LOGIC;
		 Q : OUT STD_LOGIC;
		 nQ : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;


BEGIN 
L3 <= SYNTHESIZED_WIRE_0;
L2 <= SYNTHESIZED_WIRE_1;
L1 <= SYNTHESIZED_WIRE_2;



b2v_inst : dataff
PORT MAP(D => D,
		 Nrst => Nrst,
		 Clk => Clk,
		 Q => SYNTHESIZED_WIRE_0);


b2v_inst1 : dataff
PORT MAP(D => SYNTHESIZED_WIRE_0,
		 Nrst => Nrst,
		 Clk => Clk,
		 Q => SYNTHESIZED_WIRE_1);


b2v_inst2 : dataff
PORT MAP(D => SYNTHESIZED_WIRE_1,
		 Nrst => Nrst,
		 Clk => Clk,
		 Q => SYNTHESIZED_WIRE_2);


b2v_inst3 : dataff
PORT MAP(D => SYNTHESIZED_WIRE_2,
		 Nrst => Nrst,
		 Clk => Clk,
		 Q => L0);


END bdf_type;