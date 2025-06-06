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

	process(CLK, Nrst)
	begin
	
	if Nrst = '1' then
		if rising_edge(clk) then
			Q <= D after 25ns; 
			nQ <= not D after 25ns;
		end if;
		
	elsif Nrst = '0' then
		Q <= '0' after 25ns;
		nQ <= not D after 25ns;
	
	end if;
	
	end process;
end behavior;