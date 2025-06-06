LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY flag_zero IS
	PORT( 
		clk   : IN     std_logic;
		clear : IN     std_logic;
		load  : IN     std_logic;
		sum   : IN     std_logic_vector (3 DOWNTO 0);
		zero  : OUT  std_logic
	);
END flag_zero;

ARCHITECTURE level2 OF flag_zero IS
	signal D,buf : std_logic;
BEGIN
	
	mux:
	process(clear,load,sum, buf)
	
	begin
		if    clear = '1' then
			D <= '0' after 5 ns;
		elsif load  = '1' then
			D <= not(sum(3) or sum(2) or sum(1) or sum(0)) after 5 ns;
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
	
	zero <= buf;
END ARCHITECTURE;