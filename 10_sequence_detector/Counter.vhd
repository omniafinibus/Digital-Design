LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
use IEEE.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;

--  Entity Declaration
ENTITY Counter IS
	PORT
	(
		ENABLE	: IN STD_LOGIC;
		NRST  	: IN STD_LOGIC;
		CLK   	: IN STD_LOGIC;
		DOUT  	: OUT STD_LOGIC_VECTOR(3 downto 0)
	);
END Counter;


--  Architecture Body
ARCHITECTURE Counter_architecture OF Counter IS
signal temp: std_logic_vector(0 to 3);
BEGIN

	process(CLK, NRST, temp, ENABLE)
	begin
	
		if NRST = '0' then
			temp <= "0000";
		elsif rising_edge(CLK) then
			if ENABLE = '1' then
				if temp = "1001" then
					temp <= "0000";
				else
					temp <= temp + '1';
				end if;
			else
				temp <= temp;
			end if;
		end if;
		
	DOUT <= temp after 3 ns;	
	
	end process;
END Counter_architecture;