LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY flag_zero IS
	PORT( 
		clk   : IN     std_logic;
		clear : IN     std_logic;
		load  : IN     std_logic;
		sum   : IN     std_logic_vector (3 DOWNTO 0);
		cout  : IN     std_logic;
		zero  : OUT    std_logic
	);
END flag_zero;

ARCHITECTURE level2 OF flag_zero IS

BEGIN
	
	process(clk)
	
	begin
		if rising_edge(clk) then
			if    clear='1' then
				zero  <= '1' after 10 ns;
			elsif load='1'  then
				if sum="0000" then
					zero <= '1' after 10 ns;
				else
					zero <= '0' after 10 ns;
				end if;
			elsif not( clear='0' and load='0') then
				zero  <= 'X' after 10 ns;
			end if;
		end if;
	end process;

END ARCHITECTURE;