LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY byte_selector IS

port(
	sel		:	in std_logic;
	data_in1	:	in std_logic_vector(7 downto 0);
	data_in2	:	in std_logic_vector(7 downto 0);
	data_out	:	out std_logic_vector(7 downto 0)
	);
	
END byte_selector;

ARCHITECTURE bdf_type OF byte_selector IS
BEGIN

	process(data_in1, data_in2, sel)
	begin
	
	if sel='0' then
		data_out <= data_in1;
	elsif sel='1' then
		data_out <= data_in2;
	end if;
	
	end process;

end ARCHITECTURE bdf_type;