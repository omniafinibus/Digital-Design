LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY column_selectorB IS

port(	
	bit_sel	: in std_logic_vector(1 downto 0);
	data_in	: in std_logic_vector(3 downto 0);
	data_out	: out std_logic
	);
	
END column_selectorB;

ARCHITECTURE bdf_type OF column_selectorB IS 

BEGIN

	process(bit_sel, data_in)
	begin
		data_out <= (data_in(0) and not bit_sel(1) and not bit_sel(0)) or (data_in(1) and not bit_sel(1) and bit_sel(0)) or (data_in(2) and bit_sel(1) and not bit_sel(0)) or (data_in(3) and bit_sel(1) and bit_sel(0));
	end process;

end ARCHITECTURE bdf_type;