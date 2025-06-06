LIBRARY ieee;
USE ieee.std_logic_1164.all;

--  Entity Declaration
ENTITY quiz_logic IS
	PORT
	(
		iPlayers_btn               : IN    STD_LOGIC_Vector(2 downto 0); --low active button
		iReset_btn                 : IN    STD_LOGIC;                    --low active button
		iQlatch0,iQlatch1,iQlatch2 : IN    STD_LOGIC;                    --latch output Q is used
		oSet0,oSet1,oSet2          : OUT   STD_LOGIC;                    --set connection of the latches
		oReset0,oReset1,oReset2    : INOUT STD_LOGIC                     --set connection of the latches
	);
END quiz_logic;

--  Architecture Body
ARCHITECTURE main_architecture OF quiz_logic IS


BEGIN
	reset_proc:
	process(iReset_btn)
		variable outp : std_LOGIC;
	begin
		outp := not(ireset_btn);
		
		oreset0 <= outp after 1 ns;
		oreset1 <= outp after 1 ns;
		oreset2 <= outp after 1 ns;
	end process;
	
	set_proc:
	process(iPlayers_btn,oreset0,oreset1,oreset2,iqlatch0,iqlatch1,iqlatch2)
		variable q : std_LOGIC;
	begin
		q := not(iqlatch0 or iqlatch1 or iqlatch2 or (oreset0) or (oreset1) or (oreset2));
		
		oset0 <= not(iplayers_btn(0)) and q after 5 ns;
		oset1 <= not(iplayers_btn(1)) and q after 5 ns;
		oset2 <= not(iplayers_btn(2)) and q after 5 ns;
	end process;
END main_architecture;
