LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY flag_carry IS
	PORT( 
		clk   : IN     std_logic;
		clear : IN     std_logic;
		load  : IN     std_logic;
		cout  : IN     std_logic;
		carry : OUT  std_logic
	);
END flag_carry;

ARCHITECTURE level2 OF flag_carry IS
	signal D,buf : std_logic;
BEGIN
	
	mux:
	process(clear,load,cout, buf)
	
	begin
		if    clear = '1' then
			D <= '0' after 5 ns;
		elsif load  = '1' then
			D <= cout after 5 ns;
		else
			D <= buf after 5 ns;
		end if;
	end process;
	
	FF:
	process(clk)
	
	begin
		if rising_edge(clk) then
			buf <= D after 5 ns;
		end if;
	end process;
	
	carry <= buf;
END ARCHITECTURE;