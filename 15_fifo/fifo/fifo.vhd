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
-- CREATED		"Wed Apr 21 18:22:07 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY fifo IS 
	PORT
	(
		push :  IN  STD_LOGIC;
		pop :  IN  STD_LOGIC;
		nrst :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		data_in :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		full :  OUT  STD_LOGIC;
		empty :  OUT  STD_LOGIC;
		data_out :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END fifo;

ARCHITECTURE bdf_type OF fifo IS 

COMPONENT comparator
	PORT(pop_pntr : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 push_pntr : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 zero : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT pop_controller
	PORT(pop : IN STD_LOGIC;
		 nrst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 zero : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 load : OUT STD_LOGIC;
		 empty : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT address_counter
	PORT(incr : IN STD_LOGIC;
		 nrst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 address : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT register_bitslice
	PORT(data_in : IN STD_LOGIC;
		 save : IN STD_LOGIC;
		 nrst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 data_out : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT push_controller
	PORT(push : IN STD_LOGIC;
		 zero_full : IN STD_LOGIC;
		 nrst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 full : OUT STD_LOGIC;
		 save : OUT STD_LOGIC
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

SIGNAL	data_out_reg_block :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	load :  STD_LOGIC;
SIGNAL	pop_mem_out :  STD_LOGIC;
SIGNAL	pop_pntr :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	push_controller_full :  STD_LOGIC;
SIGNAL	push_pntr :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	save :  STD_LOGIC;
SIGNAL	vcc :  STD_LOGIC;
SIGNAL	zero :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;


BEGIN 



b2v_comp : comparator
PORT MAP(pop_pntr => pop_pntr,
		 push_pntr => push_pntr,
		 zero => zero);


SYNTHESIZED_WIRE_0 <= NOT(pop_mem_out);




full <= push_controller_full AND SYNTHESIZED_WIRE_0;


b2v_pop_controller : pop_controller
PORT MAP(pop => pop,
		 nrst => nrst,
		 clk => clk,
		 zero => zero,
		 load => load,
		 empty => empty);


b2v_pop_counter : address_counter
PORT MAP(incr => load,
		 nrst => nrst,
		 clk => clk,
		 address => pop_pntr);


b2v_pop_memory : register_bitslice
PORT MAP(data_in => vcc,
		 save => load,
		 nrst => nrst,
		 clk => clk,
		 data_out => pop_mem_out);


b2v_push_controller : push_controller
PORT MAP(push => push,
		 zero_full => zero(1),
		 nrst => nrst,
		 clk => clk,
		 full => push_controller_full,
		 save => save);


b2v_push_counter : address_counter
PORT MAP(incr => save,
		 nrst => nrst,
		 clk => clk,
		 address => push_pntr);


b2v_register_row : register_row
PORT MAP(save => load,
		 nrst => nrst,
		 clk => clk,
		 data_in => data_out_reg_block,
		 data_out => data_out);


b2v_regitser_bank : register_bank
PORT MAP(save => save,
		 nrst => nrst,
		 clk => clk,
		 data_in => data_in,
		 pop_pntr => pop_pntr,
		 push_pntr => push_pntr,
		 data_out => data_out_reg_block);


vcc <= '1';
END bdf_type;