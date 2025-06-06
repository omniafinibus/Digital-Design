LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY column_selectorA IS

port(	
	bit_sel	: in std_logic_vector(1 downto 0);
	data_in	: in std_logic_vector(3 downto 0);
	data_out	: out std_logic
	);
	
END column_selectorA;

ARCHITECTURE bdf_type OF column_selectorA IS 

BEGIN

	process(bit_sel, data_in)
	begin
	
		case bit_sel is
			when "00" => data_out <= data_in(0);
			when "01" => data_out <= data_in(1);
			when "10" => data_out <= data_in(2);
			when "11" => data_out <= data_in(3);
			when others => data_out <= 'X';
		end case;
		
	end process;

end ARCHITECTURE bdf_type;