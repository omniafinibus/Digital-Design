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
-- CREATED		"Fri Mar 29 15:27:03 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY TestFullSystem IS 
	PORT
	(
		enGen :  IN  STD_LOGIC;
		NRST :  IN  STD_LOGIC;
		enFast :  IN  STD_LOGIC;
		enReg :  IN  STD_LOGIC;
		GND :  IN  STD_LOGIC;
		clock_1 :  IN  STD_LOGIC;
		CONTROL :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		CLK_1Hz :  OUT  STD_LOGIC;
		HEX0 :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX1 :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX4 :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX5 :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
		regOut :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END TestFullSystem;

ARCHITECTURE bdf_type OF TestFullSystem IS 

COMPONENT toseg
	PORT(bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

COMPONENT datagenerator
	PORT(CLK : IN STD_LOGIC;
		 NRST : IN STD_LOGIC;
		 enGen : IN STD_LOGIC;
		 enFast : IN STD_LOGIC;
		 DOUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT register8bit
	PORT(GND : IN STD_LOGIC;
		 enREG : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 nrst : IN STD_LOGIC;
		 control : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 Din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 regOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	count_val :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	enFastInt :  STD_LOGIC;
SIGNAL	enGenInt :  STD_LOGIC;
SIGNAL	regOut_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;


BEGIN 
CLK_1Hz <= clock_1;



b2v_inst : toseg
PORT MAP(bcd => count_val(7 DOWNTO 4),
		 seg => HEX1);


SYNTHESIZED_WIRE_0 <= NOT(enReg);



b2v_inst10 : datagenerator
PORT MAP(CLK => clock_1,
		 NRST => NRST,
		 enGen => enGenInt,
		 enFast => enFastInt,
		 DOUT => count_val);


enGenInt <= NOT(enGen);



b2v_inst13 : toseg
PORT MAP(bcd => count_val(3 DOWNTO 0),
		 seg => HEX0);


enFastInt <= NOT(enFast);



b2v_inst15 : toseg
PORT MAP(bcd => regOut_ALTERA_SYNTHESIZED(3 DOWNTO 0),
		 seg => HEX4);


b2v_inst3 : toseg
PORT MAP(bcd => regOut_ALTERA_SYNTHESIZED(7 DOWNTO 4),
		 seg => HEX5);


b2v_inst4 : register8bit
PORT MAP(GND => GND,
		 enREG => SYNTHESIZED_WIRE_0,
		 clk => clock_1,
		 nrst => NRST,
		 control => CONTROL,
		 Din => count_val,
		 regOut => regOut_ALTERA_SYNTHESIZED);

regOut <= regOut_ALTERA_SYNTHESIZED;

END bdf_type;