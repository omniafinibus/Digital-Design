LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

--LIBRARY traffic_pack;
--USE traffic_pack.all;

ENTITY controller_moore IS
	
	PORT( 
		nrst,clk   : in  std_logic;
		car        : in  std_logic;
		clear      : out std_logic;
		st_short   : out std_logic;
		st_long    : out std_logic;
		tmr_done   : in  std_logic;
		highway    : out std_logic_vector(2 downto 0); --red, YEL, green
		farmroad   : out std_logic_vector(2 downto 0)  --red, YEL, green
	);
END controller_moore;

ARCHITECTURE controller OF controller_moore IS
	type state is (Sx, S0, S1, S2, S3, S4, S5, S6, S7 , S8, S9);
	
	signal present_state, next_state : state;
BEGIN
	--next state decoder
	next_state_dec_proc:
	process(car, clk, nrst, tmr_done)
		variable n_s : state;
	begin
		if rising_edge(clk) then
			case present_state is
				when s0 => 
					n_s := s1;
				when s1 =>
					if tmr_done='1' and car='1' then
						n_s := s2;
					end if;
				when s2 =>
					n_s := s3;
				when s3 =>
					n_s := s4;
				when s4 =>
					n_s := s5;
				when s5 =>
					if tmr_done='1' then
						n_s := s6;
					end if;
				when s6 =>
					n_s := s7;
				when s7 =>
					n_s := s0;
				
				when others => n_s := S7;
			end case;
		end if;
		
				
		if nrst='0' then
			present_state <= s7 after 5 ns;
		else		
			present_state <= n_s after 5 ns;
		end if;
	end process;

	--output decoder
	output_dec_proc:
	process(present_state)
		type light is (U, RED, YEL, GREEN);
		variable high_way, farm_road : light;
	begin
		
		case present_state is
			when s0 =>
				st_short  <= '0'  after 5 ns;
				st_long   <= '1'  after 5 ns;
				clear     <= '0'  after 5 ns;
				high_way  := GREEN;
				farm_road := RED;
			when s1 =>
				st_short  <= '0'  after 5 ns;
				st_long   <= '0'  after 5 ns;
				clear     <= '0'  after 5 ns;
				high_way  := GREEN;
				farm_road := RED;
			when s2 =>
				st_short  <= '0'  after 5 ns;
				st_long   <= '0'  after 5 ns;
				clear     <= '0'  after 5 ns;
				high_way  := YEL;
				farm_road := RED;
			when s3 =>
				st_short  <= '0'  after 5 ns;
				st_long   <= '0'  after 5 ns;
				clear     <= '1'  after 5 ns;
				high_way  := RED;
				farm_road := RED;
			when s4 =>
				st_short  <= '1'  after 5 ns;
				st_long   <= '0'  after 5 ns;
				clear     <= '0'  after 5 ns;
				high_way  := RED;
				farm_road := GREEN;
			when s5 =>
				st_short  <= '0'  after 5 ns;
				st_long   <= '0'  after 5 ns;
				clear     <= '0'  after 5 ns;
				high_way  := RED;
				farm_road := GREEN;
			when s6 =>
				st_short  <= '0'  after 5 ns;
				st_long   <= '0'  after 5 ns;
				clear     <= '0'  after 5 ns;
				high_way  := RED;
				farm_road := YEL;
			when s7 =>
				st_short  <= '0'  after 5 ns;
				st_long   <= '0'  after 5 ns;
				clear     <= '1'  after 5 ns;
				high_way  := RED;
				farm_road := RED;
			
			when others => 
				st_short  <= 'X'  after 5 ns;
				st_long   <= 'X'  after 5 ns;
				clear     <= 'X'  after 5 ns;
				high_way  :=  U;
				farm_road :=  U;
		end case;
		
		----- for simulation
		case high_way is
			when RED    => highway  <= "100" after 5 ns; --red,YEL,green
			when YEL    => highway  <= "010" after 5 ns; --red,YEL,green
			when GREEN  => highway  <= "001" after 5 ns; --red,YEL,green
			when others => highway  <= "XXX" after 5 ns; --red,YEL,green
		end case;
		
		case farm_road is
			when RED    => farmroad <= "100" after 5 ns; --red,YEL,green
			when YEL    => farmroad <= "010" after 5 ns; --red,YEL,green
			when GREEN  => farmroad <= "001" after 5 ns; --red,YEL,green
			when others => farmroad <= "XXX" after 5 ns; --red,YEL,green
		end case;
		
	end process;
	
END ARCHITECTURE;