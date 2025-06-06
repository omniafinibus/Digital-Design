LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

--  Entity Declaration

ENTITY alu IS
PORT
(
	a, b : IN STD_LOGIC_VECTOR(3 downto 0);
	sel  : IN STD_LOGIC_VECTOR(1 downto 0);
	res  : OUT STD_LOGIC_VECTOR(3 downto 0);
	ovf  : OUT STD_LOGIC;
	zero : OUT STD_LOGIC
);
END alu;


--  Architecture Body

ARCHITECTURE alu_architecture OF alu IS


BEGIN
	process(a,b, sel)
		variable temp : std_LOGIC_VECTOR(4 downto 0);
	begin
		case sel is
			when "00" => temp := ('0' & a) + ('0' & b);	--add
			when "01" => temp := ('0' & b) + '1';	--inc b
			when "10" => temp(4) := '0';--B shr
			             temp(3) := '0';
							 temp(2) := b(3);
							 temp(1) := b(2);
							 temp(0) := b(1); 
							 
			when "11" => temp(4) := '0';--B shl
			             temp(3) := b(2);
							 temp(2) := b(1);
							 temp(1) := b(0);
							 temp(0) := '0';
			when others=>temp := "XXXXX";
		end case;
		
		res <= temp(3 downto 0) after 10 ns;
		ovf <= temp(4) after 10 ns;
		
		
		if (temp(3 downto 0) = "0000") then
			zero <= '1' after 2 ns;
		else
			zero <= '0' after 2 ns;
		end if;
		
	end process;

END alu_architecture;
