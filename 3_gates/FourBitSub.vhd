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
-- CREATED		"Sun Nov 25 14:27:51 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY FourBitSub IS 
	PORT
	(
		Ci :  IN  STD_LOGIC;
		A :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		B :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Bo3 :  OUT  STD_LOGIC;
		S :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END FourBitSub;

ARCHITECTURE bdf_type OF FourBitSub IS 

COMPONENT full_subtractor
	PORT(A : IN STD_LOGIC;
		 B : IN STD_LOGIC;
		 Ci : IN STD_LOGIC;
		 S : OUT STD_LOGIC;
		 Bo : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	Bo0 :  STD_LOGIC;
SIGNAL	Bo1 :  STD_LOGIC;
SIGNAL	Bo2 :  STD_LOGIC;
SIGNAL	S_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(3 DOWNTO 0);


BEGIN 



b2v_inst : full_subtractor
PORT MAP(A => A(0),
		 B => B(0),
		 Ci => Ci,
		 S => S_ALTERA_SYNTHESIZED(0),
		 Bo => Bo0);


b2v_inst1 : full_subtractor
PORT MAP(A => A(1),
		 B => B(1),
		 Ci => Bo0,
		 S => S_ALTERA_SYNTHESIZED(1),
		 Bo => Bo1);


b2v_inst2 : full_subtractor
PORT MAP(A => A(2),
		 B => B(2),
		 Ci => Bo1,
		 S => S_ALTERA_SYNTHESIZED(2),
		 Bo => Bo2);


b2v_inst3 : full_subtractor
PORT MAP(A => A(3),
		 B => B(3),
		 Ci => Bo2,
		 S => S_ALTERA_SYNTHESIZED(3),
		 Bo => Bo3);

S <= S_ALTERA_SYNTHESIZED;

END bdf_type;