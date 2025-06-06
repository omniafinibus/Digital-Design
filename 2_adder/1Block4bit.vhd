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
-- CREATED		"Mon Oct 08 23:13:09 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY \1Block4bit\ IS 
	PORT
	(
		B0 :  IN  STD_LOGIC;
		B1 :  IN  STD_LOGIC;
		A1 :  IN  STD_LOGIC;
		A0 :  IN  STD_LOGIC;
		Cin0 :  IN  STD_LOGIC;
		B2 :  IN  STD_LOGIC;
		A2 :  IN  STD_LOGIC;
		B3 :  IN  STD_LOGIC;
		A3 :  IN  STD_LOGIC;
		S0 :  OUT  STD_LOGIC;
		S1 :  OUT  STD_LOGIC;
		S2 :  OUT  STD_LOGIC;
		S3 :  OUT  STD_LOGIC;
		Cout :  OUT  STD_LOGIC
	);
END \1Block4bit\;

ARCHITECTURE bdf_type OF \1Block4bit\ IS 

COMPONENT ass11_3_4bitadder
	PORT(Cin : IN STD_LOGIC;
		 B : IN STD_LOGIC;
		 A : IN STD_LOGIC;
		 S : OUT STD_LOGIC;
		 Cout : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	Cin1 :  STD_LOGIC;
SIGNAL	Cin2 :  STD_LOGIC;
SIGNAL	Cin3 :  STD_LOGIC;


BEGIN 



b2v_inst : ass11_3_4bitadder
PORT MAP(Cin => Cin0,
		 B => B0,
		 A => A0,
		 S => S0,
		 Cout => Cin1);


b2v_inst2 : ass11_3_4bitadder
PORT MAP(Cin => Cin1,
		 B => B1,
		 A => A1,
		 S => S1,
		 Cout => Cin2);


b2v_inst3 : ass11_3_4bitadder
PORT MAP(Cin => Cin2,
		 B => B2,
		 A => A2,
		 S => S2,
		 Cout => Cin3);


b2v_inst4 : ass11_3_4bitadder
PORT MAP(Cin => Cin3,
		 B => B3,
		 A => A3,
		 S => S3,
		 Cout => Cout);


END bdf_type;