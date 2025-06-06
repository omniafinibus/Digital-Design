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
-- CREATED		"Wed Feb 06 15:06:42 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY FlippetyFloppetyGetOffMyProperty IS 
	PORT
	(
		S :  IN  STD_LOGIC;
		R :  IN  STD_LOGIC;
		Q :  OUT  STD_LOGIC
	);
END FlippetyFloppetyGetOffMyProperty;

ARCHITECTURE bdf_type OF FlippetyFloppetyGetOffMyProperty IS 

COMPONENT rsflip_flop
	PORT(S : IN STD_LOGIC;
		 R : IN STD_LOGIC;
		 Q : OUT STD_LOGIC
	);
END COMPONENT;



BEGIN 



b2v_inst : rsflip_flop
PORT MAP(S => S,
		 R => R,
		 Q => Q);


END bdf_type;