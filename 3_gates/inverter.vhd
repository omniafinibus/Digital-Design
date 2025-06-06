library ieee;
use ieee.std_logic_1164.all;

entity inverter is
port
(	
	a: in std_logic;
	f: out std_logic
);
end inverter;

architecture behavior of inverter is
begin
	
	process( a )
	begin
	
		f <= not a;
	
	end process;
end behavior;
	