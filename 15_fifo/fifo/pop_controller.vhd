LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY pop_controller IS

port(
	pop	: in std_logic;
	zero	: in std_logic_vector(1 downto 0);
	nrst	: in std_logic;
	clk	: in std_logic;
	load	: out std_logic;
	empty	: out std_logic
	);
	
END pop_controller;

ARCHITECTURE bdf_type OF pop_controller IS 

	type state is (s0, S1, S2, s3, s4);
	signal p_s : state;
	signal n_s : state;
BEGIN

	next_state_decoder:
	process(p_s, pop, zero)
	begin
		case p_s is
			when s0 =>
				n_s <= s1;
			when s1 =>
				if pop = '1' then
					n_s <= s2;
				else
					n_s <= s1;
				end if;
			when s2 =>
				if zero(0) = '1' then
					if zero(1) = '1' then
						n_s <= s3;
					else
						n_s <= s2;
					end if;
				else
					n_s <= s1;
				end if;
			when s3 =>
				if pop = '1' then
					n_s <= s4;
				else
					n_s <= s3;
				end if;
			when s4 =>
				n_s <= s4;
		end case;
		
		if nrst = '0' then
			n_s <= s0;
		end if;	
		
	end process;
	
	memory:
	process(nrst, clk)
	begin
	
		if rising_edge(clk) then
			p_s <= n_s;
		end if;
		
		if nrst = '0' then
			p_s <= s0;
		end if;
		
	end process;
	
	output_decoder:
	process(p_s, pop, zero)
	begin
		case p_s is
			when s0 =>
				load <= '0';
				if zero(0) = '1' then
					empty <= '1';
				else
					empty <= '0';
				end if;
			when s1 =>
				if pop = '1' then
					load <= '1';
					empty <= '0';
				else
					load <= '0';
					empty <= '0';
				end if;
			when s2 =>
				if zero(0) = '1' then
					if zero(1) = '1' then
						load <= '0';
						empty <= '0';
					else
						load <= '0';
						empty <= '1';
					end if;
				else
					load <= '0';
					empty <= '0';
				end if;
			when s3 =>
				if pop = '1' then
					load <= '1';
					empty <= '0';
				else
					load <= '0';
					empty <= '0';
				end if;
			when s4 =>
				load <= '0';
				empty <= '1';
		end case;
	end process;

end ARCHITECTURE bdf_type;