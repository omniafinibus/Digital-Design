library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use ieee.std_logic_unsigned.all;

entity CU_Slice is
port
(
	countIn:				in std_logic_vector(2 downto 0);
	A, B, Ci:			in std_logic;
	Sel:					in std_logic_vector(1 downto 0);
	countOut:			out std_logic_vector(2 downto 0);
	S, CoBo: 			out std_logic	
);
end CU_Slice;

architecture behavior of CU_Slice is
begin

	process( A, B, Ci, Sel, countIn )
		variable temp: std_logic_vector(1 downto 0);
	begin

	case Sel is
		when "00" =>
			temp := ('0' & A) + ('0' & B) + Ci;
			S <= temp(0) after 3 ns;
			CoBo <= temp(1) after 2 ns;
		when "01" =>
			temp := ('0' & A) - ('0' & B) - Ci;
			S <= temp(0) after 3 ns;
			CoBo <= temp(1) after 2 ns;
		when "10" =>
			S <= A xor B after 3 ns;
		when others =>
			case countIn is
				when "001"  =>
					temp := ('0' & A) + Ci;
					S <= temp(0);
					CoBo <= temp(1);
					countOut <= countIn + '1';
				when "010"  =>
					temp := ('0' & A) + Ci;
					S <= temp(0);
					CoBo <= temp(1);
					countOut <= countIn + '1';
				when "011"  =>
					temp := ('0' & A) + Ci;
					S <= temp(0);
					CoBo <= temp(1);
					countOut <= countIn + '1';
				when others =>
					temp := ('0' & A) + '1';
					S <= temp(0) after 3 ns;
					CoBo <= temp(1) after 2 ns;
					countOut <= "001";
			end case;
		end case;
		
	end process;
end behavior;
