LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
use IEEE.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;

--  Entity Declaration
ENTITY dataGenerator IS
	PORT
	(
		CLK   : IN STD_LOGIC;
		NRST  : IN STD_LOGIC;
		enGen : IN STD_LOGIC;
		enFast: IN STD_LOGIC;
		DOUT  : OUT STD_LOGIC_VECTOR(7 downto 0)
	);
END dataGenerator;


--  Architecture Body
ARCHITECTURE dataGenerator_architecture OF dataGenerator IS
signal temp: std_logic_vector(0 to 7);
BEGIN

	process(CLK, NRST, enGen, enFast)
	begin
	
		if NRST = '0' then
			temp <= "00000000";
		elsif enGen = '1' then
			if rising_edge(clk) then
				if enFast = '0' then
					temp <= temp + 1;
				elsif enFast = '1' then
					temp <= temp + 16;
				end if;
			end if;
		end if;
	DOUT <= temp after 5 ns;	
	
	end process;
END dataGenerator_architecture;
