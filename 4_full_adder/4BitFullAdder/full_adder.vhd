library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
port
(
	a, b, Ci: in std_logic;
	S, Co:	 out std_logic
);
end full_adder;

architecture behavior of full_adder is
begin

	process( a,b,Ci )
	begin
	
		s <= (a xor b) xor Ci;
			if (a = '1' and b = '1') or
				(a = '1' and Ci = '1') or
				(b = '1' and Ci = '1') then
				Co <= '1'; 
			else
				Co <= '0';
			end if;

	end process;
end behavior;
