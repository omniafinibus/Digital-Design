LIBRARY ieee;
USE ieee.std_logic_1164.all;


--  Entity Declaration
ENTITY Random_Data_Generator IS
generic ( len : integer := 6 ); 
PORT
(
	clk, nrst : IN  STD_LOGIC;
	DATA      : OUT STD_LOGIC
);
END Random_Data_Generator;


--  Architecture Body
ARCHITECTURE functional OF Random_Data_Generator IS
	signal temp : STD_LOGIC_VECTOR(len-1 downto 0);
BEGIN
	process(clk, nrst)
		
	begin
		if(NRST = '0') then
			temp <= (others=>'0') after 5 ns;
		elsif(rising_edge(clk)) then
			
			temp(temp'high) <=  temp(1) xnor temp(0) after 5 ns;
			
			for i in (temp'low) to ((temp'high) -1) loop
				temp(i) <= temp(i+1) after 5 ns;
			end loop;

		end if;
	end process;
	
	DATA <= temp(0) after 5 ns;
END functional;
