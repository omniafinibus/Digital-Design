LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;

ENTITY clock_divider IS
PORT
(
	clk_50MHz : IN STD_LOGIC;
	NRST      : IN STD_LOGIC;
	clk_1Hz   : INOUT STD_LOGIC
);
END clock_divider;


ARCHITECTURE clock_divider_architecture OF clock_divider IS

  signal halftime : std_logic_vector(31 downto 0);
  signal clk_1Hz_internal : std_logic;
  
begin

  gen_clk : process (clk_50Mhz, NRST)
  begin  
    if NRST = '0' then
      clk_1Hz_internal   <= '0';
      halftime   <= (others => '0');
		
    elsif rising_edge(clk_50Mhz) then
      if halftime = "1011111010111100001000000" then  
        halftime   <= (others => '0');
        clk_1Hz_internal   <= not clk_1Hz_internal;
      else
        halftime <= halftime + '1';
      end if;
    end if;
	 
  end process;
  
clk_1Hz <= clk_1Hz_internal after 2 ns;
	
		
	
END clock_divider_architecture;
