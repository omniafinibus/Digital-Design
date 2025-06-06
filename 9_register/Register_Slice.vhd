library ieee;
use ieee.std_logic_1164.all;

entity Register_Slice is
port
(

	Hold, Shift, EnReg: in std_logic;
	Control				: in std_logic_vector (1 downto 0);	
	D, Clk, Nrst		: in std_logic;
	Q						: out std_logic
);
end Register_Slice;

architecture behavior of Register_Slice is
begin

	process ( Clk, Nrst)
	begin
	
		if rising_edge(Clk) and enReg = '1' then
			if Nrst = '1' then
				case control is
					when "00" =>	Q <= D after 8 ns;
					when "01" =>	Q <= Hold after 3 ns;
					when "10" =>	Q <= not Hold after 4 ns;		
					when "11" =>	Q <= Shift after 6 ns;
					when others => Q <= '0';
					
				end case;
			elsif (Nrst = '0') then
				Q <= '0' after 8 ns;
		elsif enReg = '0' then
		Q <= Hold after 3 ns;
			end if;
		end if;
	
	end process;
end behavior;
