LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY acu_slice IS
	PORT( 
		clk   : IN     std_logic;
		clear : IN     std_logic;
		load  : IN     std_logic;
		sum   : IN     std_logic;
		acu   : INOUT  std_logic
	);
END acu_slice;

ARCHITECTURE level2 OF acu_slice IS
	signal D : std_logic;
BEGIN
	
	mux:
	process(clear,load,sum, acu)
	
	begin
		if    clear = '1' then
			D <= '0' after 5 ns;
		elsif load  = '1' then
			D <= sum after 5 ns;
		else
			D <= acu after 5 ns;
		end if;
	end process;
	
	FF:
	process(clk)
	
	begin
		if rising_edge(clk) then
			acu <= D after 5 ns;
		end if;
	end process;

END ARCHITECTURE;