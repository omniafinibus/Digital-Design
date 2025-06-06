library ieee;
use ieee.std_logic_1164.all;

entity nor_gate is
port
(
	a, b:	in std_logic;
	f	 : out std_logic
);
end nor_gate;

architecture behavior of nor_gate is
begin
	
	process( a,b )
	begin
		
		if a = '1' or b = '1' then
			f <= '0';
		else
			f <= '1';
		end if;
		
	end process;
end behavior;