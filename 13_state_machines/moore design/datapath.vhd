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
-- CREATED		"Sun Feb 04 19:53:03 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY datapath IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		st_short :  IN  STD_LOGIC;
		st_long :  IN  STD_LOGIC;
		clear :  IN  STD_LOGIC;
		tmr_done :  OUT  STD_LOGIC
	);
END datapath;

ARCHITECTURE bdf_type OF datapath IS 

COMPONENT timer
GENERIC (runtime : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 clear : IN STD_LOGIC;
		 start : IN STD_LOGIC;
		 done : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	long_done :  STD_LOGIC;
SIGNAL	short_done :  STD_LOGIC;


BEGIN 



b2v_inst : timer
GENERIC MAP(runtime => 3
			)
PORT MAP(clk => clk,
		 clear => clear,
		 start => st_short,
		 done => short_done);


tmr_done <= short_done AND long_done;


b2v_inst2 : timer
GENERIC MAP(runtime => 6
			)
PORT MAP(clk => clk,
		 clear => clear,
		 start => st_long,
		 done => long_done);


END bdf_type;