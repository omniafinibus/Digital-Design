LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
use ieee.numeric_std.all;       -- for the signed, unsigned types and arithmetic ops

ENTITY alu_slice IS
	PORT( 
		ca,cb : IN     std_logic;
		opnd  : IN     std_logic;
		acu   : IN     std_logic;
		ci    : IN     std_logic;
		co    : OUT    std_logic;
		sum   : OUT    std_logic
	);
END alu_slice;

ARCHITECTURE tt OF alu_slice IS
	type funcname_t is (SUB, ADD, LOGIC_AND, SHFL);
BEGIN
	
	table:
	process(ca,cb,opnd,acu,ci)
		variable table_input      : Std_Logic_Vector(4 downto 0);
		variable function_code    : Std_Logic_Vector(1 downto 0);
		variable tmp_sum,intcarry : Std_Logic;
		variable funcname         : funcname_t;
	begin
		function_code := cb & ca;
		table_input   := cb & ca & acu & opnd & ci;
		
		--SUB # acu - opnd - ci = 
		if    std_match("00000",table_input) then intcarry:='0'; tmp_sum := '0';
		elsif std_match("00001",table_input) then intcarry:='0'; tmp_sum := '1';
		elsif std_match("00001",table_input) then intcarry:='1'; tmp_sum := '1';
		elsif std_match("00010",table_input) then intcarry:='1'; tmp_sum := '1';
		elsif std_match("00011",table_input) then intcarry:='1'; tmp_sum := '0';
		elsif std_match("00100",table_input) then intcarry:='0'; tmp_sum := '1';
		elsif std_match("00101",table_input) then intcarry:='0'; tmp_sum := '0';
		elsif std_match("00110",table_input) then intcarry:='0'; tmp_sum := '0';
		elsif std_match("00111",table_input) then intcarry:='1'; tmp_sum := '1';
		
		--ADD # acu + opnd + ci = 
		elsif std_match("01000",table_input) then intcarry:='0'; tmp_sum := '0';
		elsif std_match("01001",table_input) then intcarry:='0'; tmp_sum := '1';
		elsif std_match("01010",table_input) then intcarry:='0'; tmp_sum := '1';
		elsif std_match("01011",table_input) then intcarry:='1'; tmp_sum := '0';
		elsif std_match("01100",table_input) then intcarry:='0'; tmp_sum := '1';
		elsif std_match("01101",table_input) then intcarry:='1'; tmp_sum := '0';
		elsif std_match("01110",table_input) then intcarry:='1'; tmp_sum := '0';
		elsif std_match("01111",table_input) then intcarry:='1'; tmp_sum := '1';
		
		--AND
		elsif std_match("1000-",table_input) then intcarry:='0'; tmp_sum := '0';
		elsif std_match("1001-",table_input) then intcarry:='0'; tmp_sum := '0';
		elsif std_match("1010-",table_input) then intcarry:='0'; tmp_sum := '0';
		elsif std_match("1011-",table_input) then intcarry:='0'; tmp_sum := '1';
		
		--SHIFT with Co
		elsif std_match("110-0",table_input) then intcarry:='0'; tmp_sum := '0';
		elsif std_match("110-1",table_input) then intcarry:='0'; tmp_sum := '1';
		elsif std_match("111-0",table_input) then intcarry:='1'; tmp_sum := '0';
		elsif std_match("111-1",table_input) then intcarry:='1'; tmp_sum := '1';
		
		
		else                                      intcarry:='X'; tmp_sum := 'X';
		end if;
			
		sum  <= tmp_sum  after 8 ns;
		Co   <= intcarry after 6 ns;
		
		----- only for simulation
		case function_code is when "00" => funcname := SUB;when "01" => funcname := ADD;when "10" => funcname := LOGIC_AND; when others => funcname := SHFL; end case;
		
	end process;

END ARCHITECTURE;