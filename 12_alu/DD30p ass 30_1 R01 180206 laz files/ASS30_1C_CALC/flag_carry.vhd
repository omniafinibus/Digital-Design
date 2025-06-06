LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY flag_carry IS
	PORT( 
		clk   : IN     std_logic;
		clear : IN     std_logic;
		load  : IN     std_logic;
		cout  : IN     std_logic;
		carry : OUT    std_logic
	);
END flag_carry;

ARCHITECTURE level2 OF flag_carry IS

BEGIN
	
	process(clk)
	
	begin
		if rising_edge(clk) then
			if    clear='1' then
				carry <= '0' after 10 ns;
			elsif load='1'  then
				carry <= Cout after 10 ns;
			elsif not( clear='0' and load='0') then
				carry <= 'X' after 10 ns;
			end if;
		end if;
	end process;
	
END ARCHITECTURE;