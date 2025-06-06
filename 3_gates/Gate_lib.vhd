library ieee;
use ieee.std_logic_1164.all;

entity Gate_lib is
port
(
	a: in std_logic;
	f:	out std_logic
);
end Gate_lib;

architecture behavior of Gate_lib is
begin

	process( a )
	begin
		
		f <= a;
		
	end process;
end behavior;