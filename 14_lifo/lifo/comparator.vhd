LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

entity comparator is

port(	
	push_pntr	: in	std_Logic_Vector(1 downto 0);
	pop_pntr		: in  std_Logic_Vector(1 downto 0);
	zero			: out std_Logic_vector(1 downto 0)
	);
	
end comparator;

architecture bdf_type of comparator is 
begin
	
	process(push_pntr, pop_pntr)
	begin

	zero(0) <= not push_pntr(1) and not push_pntr(0) and not pop_pntr(0) and not pop_pntr(1);
	zero(1) <= push_pntr(1) and push_pntr(0) and pop_pntr(0) and pop_pntr(1);
	
	end process;
end architecture bdf_type;