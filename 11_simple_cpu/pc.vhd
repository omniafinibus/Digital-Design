LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

--  Entity Declaration

ENTITY pc IS
PORT
(
	nrst    : IN STD_LOGIC;
	clk     : IN STD_LOGIC;
	en      : IN STD_LOGIC;
	address : OUT STD_LOGIC_VECTOR(2 downto 0)
);
END pc;


--  Architecture Body

ARCHITECTURE pc_architecture OF pc IS


BEGIN
	process(nrst,clk)
		variable cnt : std_LOGIC_VECTOR(2 downto 0);
	begin
		if nrst='0' then
			cnt := (others=> '0');
			address <= cnt after 1 ns;
		elsif rising_edge(clk) then
			if en = '1' then
				cnt:= cnt + ( "001" );
			end if;
			address <= cnt after 1 ns;
		end if;
	end process;

END pc_architecture;
