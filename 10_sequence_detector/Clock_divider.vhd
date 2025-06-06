LIBRARY ieee;
USE ieee.std_logic_1164.all;


--  Entity Declaration
ENTITY Clock_divider IS
PORT
(
	SYSClock : IN STD_LOGIC;
	NRST     : IN STD_LOGIC;
	CLK      : INOUT STD_LOGIC
);
END Clock_divider;


--  Architecture Body
ARCHITECTURE functional OF Clock_divider IS
BEGIN
	process(SYSClock, NRST)
		variable count : integer;
	begin
		if(NRST = '0') then
			CLK <= '1';
			count := 0;
		elsif(rising_edge(SYSClock)) then
			if(count >= 6249999) then --4 Hz for the demo
--         if(count >= 3) then  -- for simulation
				CLK <= not CLK;
				count := 0;
			else
				count := count + 1;
			end if;
		end if;
	end process;
END functional;
