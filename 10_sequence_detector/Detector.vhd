library ieee;
use ieee.std_logic_1164.all;

entity Detector is
port (

    data_in, nrst, clk: in std_logic;
    output : out std_logic

);
end Detector;  

architecture behavior of Detector is
Signal P_S, N_S: string (2 downto 1);

begin

next_state_decoder:  process( P_S, data_in )
begin

	case P_S is
		when "S1" => 	if data_in='0' then N_S<="S2";
							else N_S<="S1";
							end if;
		when "S2" =>	if data_in='1' then N_S<="S3";
							elsif data_in='0' then N_S<="S2";
							else N_S<="S1";
							end if;
		when "S3" =>	if data_in='0' then N_S<="S4";
							else N_S<="S1";
							end if;
		when "S4" =>	if data_in='1' then N_S<="S5";
							elsif data_in='0' then N_S<="S2";
							else N_S<="S1";
							end if;
		when "S5" =>	if data_in='1' then N_S<="S6";
							elsif data_in='0' then N_S<="S4";
							else N_S<="S1";
							end if;
		when "S6" =>	if data_in='0' then N_S<="S7";
							else N_S<="S1";
							end if;
		when "S7" =>	if data_in='1' then N_S<="S3";
							elsif data_in='0' then N_S<="S2";
							else N_S<="S1";
							end if;	
		
		when others => null;
		end case;
		
	end process;
	  
memory: process( nrst,clk )
begin

	if nrst = '0' then P_S <= "S1";
	elsif rising_edge(clk) then P_S <= N_S after 5ns; 
	end if;
	
end process;
	  
output_decoder: process( P_S )
begin

		if P_S="S1" or P_S="S2" or P_S="S3" or P_S="S4" or P_S="S5" or P_S="S6" then output<= '0' after 15ns; 
		elsif P_S="S7" then output<= '1' after 10ns;  
	
		end if;
	
	end process;

end behavior;
