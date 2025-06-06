library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
port
(
	a, b:  in std_logic;
	S, Co: out std_logic
);
end half_adder;

architecture behavior of half_adder is
begin

	process( a,b )
	begin
	
		S <= a xor b;
		Co <= a and b;
		
	end process;
end behavior;