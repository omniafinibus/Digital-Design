LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY register_bitslice IS

port(
	data_in	:	in std_logic;
	save		:	in std_logic;
	nrst		:	in std_logic;
	clk		:	in std_logic;
	data_out	:	out std_logic
	);
	
END register_bitslice;

ARCHITECTURE bdf_type OF register_bitslice IS 

BEGIN

	process(data_in, save, nrst, clk)
	begin
	
	if nrst = '0' then
		data_out <= '0' after 2 ns;
	elsif rising_edge(clk) and save = '1' then
		data_out <= data_in after 2 ns;
	end if;
		
	end process;

end ARCHITECTURE bdf_type;