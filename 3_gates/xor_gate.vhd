library ieee;
use ieee.std_logic_1164.all;

entity xor_gate is
port
(
	a, b:	in std_logic;
	f:		out std_logic
);
end xor_gate;

architecture behavior of xor_gate is
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
