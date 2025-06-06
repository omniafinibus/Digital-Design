LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

--  Entity Declaration
ENTITY to_signed_magnitude IS
	PORT
	( 
		S    : IN  STD_LOGIC_VECTOR(3 downto 0);
		CiBi : IN  STD_LOGIC;
		SEL  : IN  STD_LOGIC_VECTOR(1 downto 0);
		sign : OUT STD_LOGIC;
		ovf  : OUT STD_LOGIC;
		Res  : OUT STD_LOGIC_VECTOR(3 downto 0)
		
	);

END to_signed_magnitude;


--  Architecture Body

ARCHITECTURE to_signed_magnitude_architecture OF to_signed_magnitude IS
	--signals goes here
BEGIN
	process(S,CiBi,SEL)
		--variables goes here
	begin
		
		if sel(0) = '0' and sel(1) = '1' then --sub sub function
			ovf <=  '0'after 1 ns;
			sign <= CiBi after 1 ns;
			if CiBi = '1' then
				Res <= not(S) + "0001" after 1 ns;
			else
				Res <= S after 1 ns;
			end if;
		else --add function, xor function and inca function
			ovf <= CiBi after 1 ns;
			sign <= '0'after 1 ns;
			Res <= S after 1 ns;
		end if;
	end process;
END to_signed_magnitude_architecture;
