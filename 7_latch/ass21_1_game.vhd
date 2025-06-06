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
-- CREATED		"Sun Feb 10 13:09:26 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY ass21_1_game IS 
	PORT
	(
		n_reset :  IN  STD_LOGIC;
		L0 :  INOUT  STD_LOGIC;
		L1 :  INOUT  STD_LOGIC;
		L2 :  INOUT  STD_LOGIC;
		players :  IN  STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END ass21_1_game;

ARCHITECTURE bdf_type OF ass21_1_game IS 

COMPONENT flippetyfloppetygetoffmyproperty
	PORT(S : IN STD_LOGIC;
		 R : IN STD_LOGIC;
		 Q : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT quiz_logic
	PORT(iReset_btn : IN STD_LOGIC;
		 iQlatch0 : IN STD_LOGIC;
		 iQlatch1 : IN STD_LOGIC;
		 iQlatch2 : IN STD_LOGIC;
		 oReset0 : INOUT STD_LOGIC;
		 oReset1 : INOUT STD_LOGIC;
		 oReset2 : INOUT STD_LOGIC;
		 iPlayers_btn : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 oSet0 : OUT STD_LOGIC;
		 oSet1 : OUT STD_LOGIC;
		 oSet2 : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	p0_reset :  STD_LOGIC;
SIGNAL	p0_set :  STD_LOGIC;
SIGNAL	p1_reset :  STD_LOGIC;
SIGNAL	p1_set :  STD_LOGIC;
SIGNAL	p2_reset :  STD_LOGIC;
SIGNAL	p2_set :  STD_LOGIC;


BEGIN 



b2v_inst : flippetyfloppetygetoffmyproperty
PORT MAP(S => p0_set,
		 R => p0_reset,
		 Q => L0);


b2v_inst2 : flippetyfloppetygetoffmyproperty
PORT MAP(S => p1_set,
		 R => p1_reset,
		 Q => L1);


b2v_inst3 : quiz_logic
PORT MAP(iReset_btn => n_reset,
		 iQlatch0 => L0,
		 iQlatch1 => L1,
		 iQlatch2 => L2,
		 oReset0 => p0_reset,
		 oReset1 => p1_reset,
		 oReset2 => p2_reset,
		 iPlayers_btn => players,
		 oSet0 => p0_set,
		 oSet1 => p1_set,
		 oSet2 => p2_set);


b2v_inst4 : flippetyfloppetygetoffmyproperty
PORT MAP(S => p2_set,
		 R => p2_reset,
		 Q => L2);


END bdf_type;