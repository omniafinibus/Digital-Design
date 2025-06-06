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
-- CREATED		"Mon Oct 08 07:11:51 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY FourBitAdd IS 
	PORT
	(
		Cin :  IN  STD_LOGIC;
		A	:	IN	 STD_LOGIC_VECTOR (3 downto 0);
		B	:	IN	 STD_LOGIC_VECTOR (3 downto 0);
		S	:	OUT STD_LOGIC_VECTOR (3 downto 0);
		Cout :  OUT  STD_LOGIC
	);
END FourBitAdd;

ARCHITECTURE bdf_type OF FourBitAdd IS 

COMPONENT Full_adder
	PORT(A : IN STD_LOGIC;
		 B : IN STD_LOGIC;
		 Cin : IN STD_LOGIC;
		 S : OUT STD_LOGIC;
		 Cout : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	Co0 :  STD_LOGIC;
SIGNAL	Co1 :  STD_LOGIC;
SIGNAL	Co2 :  STD_LOGIC;
SIGNAL	Co3 :  STD_LOGIC;

BEGIN 



B2v_inst : Full_adder
PORT MAP(A => A(0),
			B => B(0),
			Cin => Cin,
			S => S(0),
			Cout => Co0);


B2v_inst1 : Full_adder
PORT MAP(A => A(1),
			B => B(1),
			Cin => Co0,
			S => S(1),
			Cout => Co1);


B2v_inst2 : Full_adder
PORT MAP(A => A(2),
			B => B(2),
			Cin => Co1,
			S => S(2),
			Cout => Co2);


B2v_inst3 : Full_adder
PORT MAP(A => A(3),
			B => B(3),
			Cin => Co2,
			S => S(3),
			Cout => Co3);


END bdf_type;