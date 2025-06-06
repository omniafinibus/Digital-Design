LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

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

ARCHITECTURE level2 OF alu_slice IS

BEGIN
	
	process(ca,cb,opnd,acu,ci)
		variable function_code    : Std_Logic_Vector(1 downto 0);
		variable tmp_sum,intcarry : Std_Logic;
	begin
		function_code := cb&ca;
		case function_code is
			when "00"   => -- "SUB"
				tmp_sum := opnd xor acu xor ci;
				intcarry := ((not acu) and (ci or opnd)) or (ci and opnd);
			when "01"   => -- "ADD"
				tmp_sum := opnd xor acu xor ci;
				intcarry := (acu and (ci or opnd)) or (ci and opnd);
			when "10"   => -- "AND"
				tmp_sum := opnd and acu;
				intcarry := '0';
			when "11"   => -- "SHL"
				tmp_sum := ci;
				intcarry := acu;
			when others =>
				tmp_sum :='X';
				intcarry := 'X';
		end case;
		sum  <= tmp_sum  after 8 ns;
		Co   <= intcarry after 6 ns;
	end process;

END ARCHITECTURE;