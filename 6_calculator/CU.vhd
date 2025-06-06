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
-- CREATED		"Mon Dec 24 23:09:24 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY CU IS 
	PORT
	(
		Cin :  IN  STD_LOGIC;
		A :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		B :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		countIn :  IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		Sel :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		Sign :  OUT  STD_LOGIC;
		Ovf :  OUT  STD_LOGIC;
		countOut :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		MINSIGN :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
		SEGA :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
		SEGB :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
		SEGRes :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END CU;

ARCHITECTURE bdf_type OF CU IS 

COMPONENT slice
	PORT(Cin : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 countIn : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 Sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 CoBo : OUT STD_LOGIC;
		 countOut3 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT tohex_block
	PORT(A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 SEG : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

COMPONENT to_signed_magnitude
	PORT(CiBi : IN STD_LOGIC;
		 S : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 SEL : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 sign : OUT STD_LOGIC;
		 ovf : OUT STD_LOGIC;
		 Res : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT min_sign_block
	PORT(inp : IN STD_LOGIC;
		 seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	S :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;


BEGIN 
Sign <= SYNTHESIZED_WIRE_2;



b2v_inst : slice
PORT MAP(Cin => Cin,
		 A => A,
		 B => B,
		 countIn => countIn,
		 Sel => Sel,
		 CoBo => SYNTHESIZED_WIRE_1,
		 countOut3 => countOut,
		 S => S);


b2v_inst10 : tohex_block
PORT MAP(A => SYNTHESIZED_WIRE_0,
		 SEG => SEGRes);


b2v_inst11 : to_signed_magnitude
PORT MAP(CiBi => SYNTHESIZED_WIRE_1,
		 S => S,
		 SEL => Sel,
		 sign => SYNTHESIZED_WIRE_2,
		 ovf => Ovf,
		 Res => SYNTHESIZED_WIRE_0);


b2v_inst6 : tohex_block
PORT MAP(A => B,
		 SEG => SEGB);


b2v_inst7 : tohex_block
PORT MAP(A => A,
		 SEG => SEGA);


b2v_inst9 : min_sign_block
PORT MAP(inp => SYNTHESIZED_WIRE_2,
		 seg => MINSIGN);


END bdf_type;