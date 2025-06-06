library ieee;
use ieee.std_logic_1164.all;

entity xnor_gate is
port
(
	a, b:	in std_logic;
	f:		out std_logic
);
end xnor_gate;

architecture behavior of xnor_gate is
begin

	process( a,b )
	begin
		
		if a /= b then
			f <= '1';
		else
			f <= '0';
		end if;
	
	end process;
end behavior;