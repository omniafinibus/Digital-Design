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
-- CREATED		"Mon Dec 24 23:08:50 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Slice IS 
	PORT
	(
		Cin :  IN  STD_LOGIC;
		A :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		B :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		countIn :  IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		Sel :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		CoBo :  OUT  STD_LOGIC;
		countOut3 :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		S :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END Slice;

ARCHITECTURE bdf_type OF Slice IS 

COMPONENT cu_slice
	PORT(A : IN STD_LOGIC;
		 B : IN STD_LOGIC;
		 Ci : IN STD_LOGIC;
		 countIn : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 Sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 S : OUT STD_LOGIC;
		 CoBo : OUT STD_LOGIC;
		 countOut : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	Countout0 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	Countout1 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	Countout2 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	S_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;


BEGIN 



b2v_inst : cu_slice
PORT MAP(A => A(0),
		 B => B(0),
		 Ci => Cin,
		 countIn => countIn,
		 Sel => Sel,
		 S => S_ALTERA_SYNTHESIZED(0),
		 CoBo => SYNTHESIZED_WIRE_0,
		 countOut => Countout0);


b2v_inst2 : cu_slice
PORT MAP(A => A(1),
		 B => B(1),
		 Ci => SYNTHESIZED_WIRE_0,
		 countIn => Countout0,
		 Sel => Sel,
		 S => S_ALTERA_SYNTHESIZED(1),
		 CoBo => SYNTHESIZED_WIRE_1,
		 countOut => Countout1);


b2v_inst3 : cu_slice
PORT MAP(A => A(2),
		 B => B(2),
		 Ci => SYNTHESIZED_WIRE_1,
		 countIn => Countout1,
		 Sel => Sel,
		 S => S_ALTERA_SYNTHESIZED(2),
		 CoBo => SYNTHESIZED_WIRE_2,
		 countOut => Countout2);


b2v_inst4 : cu_slice
PORT MAP(A => A(3),
		 B => B(3),
		 Ci => SYNTHESIZED_WIRE_2,
		 countIn => Countout2,
		 Sel => Sel,
		 S => S_ALTERA_SYNTHESIZED(3),
		 CoBo => CoBo,
		 countOut => countOut3);

S <= S_ALTERA_SYNTHESIZED;

END bdf_type;