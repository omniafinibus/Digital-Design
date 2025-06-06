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
-- CREATED		"Fri Mar 29 15:26:43 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY SliceWithHol IS 
	PORT
	(
		GND :  IN  STD_LOGIC;
		EnReg :  IN  STD_LOGIC;
		D :  IN  STD_LOGIC;
		Clk :  IN  STD_LOGIC;
		Nrst :  IN  STD_LOGIC;
		Control :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		Q :  OUT  STD_LOGIC
	);
END SliceWithHol;

ARCHITECTURE bdf_type OF SliceWithHol IS 

COMPONENT register_slice
	PORT(Hold : IN STD_LOGIC;
		 Shift : IN STD_LOGIC;
		 EnReg : IN STD_LOGIC;
		 D : IN STD_LOGIC;
		 Clk : IN STD_LOGIC;
		 Nrst : IN STD_LOGIC;
		 Control : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 Q : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;


BEGIN 
Q <= SYNTHESIZED_WIRE_0;



b2v_inst : register_slice
PORT MAP(Hold => SYNTHESIZED_WIRE_0,
		 Shift => GND,
		 EnReg => EnReg,
		 D => D,
		 Clk => Clk,
		 Nrst => Nrst,
		 Control => Control,
		 Q => SYNTHESIZED_WIRE_0);


END bdf_type;