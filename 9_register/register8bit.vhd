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
-- CREATED		"Fri Mar 29 15:26:16 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY register8bit IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		nrst :  IN  STD_LOGIC;
		enREG :  IN  STD_LOGIC;
		GND :  IN  STD_LOGIC;
		control :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		Din :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		regOut :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END register8bit;

ARCHITECTURE bdf_type OF register8bit IS 

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

SIGNAL	regOut_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 



b2v_inst : register_slice
PORT MAP(Hold => regOut_ALTERA_SYNTHESIZED(7),
		 Shift => regOut_ALTERA_SYNTHESIZED(6),
		 EnReg => enREG,
		 D => Din(7),
		 Clk => clk,
		 Nrst => nrst,
		 Control => control,
		 Q => regOut_ALTERA_SYNTHESIZED(7));


b2v_inst1 : register_slice
PORT MAP(Hold => regOut_ALTERA_SYNTHESIZED(6),
		 Shift => regOut_ALTERA_SYNTHESIZED(5),
		 EnReg => enREG,
		 D => Din(6),
		 Clk => clk,
		 Nrst => nrst,
		 Control => control,
		 Q => regOut_ALTERA_SYNTHESIZED(6));


b2v_inst2 : register_slice
PORT MAP(Hold => regOut_ALTERA_SYNTHESIZED(5),
		 Shift => regOut_ALTERA_SYNTHESIZED(4),
		 EnReg => enREG,
		 D => Din(5),
		 Clk => clk,
		 Nrst => nrst,
		 Control => control,
		 Q => regOut_ALTERA_SYNTHESIZED(5));


b2v_inst3 : register_slice
PORT MAP(Hold => regOut_ALTERA_SYNTHESIZED(3),
		 Shift => regOut_ALTERA_SYNTHESIZED(2),
		 EnReg => enREG,
		 D => Din(3),
		 Clk => clk,
		 Nrst => nrst,
		 Control => control,
		 Q => regOut_ALTERA_SYNTHESIZED(3));


b2v_inst4 : register_slice
PORT MAP(Hold => regOut_ALTERA_SYNTHESIZED(4),
		 Shift => regOut_ALTERA_SYNTHESIZED(3),
		 EnReg => enREG,
		 D => Din(4),
		 Clk => clk,
		 Nrst => nrst,
		 Control => control,
		 Q => regOut_ALTERA_SYNTHESIZED(4));


b2v_inst5 : register_slice
PORT MAP(Hold => regOut_ALTERA_SYNTHESIZED(2),
		 Shift => regOut_ALTERA_SYNTHESIZED(1),
		 EnReg => enREG,
		 D => Din(2),
		 Clk => clk,
		 Nrst => nrst,
		 Control => control,
		 Q => regOut_ALTERA_SYNTHESIZED(2));


b2v_inst6 : register_slice
PORT MAP(Hold => regOut_ALTERA_SYNTHESIZED(1),
		 Shift => regOut_ALTERA_SYNTHESIZED(0),
		 EnReg => enREG,
		 D => Din(1),
		 Clk => clk,
		 Nrst => nrst,
		 Control => control,
		 Q => regOut_ALTERA_SYNTHESIZED(1));


b2v_inst7 : register_slice
PORT MAP(Hold => regOut_ALTERA_SYNTHESIZED(0),
		 Shift => GND,
		 EnReg => enREG,
		 D => Din(0),
		 Clk => clk,
		 Nrst => nrst,
		 Control => control,
		 Q => regOut_ALTERA_SYNTHESIZED(0));

regOut <= regOut_ALTERA_SYNTHESIZED;

END bdf_type;