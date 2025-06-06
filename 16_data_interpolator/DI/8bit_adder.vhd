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
-- CREATED		"Thu Apr 01 16:42:09 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY \8bit_adder\ IS 
	PORT
	(
		data_in1 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		data_in2 :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		c_out :  OUT  STD_LOGIC;
		data_out :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END \8bit_adder\;

ARCHITECTURE bdf_type OF \8bit_adder\ IS 

COMPONENT adder_bitslice
	PORT(c_in : IN STD_LOGIC;
		 data_in1 : IN STD_LOGIC;
		 data_in2 : IN STD_LOGIC;
		 data_out : OUT STD_LOGIC;
		 c_out : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	data_out_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;


BEGIN 
SYNTHESIZED_WIRE_0 <= '0';



b2v_bit0 : adder_bitslice
PORT MAP(c_in => SYNTHESIZED_WIRE_0,
		 data_in1 => data_in1(0),
		 data_in2 => data_in2(0),
		 data_out => data_out_ALTERA_SYNTHESIZED(0),
		 c_out => SYNTHESIZED_WIRE_1);


b2v_bit1 : adder_bitslice
PORT MAP(c_in => SYNTHESIZED_WIRE_1,
		 data_in1 => data_in1(1),
		 data_in2 => data_in2(1),
		 data_out => data_out_ALTERA_SYNTHESIZED(1),
		 c_out => SYNTHESIZED_WIRE_2);


b2v_bit2 : adder_bitslice
PORT MAP(c_in => SYNTHESIZED_WIRE_2,
		 data_in1 => data_in1(2),
		 data_in2 => data_in2(2),
		 data_out => data_out_ALTERA_SYNTHESIZED(2),
		 c_out => SYNTHESIZED_WIRE_3);


b2v_bit3 : adder_bitslice
PORT MAP(c_in => SYNTHESIZED_WIRE_3,
		 data_in1 => data_in1(3),
		 data_in2 => data_in2(3),
		 data_out => data_out_ALTERA_SYNTHESIZED(3),
		 c_out => SYNTHESIZED_WIRE_4);


b2v_bit4 : adder_bitslice
PORT MAP(c_in => SYNTHESIZED_WIRE_4,
		 data_in1 => data_in1(4),
		 data_in2 => data_in2(4),
		 data_out => data_out_ALTERA_SYNTHESIZED(4),
		 c_out => SYNTHESIZED_WIRE_5);


b2v_bit5 : adder_bitslice
PORT MAP(c_in => SYNTHESIZED_WIRE_5,
		 data_in1 => data_in1(5),
		 data_in2 => data_in2(5),
		 data_out => data_out_ALTERA_SYNTHESIZED(5),
		 c_out => SYNTHESIZED_WIRE_6);


b2v_bit6 : adder_bitslice
PORT MAP(c_in => SYNTHESIZED_WIRE_6,
		 data_in1 => data_in1(6),
		 data_in2 => data_in2(6),
		 data_out => data_out_ALTERA_SYNTHESIZED(6),
		 c_out => SYNTHESIZED_WIRE_7);


b2v_bit7 : adder_bitslice
PORT MAP(c_in => SYNTHESIZED_WIRE_7,
		 data_in1 => data_in1(7),
		 data_in2 => data_in2(7),
		 data_out => data_out_ALTERA_SYNTHESIZED(7),
		 c_out => c_out);


data_out <= data_out_ALTERA_SYNTHESIZED;

END bdf_type;