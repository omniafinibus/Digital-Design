LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY out_mux IS

port(
		sel		:	in std_logic_vector(1 downto 0);
		data_in0	:	in std_logic_vector(3 downto 0);
		data_in1	:	in std_logic_vector(3 downto 0);
		data_in2	:	in std_logic_vector(3 downto 0);
		data_in3	:	in std_logic_vector(3 downto 0);
		data_out	:	out std_logic_vector(3 downto 0)
	);
	
END out_mux;

ARCHITECTURE bdf_type OF out_mux IS 

BEGIN

	process(sel, data_in0, data_in1, data_in2, data_in3)
	begin
	
	case sel is
		when "00" => data_out <= data_in0;
		when "01" => data_out <= data_in1;
		when "10" => data_out <= data_in2;
		when "11" => data_out <= data_in3;
		when others => data_out <= "XXXX";
	end case;
	
	end process;

end ARCHITECTURE bdf_type;