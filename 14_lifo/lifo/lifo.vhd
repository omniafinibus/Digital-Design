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
-- CREATED		"Thu Apr 15 13:41:56 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY lifo IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		nrst :  IN  STD_LOGIC;
		push :  IN  STD_LOGIC;
		pop :  IN  STD_LOGIC;
		data_in :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		full :  OUT  STD_LOGIC;
		empty :  OUT  STD_LOGIC;
		data_out :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END lifo;

ARCHITECTURE bdf_type OF lifo IS 

COMPONENT address_counter
	PORT(incr : IN STD_LOGIC;
		 decr : IN STD_LOGIC;
		 nrst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 pop_pntr : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 push_pntr : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT controller
	PORT(push : IN STD_LOGIC;
		 pop : IN STD_LOGIC;
		 zero : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 full : OUT STD_LOGIC;
		 empty : OUT STD_LOGIC;
		 incr : OUT STD_LOGIC;
		 decr : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT comparator
	PORT(pop_pntr : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 push_pntr : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 zero : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT register_row
	PORT(save : IN STD_LOGIC;
		 nrst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 data_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 data_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT register_bank
	PORT(save : IN STD_LOGIC;
		 nrst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 data_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 pop_pntr : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 push_pntr : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 data_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	data_out_reg_bank :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	decr :  STD_LOGIC;
SIGNAL	incr :  STD_LOGIC;
SIGNAL	pop_pntr :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	push_pntr :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	zero :  STD_LOGIC_VECTOR(1 DOWNTO 0);


BEGIN 



b2v_address_counter : address_counter
PORT MAP(incr => incr,
		 decr => decr,
		 nrst => nrst,
		 clk => clk,
		 pop_pntr => pop_pntr,
		 push_pntr => push_pntr);


b2v_controller : controller
PORT MAP(push => push,
		 pop => pop,
		 zero => zero,
		 full => full,
		 empty => empty,
		 incr => incr,
		 decr => decr);


b2v_inst : comparator
PORT MAP(pop_pntr => pop_pntr,
		 push_pntr => push_pntr,
		 zero => zero);


b2v_output_register : register_row
PORT MAP(save => decr,
		 nrst => nrst,
		 clk => clk,
		 data_in => data_out_reg_bank,
		 data_out => data_out);


b2v_register_bank : register_bank
PORT MAP(save => incr,
		 nrst => nrst,
		 clk => clk,
		 data_in => data_in,
		 pop_pntr => pop_pntr,
		 push_pntr => push_pntr,
		 data_out => data_out_reg_bank);


END bdf_type;