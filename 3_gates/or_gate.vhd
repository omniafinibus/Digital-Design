library ieee;
use ieee.std_logic_1164.all;

entity or_gate is
port
(
	a, b: in std_logic;
	f:		out std_logic
);
end or_gate;

architecture behavior of or_gate is
begin

	process( a,b )
	begin
		
		if a = '1' or b = '1' then
			f <= '1';
		else
			f <= '0';
		end if;
		
	end process;
end behavior;