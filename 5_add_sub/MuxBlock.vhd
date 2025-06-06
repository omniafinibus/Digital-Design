library ieee;
use ieee.std_logic_1164.all;

entity MuxBlock is
	port(
			S1: 		in std_logic_vector (3 downto 0);
			Cout: 	in std_logic;
			S2:		in std_logic_vector (3 downto 0);
			Bout: 	in std_logic;
			sel: 		in std_logic;
			Result: 	out std_logic_vector (3 downto 0);
		 	CoBo: 	out std_logic
		 );
end MuxBlock;

architecture behavior of MuxBlock is 
begin

	process( S1, Cout, S2, Bout, Sel )
	begin
	
		if Sel = '0' then 
			Result <= S1;
			CoBo <= Cout;
		else
			Result <= S2;
			Cobo <= Bout;
		end if;
		
	end process;
end behavior;
	