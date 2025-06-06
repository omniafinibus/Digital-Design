LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

ENTITY ASS30_1A_CALC IS
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
END ASS30_1A_CALC ;

--
ARCHITECTURE toplevel OF ASS30_1A_CALC IS

begin
	calcunit_toplevel:
	process(clk)
		variable sum_value              : std_logic_vector(4 DOWNTO 0);   
		variable carry_value,zero_value : std_logic;
		variable function_code          : std_logic_vector(1 downto 0);
	begin
		if rising_edge(clk) then
			
			function_code := cb&ca;
			
			if    clear = '1' then
				acu   <= (others=> '0') after 10 ns;
				zero  <= '1' after 10 ns;
				carry <= '0' after 10 ns;
			elsif load = '1'  then
				case function_code is
					when "00" => --SUB
						sum_value:= ( '0'& acu) - ( '0'& opnd);
						acu   <= sum_value(3 downto 0) after 10 ns;
						carry <= sum_value(4)          after 10 ns;
					when "01" => --ADD
						sum_value:= ( '0'& acu) + ( '0'& opnd);
						acu   <= sum_value(3 downto 0) after 10 ns;
						carry <= sum_value(4)          after 10 ns;
					when "10" => --AND
						acu   <= acu AND opnd after 10 ns;
						carry <= '0'after 10 ns;
					when "11" => --SHIFT LEFT WITH Co
						sum_value := acu & '0';
						acu   <= sum_value(3 downto 0) after 10 ns;
						carry <= sum_value(4)          after 10 ns;
					when others => null;
				end case;
				
				if sum_value(3 downto 0) = "0000" then
					zero  <= '1' after 10 ns;
				else
					zero  <= '0' after 10 ns;
				end if;
				
			end if;
		end if;
	end process;
END ARCHITECTURE toplevel;

