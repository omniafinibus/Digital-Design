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
-- CREATED		"Fri Nov 09 19:36:14 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY FourBitFullAdder IS 
	PORT
	(
		A :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		B :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Co3 :  OUT  STD_LOGIC;
		S :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		SEG_A :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
		SEG_B :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
		SEG_S :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END FourBitFullAdder;

ARCHITECTURE bdf_type OF FourBitFullAdder IS 

COMPONENT half_adder
	PORT(a : IN STD_LOGIC;
		 b : IN STD_LOGIC;
		 S : OUT STD_LOGIC;
		 Co : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT full_adder
	PORT(a : IN STD_LOGIC;
		 b : IN STD_LOGIC;
		 Ci : IN STD_LOGIC;
		 S : OUT STD_LOGIC;
		 Co : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT tohex_block
	PORT(A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 SEG : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	Co0 :  STD_LOGIC;
SIGNAL	Co1 :  STD_LOGIC;
SIGNAL	Co2 :  STD_LOGIC;
SIGNAL	S_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(3 DOWNTO 0);


BEGIN 



b2v_inst : half_adder
PORT MAP(a => A(0),
		 b => B(0),
		 S => S_ALTERA_SYNTHESIZED(0),
		 Co => Co0);


b2v_inst2 : full_adder
PORT MAP(a => A(1),
		 b => B(1),
		 Ci => Co0,
		 S => S_ALTERA_SYNTHESIZED(1),
		 Co => Co1);


b2v_inst3 : full_adder
PORT MAP(a => A(2),
		 b => B(2),
		 Ci => Co1,
		 S => S_ALTERA_SYNTHESIZED(2),
		 Co => Co2);


b2v_inst4 : full_adder
PORT MAP(a => A(3),
		 b => B(3),
		 Ci => Co2,
		 S => S_ALTERA_SYNTHESIZED(3),
		 Co => Co3);


b2v_inst5 : tohex_block
PORT MAP(A => B,
		 SEG => SEG_B);


b2v_inst6 : tohex_block
PORT MAP(A => A,
		 SEG => SEG_A);


b2v_inst7 : tohex_block
PORT MAP(A => S_ALTERA_SYNTHESIZED,
		 SEG => SEG_S);

S <= S_ALTERA_SYNTHESIZED;

END bdf_type;