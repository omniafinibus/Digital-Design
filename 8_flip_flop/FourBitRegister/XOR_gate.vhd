Library IEEE;
Use IEEE.std_logic_1164.all;

entity XOR_Gate is

	port( 
		a, b:	IN std_logic;
		d:		out std_logic
	);
	
end XOR_Gate;		

architecture behavior of XOR_Gate is
begin

	process( a, b )
	begin
		
		if a = '1'  xor b = '1' then
			d <= '1';
		else 
			d <= '0';
		end if;
		
		
	end process;
end behavior;