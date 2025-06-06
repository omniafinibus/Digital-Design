LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;

--  Entity Declaration
ENTITY add_sub IS
	PORT
	( 
		A,B  : IN  STD_LOGIC_VECTOR(3 downto 0);
		SEL  : IN  STD_LOGIC;
		S    : OUT STD_LOGIC_VECTOR(3 downto 0);
		CoBo : OUT STD_LOGIC
	);

END add_sub;


--  Architecture Body

ARCHITECTURE add_sub_architecture OF add_sub IS
	--signals goes here
	signal S1,S2 : STD_LOGIC_VECTOR(3 downto 0);
	signal Co,Bo : STD_LOGIC;
BEGIN

	add: 	process( A, B )
			variable temp: std_logic_vector(4 downto 0);
			begin
		
				temp := ('0' & A) + ('0' & B);
				S1 <= temp(3 downto 0);
				Co <= temp(4);
				
			end process;
	
	sub: 	process( A, B )
			variable temp: std_logic_vector(4 downto 0);
			begin
		
				temp := ('0' & A) - ('0' & B);
				S2 <= temp(3 downto 0);
				Bo <= temp(4);
				
			end process;
	
	mux: 	process( S1, Co, S2, Bo, Sel )
			begin
	
				if Sel = '0' then 
					S <= S1;
					CoBo <= Co;
				else
					S <= S2;
					Cobo <= Bo;
				end if;
				
			end process;

END add_sub_architecture;
