LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY adder_bitslice IS

port(
	c_in		:	in std_logic;
	data_in1	:	in std_logic;
	data_in2	:	in std_logic;
	data_out	:	out std_logic;
	c_out		:	out std_logic
	);
	
END adder_bitslice;

ARCHITECTURE bdf_type OF adder_bitslice IS
BEGIN

	process(data_in1, data_in2, c_in)
	begin
	
	data_out <= (data_in1 xor data_in2) xor c_in;
	c_out <= ((data_in1 xor data_in2) and c_in) or (data_in1 and data_in2);
		
	end process;

end ARCHITECTURE bdf_type;