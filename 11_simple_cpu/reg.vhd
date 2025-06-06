LIBRARY ieee;
USE ieee.std_logic_1164.all;


--  Entity Declaration

ENTITY reg IS
	PORT
	(
		nrst : IN STD_LOGIC;
		clk  : IN STD_LOGIC;
		ld   : IN STD_LOGIC;
		data : IN STD_LOGIC_VECTOR(3 downto 0);
		outp : OUT STD_LOGIC_VECTOR(3 downto 0)
	);
END reg;


--  Architecture Body

ARCHITECTURE reg_architecture OF reg IS


BEGIN

	process (clk, nrst)
	begin
		if nrst='0' then
			outp <= "0000" after 2 ns;
		
		elsif(rising_edge(clk)) then
			if ld = '1' then
				outp <= data after 2 ns;
			end if;
		end if;
		
	end process;	
END reg_architecture;
