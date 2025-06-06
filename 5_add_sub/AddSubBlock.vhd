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
-- CREATED		"Fri Nov 30 12:10:07 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY AddSubBlock IS 
	PORT
	(
		sel :  IN  STD_LOGIC;
		A :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		B :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		CoBo :  OUT  STD_LOGIC;
		Result :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END AddSubBlock;

ARCHITECTURE bdf_type OF AddSubBlock IS 

COMPONENT fourbitadd
	PORT(A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Cout : OUT STD_LOGIC;
		 S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT muxblock
	PORT(Cout : IN STD_LOGIC;
		 Bout : IN STD_LOGIC;
		 sel : IN STD_LOGIC;
		 S1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 S2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 CoBo : OUT STD_LOGIC;
		 Result : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT fourbitsub
	PORT(A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Bout : OUT STD_LOGIC;
		 S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	Bout :  STD_LOGIC;
SIGNAL	Cout :  STD_LOGIC;
SIGNAL	S1 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	S2 :  STD_LOGIC_VECTOR(3 DOWNTO 0);


BEGIN 



b2v_inst : fourbitadd
PORT MAP(A => A,
		 B => B,
		 Cout => Cout,
		 S => S1);


b2v_inst4 : muxblock
PORT MAP(Cout => Cout,
		 Bout => Bout,
		 sel => sel,
		 S1 => S1,
		 S2 => S2,
		 CoBo => CoBo,
		 Result => Result);


b2v_inst5 : fourbitsub
PORT MAP(A => A,
		 B => B,
		 Bout => Bout,
		 S => S2);


END bdf_type;