LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY ass11_1 IS 
	PORT
	(
		A0 :  IN  STD_LOGIC;
		A1 :  IN  STD_LOGIC;
		A2 :  IN  STD_LOGIC;
		F :  OUT  STD_LOGIC
	);
END ass11_1;

ARCHITECTURE bdf_type OF ass11_1 IS 

COMPONENT block_table
	PORT(A0 : IN STD_LOGIC;
		 A1 : IN STD_LOGIC;
		 A2 : IN STD_LOGIC;
		 F : OUT STD_LOGIC
	);
END COMPONENT;



BEGIN 



b2v_inst1 : block_table
PORT MAP(A0 => A0,
		 A1 => A1,
		 A2 => A2,
		 F => F);


END bdf_type;