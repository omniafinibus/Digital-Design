LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY acu_slice IS
	PORT( 
		clk   : IN     std_logic;
		clear : IN     std_logic;
		load  : IN     std_logic;
		sum   : IN     std_logic;
		acu   : OUT    std_logic
	);
END acu_slice;

ARCHITECTURE level2 OF acu_slice IS

BEGIN
	
	process(clk)
	
	begin
		if rising_edge(clk) then
			if    clear='1' then
				acu <= '0' after 10 ns;
			elsif load='1'  then
				acu <= sum after 10 ns;
			elsif not( clear='0' and load='0') then
				acu <= 'X' after 10 ns;
			end if;
		end if;
	end process;

END ARCHITECTURE;