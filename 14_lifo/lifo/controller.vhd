LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY controller IS

port(
		zero	: in std_logic_vector(1 downto 0);
		push	: in std_logic;
		pop	: in std_logic;
		full	: out std_logic;
		empty	: out std_logic;
		incr	: out std_logic;
		decr	: out std_logic
	);
	
END controller;

ARCHITECTURE bdf_type OF controller IS 

BEGIN
	
	push_controller:
	process(push, zero(1))
	begin
		incr <= (push xor zero(1)) and push;
		full <= zero(1);
	end process;
			
	pop_controller:	
	process(pop, push, zero(0))
	begin
		decr <= ((pop xor zero(0)) and pop) and not push;
		empty <= zero(0);
	end process;
	
end ARCHITECTURE bdf_type;