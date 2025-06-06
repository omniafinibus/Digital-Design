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
-- CREATED		"Sun Dec 23 19:39:47 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY singleSlice IS 
	PORT
	(
		A :  IN  STD_LOGIC;
		B :  IN  STD_LOGIC;
		Ci :  IN  STD_LOGIC;
		countIn :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		Sel :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		S :  OUT  STD_LOGIC;
		CoBo :  OUT  STD_LOGIC;
		countOut :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END singleSlice;

ARCHITECTURE bdf_type OF singleSlice IS 

COMPONENT cu_slice
	PORT(A : IN STD_LOGIC;
		 B : IN STD_LOGIC;
		 Ci : IN STD_LOGIC;
		 countIn : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 Sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 S : OUT STD_LOGIC;
		 CoBo : OUT STD_LOGIC;
		 countOut : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;



BEGIN 



b2v_inst : cu_slice
PORT MAP(A => A,
		 B => B,
		 Ci => Ci,
		 countIn => countIn,
		 Sel => Sel,
		 S => S,
		 CoBo => CoBo,
		 countOut => countOut);


END bdf_type;