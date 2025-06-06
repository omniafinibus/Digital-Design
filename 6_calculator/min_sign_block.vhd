LIBRARY ieee;
USE ieee.std_logic_1164.all;

--  Entity Declaration
ENTITY min_sign_block IS
	PORT
	(
		inp : IN STD_LOGIC;
		seg : OUT STD_LOGIC_VECTOR(6 downto 0)
	);
END min_sign_block;


--  Architecture Body
ARCHITECTURE min_sign_block_architecture OF min_sign_block IS


BEGIN
	process (inp)
	begin
		seg(6) <= not(inp) after 1 ns ;
		seg(5 downto 0) <= (others => '1') after 1 ns;
	end process;
END min_sign_block_architecture;