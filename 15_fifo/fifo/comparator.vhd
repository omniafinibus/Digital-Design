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

	signal A : std_logic;
	signal B : std_logic;
	signal C : std_logic;
	signal D : std_logic;

begin
	
	logic_assignment:
	process(push_pntr, pop_pntr)
	begin
	
		A <= push_pntr(1);
		B <= push_pntr(0);
		C <= pop_pntr(1);
		D <= pop_pntr(0);
	
	end process;
	
	logic_algorithm:
	process(A, B, C, D)
	begin

		zero(1) <= A and B;
		zero(0) <= ((not A and not C) or (A and C)) and ((not B and not D) or (B and D));
	
	end process;
end architecture bdf_type;