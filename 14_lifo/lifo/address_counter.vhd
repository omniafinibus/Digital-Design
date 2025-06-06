LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY address_counter IS

port(
		incr		: in std_logic;
		decr		: in std_logic;
		nrst		: in std_logic;
		clk		: in std_logic;
		push_pntr: out std_logic_vector(1 downto 0);
		pop_pntr	: out std_logic_vector(1 downto 0)
	);
	
END address_counter;

ARCHITECTURE bdf_type OF address_counter IS 

	type state is (S1, S2, S3, s4, s5);
	signal p_s : state;
	signal n_s : state;
BEGIN

	next_state_decoder:
	process(p_s, incr, decr,nrst)
	begin
		case p_s is
		
			when s1 =>
			if	 	incr = '1' then n_s <= s2; 
			elsif decr = '1' then n_s <= s1;
			end if;
			
			when s2 =>
			if 	incr = '1' then n_s <= s3;
			elsif decr = '1' then n_s <= s1;
			end if;
			
			when s3 =>
			if 	incr = '1' then n_s <= s4;
			elsif decr = '1' then n_s <= s2;
			end if;
			
			when s4 =>
			if 	incr = '1' then n_s <= s5;
			elsif decr = '1' then n_s <= s3;
			end if;
			
			when s5 =>
			if 	incr = '1' then n_s <= s5;
			elsif decr = '1' then n_s <= s4;
			end if;
			
		end case;
		
		if incr = '1' and decr = '1' then
			n_s <= p_s;
		end if;
		
		if nrst = '0' then
			n_s <= s1;
		end if;	
		
	end process;
	
	memory:
	process(nrst, clk, incr)
	begin
	
	if nrst = '0' then
		p_s <= s1;
	elsif rising_edge(clk) and (incr = '1' or decr = '1') then
		p_s <= n_s;
	end if;
	
	end process;
	
	output_decoder:
	process(p_s)
	begin
		case p_s is
			when s1 =>
				push_pntr <= "00";
				pop_pntr <= "00";
			when s2 =>
				push_pntr <= "01";
				pop_pntr <= "00";
			when s3 =>
				push_pntr <= "10";
				pop_pntr <= "01";
			when s4 =>
				push_pntr <= "11";
				pop_pntr <= "10";
			when s5 =>
				push_pntr <= "11";
				pop_pntr <= "11";
		end case;
	end process;

end ARCHITECTURE bdf_type;