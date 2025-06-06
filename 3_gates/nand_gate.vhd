library ieee;
use ieee.std_logic_1164.all;

entity nand_gate is
port
(
	a, b: in std_logic;
	f: 	out std_logic
);
end nand_gate;

architecture behavior of nand_gate is
begin
	
	process( a,b )
	begin
		
		if a = '1' and b = '1' then
			f <= '0';
		else
			f <= '1';
		end if;
	
	end process;
end behavior;