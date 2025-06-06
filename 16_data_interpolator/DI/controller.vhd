LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY controller IS

port(
		i_avail	: in std_logic;
		o_rdy		: in std_logic;
		nrst		: in std_logic;
		clk		: in std_logic;
		i_rdy		: out std_logic;
		o_avail	: out std_logic;
		sel		: out std_logic;
		save_inpt: out std_logic;
		save_prev: out std_logic;
		save_shft: out std_logic
		
	);
	
END controller;

ARCHITECTURE bdf_type OF controller IS 

	type state is (recieving, save_avg, send_avg, save_crnt, send_crnt);
	signal p_s : state;
	signal n_s : state;
BEGIN

	next_state_decoder:
	process(p_s, nrst, i_avail, o_rdy)
	begin

		case p_s is
			when recieving =>
				if i_avail = '1' then
					n_s <= save_avg;
				else
					n_s <= recieving;
				end if;
			
			when save_avg =>
				n_s <= send_avg;
			
			when send_avg =>
				if o_rdy = '1' then
					n_s <= save_crnt;
				else
					n_s <= send_avg;
				end if;
			
			when save_crnt =>
				n_s <= send_crnt;
			
			when send_crnt =>
				if o_rdy = '1' then
					n_s <= recieving;
				else
					n_s <= send_crnt;
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
	process(p_s, i_avail, o_rdy)
	begin
	
		i_rdy <= '0';
		o_avail <= '0';
		sel <= '0';
		save_inpt <= '0';
		save_prev <= '0';
		save_shft <= '0';

		case p_s is
			when recieving =>
				if i_avail = '1' then
					i_rdy <= '1';
					save_prev <= '1';
					save_inpt <= '1';
				end if;
			
			when save_avg =>
				save_shft <= '1';
			
			when send_avg =>
				sel <= '1';
				o_avail <= '1';
			
			when save_crnt =>
				save_shft <= '1';
			
			when send_crnt =>
				o_avail <= '1';
		end case;
	end process;

end ARCHITECTURE bdf_type;