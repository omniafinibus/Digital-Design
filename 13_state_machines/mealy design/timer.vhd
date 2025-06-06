LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY timer IS
	generic ( runtime : integer := 2 );
	PORT( 
		
		clk,clear : in  std_logic;
		--st_short  : in  std_logic;
		--st_mid    : in  std_logic;
		--st_long   : in  std_logic;
		--runtime   : in  integer;
		start     : in  std_logic;
		done      : out std_logic -- high active
	);
END timer;

ARCHITECTURE beh OF timer IS
	
BEGIN
	
	process(clk)
		variable i : integer;
	begin
		if rising_edge(clk) then
			if clear = '1' then
				i := 0;
				done <= '1' after 5 ns;
			elsif start = '1' and i = 0 then
				i := runtime;
			elsif i > 0 then
				i := i - 1;
			end if;
			
			if i = 0 then
				done <= '1' after 5 ns;
			elsif i > 0 then
				done <= '0' after 5 ns;
			end if;
			
		end if;
	end process;
	
end architecture;