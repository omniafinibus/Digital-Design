library ieee;
use ieee.std_logic_1164.all;

entity parity8Bit is
port
(
	A: 		in std_logic_vector;
	ParGen: 	in std_logic;
	Par: 		out std_logic
);	
end parity8Bit;

architecture behavior of parity8Bit is
begin

	process( A(7 downto 0), ParGen )
	begin
		Par <= A(0) xnor A(1) xnor A(2) xnor A(3) xnor A(4) xnor A(5) xnor A(6) xnor A(7) xnor ParGen; 
		
	end process;
end behavior;