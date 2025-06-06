LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY in_mux IS

port(
		sel		 :	in std_logic_vector(1 downto 0);
		save_in	 :	in std_logic;
		save_out0 :	out std_logic;
		save_out1 :	out std_logic;
		save_out2 :	out std_logic;
		save_out3 :	out std_logic
	);
	
END in_mux;

ARCHITECTURE bdf_type OF in_mux IS 

BEGIN

	process(sel, save_in)
	begin
	
		save_out0 <= (not sel(1) and not sel(0)) and save_in;
		save_out1 <= (not sel(1) and sel(0)) and save_in;
		save_out2 <= (sel(1) and not sel(0)) and save_in;
		save_out3 <= (sel(1) and sel(0)) and save_in;
		
	end process;

end ARCHITECTURE bdf_type;