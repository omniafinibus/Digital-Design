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
-- CREATED		"Sun Apr 12 18:16:16 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Mealy_traffic_lights IS 
	PORT
	(
		car :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		nrst :  IN  STD_LOGIC;
		farmroad :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		highway :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END Mealy_traffic_lights;

ARCHITECTURE bdf_type OF Mealy_traffic_lights IS 

COMPONENT datapath
	PORT(clk : IN STD_LOGIC;
		 st_short : IN STD_LOGIC;
		 st_long : IN STD_LOGIC;
		 clear : IN STD_LOGIC;
		 tmr_done : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT controller_mealy
	PORT(nrst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 car : IN STD_LOGIC;
		 tmr_done : IN STD_LOGIC;
		 clear : OUT STD_LOGIC;
		 st_short : OUT STD_LOGIC;
		 st_long : OUT STD_LOGIC;
		 farmroad : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 highway : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	clear :  STD_LOGIC;
SIGNAL	st_long :  STD_LOGIC;
SIGNAL	st_short :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;


BEGIN 



b2v_inst : datapath
PORT MAP(clk => clk,
		 st_short => st_short,
		 st_long => st_long,
		 clear => clear,
		 tmr_done => SYNTHESIZED_WIRE_0);


b2v_inst1 : controller_mealy
PORT MAP(nrst => nrst,
		 clk => clk,
		 car => car,
		 tmr_done => SYNTHESIZED_WIRE_0,
		 clear => clear,
		 st_short => st_short,
		 st_long => st_long,
		 farmroad => farmroad,
		 highway => highway);


END bdf_type;