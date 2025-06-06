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
-- CREATED		"Fri Apr 05 14:17:47 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY cpu IS 
	PORT
	(
		nrst :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		instruction :  IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
		ovf :  OUT  STD_LOGIC;
		zero :  OUT  STD_LOGIC;
		address :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		rega :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		regb :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		s :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END cpu;

ARCHITECTURE bdf_type OF cpu IS 

COMPONENT reg
	PORT(nrst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 ld : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 outp : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT alu
	PORT(a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 ovf : OUT STD_LOGIC;
		 zero : OUT STD_LOGIC;
		 res : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT controller
	PORT(nrst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 opcode : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 pc_en : OUT STD_LOGIC;
		 mux_sel : OUT STD_LOGIC;
		 rega_ld : OUT STD_LOGIC;
		 regb_ld : OUT STD_LOGIC;
		 acu_ld : OUT STD_LOGIC;
		 alu_sel : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux2to1
	PORT(sel : IN STD_LOGIC;
		 in0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 in1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 outp : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT pc
	PORT(nrst : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 en : IN STD_LOGIC;
		 address : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	acu_ld :  STD_LOGIC;
SIGNAL	alu_sel :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	mux_out :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	mux_sel :  STD_LOGIC;
SIGNAL	opcode :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	operand :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	pc_en :  STD_LOGIC;
SIGNAL	regA_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	rega_ld :  STD_LOGIC;
SIGNAL	regB_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	regb_ld :  STD_LOGIC;
SIGNAL	res :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	s_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(3 DOWNTO 0);


BEGIN 



b2v_ACU : reg
PORT MAP(nrst => nrst,
		 clk => clk,
		 ld => acu_ld,
		 data => res,
		 outp => s_ALTERA_SYNTHESIZED);


b2v_alu : alu
PORT MAP(a => regA_ALTERA_SYNTHESIZED,
		 b => regB_ALTERA_SYNTHESIZED,
		 sel => alu_sel,
		 ovf => ovf,
		 zero => zero,
		 res => res);


b2v_controller : controller
PORT MAP(nrst => nrst,
		 clk => clk,
		 opcode => opcode,
		 pc_en => pc_en,
		 mux_sel => mux_sel,
		 rega_ld => rega_ld,
		 regb_ld => regb_ld,
		 acu_ld => acu_ld,
		 alu_sel => alu_sel);

operand <= instruction(3 DOWNTO 0);


opcode <= instruction(6 DOWNTO 4);



b2v_mux : mux2to1
PORT MAP(sel => mux_sel,
		 in0 => operand,
		 in1 => s_ALTERA_SYNTHESIZED,
		 outp => mux_out);


b2v_pc : pc
PORT MAP(nrst => nrst,
		 clk => clk,
		 en => pc_en,
		 address => address);


b2v_regAblock : reg
PORT MAP(nrst => nrst,
		 clk => clk,
		 ld => rega_ld,
		 data => operand,
		 outp => regA_ALTERA_SYNTHESIZED);


b2v_regBblock : reg
PORT MAP(nrst => nrst,
		 clk => clk,
		 ld => regb_ld,
		 data => mux_out,
		 outp => regB_ALTERA_SYNTHESIZED);

rega <= regA_ALTERA_SYNTHESIZED;
regb <= regB_ALTERA_SYNTHESIZED;
s <= s_ALTERA_SYNTHESIZED;

END bdf_type;