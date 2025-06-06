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
-- CREATED		"Wed Mar 06 16:15:32 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY FullDataFlipFlop IS 
	PORT
	(
		D :  IN  STD_LOGIC;
		Nrst :  IN  STD_LOGIC;
		Clk :  IN  STD_LOGIC;
		Q :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END FullDataFlipFlop;

ARCHITECTURE bdf_type OF FullDataFlipFlop IS 

COMPONENT dataff
	PORT(D : IN STD_LOGIC;
		 Nrst : IN STD_LOGIC;
		 Clk : IN STD_LOGIC;
		 Q : OUT STD_LOGIC;
		 nQ : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	Q_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(3 DOWNTO 0);


BEGIN 



b2v_inst : dataff
PORT MAP(D => D,
		 Nrst => Nrst,
		 Clk => Clk,
		 Q => Q_ALTERA_SYNTHESIZED(3));


b2v_inst1 : dataff
PORT MAP(D => Q_ALTERA_SYNTHESIZED(3),
		 Nrst => Nrst,
		 Clk => Clk,
		 Q => Q_ALTERA_SYNTHESIZED(2));


b2v_inst2 : dataff
PORT MAP(D => Q_ALTERA_SYNTHESIZED(2),
		 Nrst => Nrst,
		 Clk => Clk,
		 Q => Q_ALTERA_SYNTHESIZED(1));


b2v_inst3 : dataff
PORT MAP(D => Q_ALTERA_SYNTHESIZED(1),
		 Nrst => Nrst,
		 Clk => Clk,
		 Q => Q_ALTERA_SYNTHESIZED(0));

Q <= Q_ALTERA_SYNTHESIZED;

END bdf_type;