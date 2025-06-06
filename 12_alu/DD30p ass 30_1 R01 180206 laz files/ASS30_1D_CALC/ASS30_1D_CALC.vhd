-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition"
-- CREATED		"Tue Feb 06 17:26:08 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY ASS30_1D_CALC IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		clear :  IN  STD_LOGIC;
		load :  IN  STD_LOGIC;
		ca :  IN  STD_LOGIC;
		cb :  IN  STD_LOGIC;
		opnd :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		zero :  OUT  STD_LOGIC;
		carry :  OUT  STD_LOGIC;
		acu :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END ASS30_1D_CALC;

ARCHITECTURE bdf_type OF ASS30_1D_CALC IS 

COMPONENT flags
	PORT(clk : IN STD_LOGIC;
		 clear : IN STD_LOGIC;
		 load : IN STD_LOGIC;
		 cout : IN STD_LOGIC;
		 sum : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 carry : OUT STD_LOGIC;
		 zero : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT acu_block
	PORT(load : IN STD_LOGIC;
		 clear : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 sum : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 acu : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT alu_block
	PORT(ca : IN STD_LOGIC;
		 cb : IN STD_LOGIC;
		 acu : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 opnd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 cout : OUT STD_LOGIC;
		 sum : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	acu_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	cout :  STD_LOGIC;
SIGNAL	sum :  STD_LOGIC_VECTOR(3 DOWNTO 0);


BEGIN 



b2v_inst : flags
PORT MAP(clk => clk,
		 clear => clear,
		 load => load,
		 cout => cout,
		 sum => sum,
		 carry => zero,
		 zero => carry);


b2v_inst2 : acu_block
PORT MAP(load => load,
		 clear => clear,
		 clk => clk,
		 sum => sum,
		 acu => acu_ALTERA_SYNTHESIZED);


b2v_inst3 : alu_block
PORT MAP(ca => ca,
		 cb => cb,
		 acu => acu_ALTERA_SYNTHESIZED,
		 opnd => opnd,
		 cout => cout,
		 sum => sum);

acu <= acu_ALTERA_SYNTHESIZED;

END bdf_type;