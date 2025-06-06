library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity FourBitSub is
	port(
			A:		in std_logic_vector (3 downto 0);
			B:		in std_logic_vector (3 downto 0);
			S:		out std_logic_vector (3 downto 0);
			Bout:	out std_logic
		 );
end entity;

architecture behavior of FourBitSub is
begin
	
	process( A, B )
		variable temp: std_logic_vector(4 downto 0);
	begin
		
		temp := ('0' & A) - B;
		S <= temp(3 downto 0);
		Bout <= temp(4);
		
	end process;
end behavior; 