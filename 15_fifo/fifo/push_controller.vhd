LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY push_controller IS

port(
	push			: in std_logic;
	zero_full	: in std_logic;
	nrst			: in std_logic;
	clk			: in std_logic;
	full			: out std_logic;
	save			: out std_logic
	);
	
END push_controller;

ARCHITECTURE bdf_type OF push_controller IS 

	type state is (S1, S2, s3, s4);
	signal p_s : state;
	signal n_s : state;
BEGIN

	next_state_decoder:
	process(p_s, push, zero_full)
	begin
		case p_s is
			when s1 =>
				if push = '1' then
					n_s <= s2;
				else
					n_s <= s1;
				end if;
			when s2 =>
				if zero_full = '1' then
					n_s <= s3;
				else
					n_s <= s1;
				end if;
			when s3 =>
				if push = '1' then
					n_s <= s4;
				else
					n_s <= s3;
				end if;
			when s4 =>
				n_s <= s4;
		end case;
		
		if nrst = '0' then
			n_s <= s1;
		end if;	
		
	end process;
	
	memory:
	process(nrst, clk)
	begin
	
		if rising_edge(clk) then
			p_s <= n_s;
		end if;
		
		if nrst = '0' then
			p_s <= s1;
		end if;
		
	end process;
	
	output_decoder:
	process(p_s, push, zero_full)
	begin
		case p_s is
			when s1 =>
				if push = '1' then
					save <= '1';
					full <= '0';
				else
					save <= '0';
					full <= '0';
				end if;
			when s2 =>
				save <= '0';
				full <= '0';
			when s3 =>
				if push = '1' then
					save <= '1';
					full <= '0';
				else
					save <= '0';
					full <= '0';
				end if;
			when s4 =>
				full <= '1';
				save <= '0';
		end case;
	end process;

end ARCHITECTURE bdf_type;