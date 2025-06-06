library ieee;
use ieee.std_logic_1164.all;

entity RSflip_flop is
port
(
	S, R: in std_logic;
	Q: 			out std_logic
);
end RSflip_flop;

architecture behavior of RSflip_flop is
begin
 
	process( S, R )
	variable temp: std_logic;
	begin
	
		if S='0' and R='1' then 
			temp := '0';
		
		else if S='1' and R='0' then
			temp := '1';
			 
		else if S='1' and R='1' then
			temp := 'U';
		
		else if S='0' and R='0' then
			temp := temp;	
		
		end if;
		end if;
		end if;
		end if;
	
	Q <= temp after 5 ns;
	
	end process;
end behavior;
