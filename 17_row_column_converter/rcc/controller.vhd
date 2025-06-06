LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY controller IS

port(
		i_avail	: in std_logic;
		o_rdy		: in std_logic;
		last_row	: in std_logic;
		last_col	: in std_logic;
		clk		: in std_logic;
		nrst		: in std_logic;
		i_rdy		: out std_logic;
		o_avail	: out std_logic;
		save		: out std_logic;
		next_row	: out std_logic;
		next_col	: out std_logic;
		save_shft: out std_logic
	);
	
END controller;

ARCHITECTURE bdf_type OF controller IS 

	type state is (recieving, saving, full_check, converting, last_bit, availing, sending, empty_check);
	signal p_s : state;
	signal n_s : state;
BEGIN

	next_state_decoder:
	process(p_s, i_avail, last_row, o_rdy, last_col)
	begin

		case p_s is
		
			when recieving =>
				if i_avail = '1' then
					n_s <= saving;
				end if;
			
			when saving =>
				if i_avail = '0' then
					n_s <= full_check;
				else 
					n_s <= saving;
				end if;
				
			when full_check =>
				if last_row = '1' then
					n_s <= converting;
				else
					n_s <= recieving;
				end if;
			
			when converting =>
				n_s <= last_bit;
			
			when last_bit =>
				if last_row = '1' then 
					n_s <= availing;
				else
					n_s <= converting;
				end if;
				
			when availing =>
				if o_rdy = '1' then
					n_s <= sending;
				end if;
			
			when sending =>
				if o_rdy = '0' then
					n_s <= empty_check;
				end if;
			
			when empty_check =>
				if last_col = '1' then
					n_s <= recieving;
				else
					n_s <= converting;
				end if;
				
		end case;
		
		if nrst = '0' then
			n_s <= recieving;
		end if;
	end process;
	
	memory:
	process(nrst, clk)
	begin
	
	if nrst = '0' then
		p_s <= recieving;
	elsif rising_edge(clk) then
		p_s <= n_s;
	end if;
	
	end process;
	
	output_decoder:
	process(p_s, last_row, i_avail, o_rdy, last_col)
	begin
	
		case p_s is
		
			when recieving =>
				next_col <= '0';
				next_row <= '0';
				if i_avail = '1' then
					i_rdy <= '1';
				end if;
			
			when saving =>
				save <= '1';
				i_rdy <= '0';
				
			when full_check =>
				save <= '0';
				next_row <= '1';
			
			when converting =>
				next_row <= '0';
				next_col <= '0';
				save_shft <= '1';
			
			when last_bit =>
				next_row <= '1';
				save_shft <= '0';
				
			when availing =>
				o_avail <= '1';
			
			when sending =>
				o_avail <= '0';
						
			when empty_check =>
				next_row <= '1';
				next_col <= '1';
				
		end case;
	end process;

end ARCHITECTURE bdf_type;