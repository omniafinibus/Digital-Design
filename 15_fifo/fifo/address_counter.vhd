LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY address_counter IS

port(
		incr		: in std_logic;
		nrst		: in std_logic;
		clk		: in std_logic;
		address	: out std_logic_vector(1 downto 0)
	);
	
END address_counter;

ARCHITECTURE bdf_type OF address_counter IS 

	type state is (S1, S2, S3, s4);
	signal p_s : state;
	signal n_s : state;
BEGIN

	next_state_decoder:
	process(p_s, incr)
	begin
		case p_s is
		
			when s1 =>
			if	 	incr = '1' then n_s <= s2;
			end if;
			
			when s2 =>
			if 	incr = '1' then n_s <= s3;
			end if;
			
			when s3 =>
			if 	incr = '1' then n_s <= s4;
			end if;
			
			when s4 =>
			n_s <= s4;
			
			when others =>
			n_s <= s1;
			
		end case;
		
		if nrst = '0' then
			n_s <= s1;
		end if;	
		
	end process;
	
	memory:
	process(nrst, clk, incr)
	begin
	
	if nrst = '0' then
		p_s <= s1;
	elsif rising_edge(clk) and incr = '1' then
		p_s <= n_s;
	end if;
	
	end process;
	
	output_decoder:
	process(p_s)
	begin
		case p_s is
			when s1 => address <= "00";
			when s2 => address <= "01";
			when s3 => address <= "10";
			when s4 => address <= "11";
			when others => address <= "00"; 
		end case;
	end process;

end ARCHITECTURE bdf_type;