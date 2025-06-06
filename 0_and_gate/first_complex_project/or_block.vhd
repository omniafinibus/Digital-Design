LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity or_block is
	port
	(
		a,b		: in	std_logic;
		f_or		: out	std_logic
	);
	
end  or_block;

architecture behaviour of or_block is

BEGIN
	process( a,b )
	
	begin
		f_or <= a or b after 5 ns;
	end process;
end behaviour;