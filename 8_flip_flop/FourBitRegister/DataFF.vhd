Library IEEE;
Use IEEE.std_logic_1164.all;

entity DataFF is

	port( 
		D, Nrst, Clk:	IN std_logic;
		Q, nQ:			out std_logic
	);
	
end DataFF;		

architecture behavior of DataFF is
begin

	process(Clk, Nrst)
	begin
	
	if NRST = '0' then
		Q  <= '0' after 25 ns;
		nQ <= '1' after 25 ns;	
		
	elsif rising_edge(Clk) then			
		if D = '1' then
			Q  <= '1' after 25 ns; 
			nQ <= '0' after 25 ns;
			
		else
			Q  <= '0' after 25 ns; 
			nQ <= '1' after 25 ns;
			
		end if;
	end if;
	
	end process;
end behavior;