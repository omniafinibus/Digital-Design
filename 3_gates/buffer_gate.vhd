library ieee;
use ieee.std_logic_1164.all;

entity buffer_gate is
port
(
	a:	in std_logic;
	f: out std_logic
);
end buffer_gate;

architecture behavior of buffer_gate is
begin

	process( a )
	begin
	
		f <= a;
		
	end process;
end behavior;
