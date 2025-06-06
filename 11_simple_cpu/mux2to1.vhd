LIBRARY ieee;
USE ieee.std_logic_1164.all;


--  Entity Declaration

ENTITY mux2to1 IS
	PORT
	(
		in0  : IN  STD_LOGIC_VECTOR(3 downto 0);
		in1  : IN  STD_LOGIC_VECTOR(3 downto 0);
		sel  : IN  STD_LOGIC;
		outp : OUT STD_LOGIC_VECTOR(3 downto 0)
	);
END mux2to1;


--  Architecture Body

ARCHITECTURE mux2to1_architecture OF mux2to1 IS


BEGIN
	
	process(in0, in1, sel)
	begin
		if(sel = '0') then
			outp <= in0 after 2 ns;	
		else
			outp <= in1 after 2 ns;
		end if;
		
	end process;
	
END mux2to1_architecture;
