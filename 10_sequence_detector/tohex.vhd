--  Library Declaration
LIBRARY ieee;
USE ieee.std_logic_1164.all;

--  Entity Declaration
entity TOHEX is
	port
	(
		bin : in  std_logic_vector(3 downto 0);
		seg : out std_logic_vector(6 downto 0)
	);

end TOHEX;


--  Architecture Body
architecture behav of TOHEX is
--signal can be declared at this position

BEGIN
	TABLE: process( bin )
		--variable can be declared at this position
	begin
		if    bin = "0000" then seg <="1000000" after 5 ns;  -- '0'
		elsif bin = "0001" then seg <="1111001" after 5 ns;  -- '1'
		elsif bin = "0010" then seg <="0100100" after 5 ns;  -- '2'
		elsif bin = "0011" then seg <="0110000" after 5 ns;  -- '3'
		elsif bin = "0100" then seg <="0011001" after 5 ns;  -- '4'
		elsif bin = "0101" then seg <="0010010" after 5 ns;  -- '5'
		elsif bin = "0110" then seg <="0000010" after 5 ns;  -- '6'
		elsif bin = "0111" then seg <="1111000" after 5 ns;  -- '7'
		elsif bin = "1000" then seg <="0000000" after 5 ns;  -- '8'
		elsif bin = "1001" then seg <="0010000" after 5 ns;  -- '9'
		elsif bin = "1010" then seg <="0001000" after 5 ns;  -- 'a'
		elsif bin = "1011" then seg <="0000011" after 5 ns;  -- 'b'
		elsif bin = "1100" then seg <="1000110" after 5 ns;  -- 'c'
		elsif bin = "1101" then seg <="0100001" after 5 ns;  -- 'd'
		elsif bin = "1110" then seg <="0000110" after 5 ns;  -- 'e'
		elsif bin = "1111" then seg <="0001110" after 5 ns;  -- 'f'
		else                    seg <="1111111" after 5 ns;  -- all off
		end if;
	end process;
end behav;
