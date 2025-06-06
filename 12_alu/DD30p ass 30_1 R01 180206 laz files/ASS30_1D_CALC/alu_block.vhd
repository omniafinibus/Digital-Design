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
-- CREATED		"Mon Mar 30 21:37:22 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY alu_block IS 
	PORT
	(
		ca :  IN  STD_LOGIC;
		cb :  IN  STD_LOGIC;
		acu :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		opnd :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		cout :  OUT  STD_LOGIC;
		sum :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END alu_block;

ARCHITECTURE bdf_type OF alu_block IS 

COMPONENT alu_slice
	PORT(ca : IN STD_LOGIC;
		 cb : IN STD_LOGIC;
		 opnd : IN STD_LOGIC;
		 acu : IN STD_LOGIC;
		 ci : IN STD_LOGIC;
		 co : OUT STD_LOGIC;
		 sum : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	sum_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;


BEGIN 
SYNTHESIZED_WIRE_3 <= '0';



b2v_inst : alu_slice
PORT MAP(ca => ca,
		 cb => cb,
		 opnd => opnd(3),
		 acu => acu(3),
		 ci => SYNTHESIZED_WIRE_0,
		 co => cout,
		 sum => sum_ALTERA_SYNTHESIZED(3));


b2v_inst1 : alu_slice
PORT MAP(ca => ca,
		 cb => cb,
		 opnd => opnd(2),
		 acu => acu(2),
		 ci => SYNTHESIZED_WIRE_1,
		 co => SYNTHESIZED_WIRE_0,
		 sum => sum_ALTERA_SYNTHESIZED(2));


b2v_inst2 : alu_slice
PORT MAP(ca => ca,
		 cb => cb,
		 opnd => opnd(1),
		 acu => acu(1),
		 ci => SYNTHESIZED_WIRE_2,
		 co => SYNTHESIZED_WIRE_1,
		 sum => sum_ALTERA_SYNTHESIZED(1));


b2v_inst3 : alu_slice
PORT MAP(ca => ca,
		 cb => cb,
		 opnd => opnd(0),
		 acu => acu(0),
		 ci => SYNTHESIZED_WIRE_3,
		 co => SYNTHESIZED_WIRE_2,
		 sum => sum_ALTERA_SYNTHESIZED(0));


sum <= sum_ALTERA_SYNTHESIZED;

END bdf_type;