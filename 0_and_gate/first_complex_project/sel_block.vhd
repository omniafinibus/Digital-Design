LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity sel_block is
	port
	(
		f_and, f_or, sel	: in	std_logic;
		f						: out std_logic
	);
	
end sel_block;

architecture behaviour of sel_block is

BEGIN
	process( f_and, f_or, sel )
	begin
		if sel='0' then
			f<=f_and after 5 ns;
		else
			f<=f_or after 5 ns;
		end if;
	end process;
end behaviour;