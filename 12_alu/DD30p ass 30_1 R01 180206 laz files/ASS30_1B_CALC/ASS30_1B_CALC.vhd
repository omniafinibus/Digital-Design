LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

ENTITY ASS30_1B_CALC IS
	PORT( 
			ca    : IN     std_logic;
			cb    : IN     std_logic;
			clk   : IN     std_logic;
			clear : IN     std_logic;
			load  : IN     std_logic;
			opnd  : IN     std_logic_vector(3 DOWNTO 0);
			carry : OUT    std_logic;
			zero  : OUT    std_logic;
			acu   : INOUT  std_logic_vector(3 DOWNTO 0)
	);
END ASS30_1B_CALC ;

--
ARCHITECTURE level1 OF ASS30_1B_CALC IS
	signal sum  : Std_Logic_Vector(3 downto 0);
	signal Cout : Std_Logic;

begin

------------------------------------- ALU ------------------------------------------


	ALU_operation: 
	process(opnd,acu,ca,cb)
		variable sum_value              : std_logic_vector(4 DOWNTO 0);   
		variable function_code          : std_logic_vector(1 downto 0);
	begin
		
		function_code := cb&ca;
		
		case function_code is
			when "00" => --SUB
				sum_value:= ( '0'& acu) - ( '0'& opnd);
				sum   <= sum_value(3 downto 0) after 25 ns;
				cout  <= sum_value(4)          after 25 ns;
			when "01" => --ADD
				sum_value:= ( '0'& acu) + ( '0'& opnd);
				sum   <= sum_value(3 downto 0) after 25 ns;
				cout  <= sum_value(4)          after 25 ns;				
			when "10" => --AND
				sum   <= acu AND opnd after 25 ns;
				cout  <= '0'after 25 ns;
			when "11" => --SHIFT LEFT WITH Co
				sum_value := acu & '0';
				sum   <= sum_value(3 downto 0) after 25 ns;
				cout  <= sum_value(4)          after 25 ns;
			when others =>
				sum   <= "XXXX" after 25 ns;
				cout  <= 'X'    after 25 ns;
		end case;
		
	end process;

------------------------------------------------------------------------------------

------------------------------------- ACU ------------------------------------------


	ACU_operation: 
	process(clk)
	
	begin
		
		if rising_edge(clk) then
			if    clear='1' then
				acu <= "0000" after 10 ns;
			elsif load='1'  then
				acu <= sum after 10 ns;
			elsif not( clear='0' and load='0') then
				acu <= "XXXX" after 10 ns;
			end if;
		end if;
	end process;

------------------------------------------------------------------------------------

------------------------------------ FLAGS -----------------------------------------

	FLAGS_generation:
	process(clk)
	
	begin
		
		if rising_edge(clk) then
			if    clear='1' then
				carry <= '0' after 10 ns;
				zero  <= '1' after 10 ns;
				
			elsif load='1'  then
				carry <= Cout after 10 ns;
				
				if sum="0000" then
					zero <= '1' after 10 ns;
				else
					zero <= '0' after 10 ns;
				end if;
				
			elsif not( clear='0' and load='0') then
				carry <= 'X' after 10 ns;
				zero  <= 'X' after 10 ns;
			end if;
		end if;
end process;


END ARCHITECTURE level1;

