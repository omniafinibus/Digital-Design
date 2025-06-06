LIBRARY ieee;
USE ieee.std_logic_1164.all;


--  Entity Declaration

ENTITY prog_mem IS
	PORT
	(
		address     : IN STD_LOGIC_VECTOR(2 downto 0);
		instruction : OUT STD_LOGIC_VECTOR(6 downto 0)
	);
END prog_mem;


--  Architecture Body

ARCHITECTURE prog_mem_architecture OF prog_mem IS


BEGIN
	process(address)
	begin
		case address is --              opcode  operant
			when "000" => instruction <= "010" & "1110" after 1 ns; --ldA 14
 			when "001" => instruction <= "011" & "1001" after 1 ns; --ldB 9
			when "010" => instruction <= "100" & "----" after 1 ns; --add
			when "011" => instruction <= "111" & "----" after 1 ns; --shl 
			when "100" => instruction <= "101" & "----" after 1 ns; --inc
			when "101" => instruction <= "000" & "----" after 1 ns; --nop			
			when "110" => instruction <= "111" & "----" after 1 ns; --shl
			when others=> instruction <= "010" & "1110" after 1 ns;
			
--			when "000" => instruction <= "000" & "----" after 1 ns;
--			when "001" => instruction <= "010" & "1001" after 1 ns;
--			when "010" => instruction <= "011" & "0110" after 1 ns;
--			when "011" => instruction <= "001" & "----" after 1 ns;
--			when "100" => instruction <= "010" & "1001" after 1 ns;
--			when "101" => instruction <= "000" & "----" after 1 ns;  
--			when "110" => instruction <= "011" & "1101" after 1 ns;
--			when "111" => instruction <= "001" & "----" after 1 ns;
--			when others=> instruction <= "010" & "1001" after 1 ns;
					
		end case;
	end process;

END prog_mem_architecture;

