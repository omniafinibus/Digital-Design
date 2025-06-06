LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity and_block is
	port
	(
		a,b		:	in std_logic;
		f			:	out std_logic
	);
	
end and_block;

architecture behaviour of and_block is

BEGIN
	process(	a,b )
	
	begin
		f		<= a and b after 5 ns;
	end process;
end behaviour;