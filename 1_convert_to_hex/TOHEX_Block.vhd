LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;    
ENTITY TOHEX_Block IS                     
   PORT(	
	A: in std_logic_vector(3 downto 0);
	F: out std_logic_vector(6 downto 0)
   );                                                     
-- Declarations
END TOHEX_Block ;       
ARCHITECTURE TOHEX_Block OF TOHEX_Block IS
BEGIN                                       
	PROCESS ( A(3), A(2), A(1), A(0) )
	BEGIN
		F(6) <= ( NOT A(3) AND  NOT A(2) AND  NOT A(1)) OR ( NOT A(3) AND A(2) AND A(1) AND A(0)) after 5 ns;
		F(5) <= ( NOT A(3) AND  NOT A(2) AND A(1) AND  NOT A(0)) OR ( NOT A(3) AND  NOT A(2) AND  NOT A(1) AND A(0)) OR (A(3) AND A(2) AND  NOT A(1)) OR ( NOT A(3) AND A(1) AND A(0)) after 5 ns;
		F(4) <= ( NOT A(3) AND A(2) AND  NOT A(1) AND A(0)) OR ( NOT A(2) AND  NOT A(1) AND A(0)) OR ( NOT A(3) AND A(2) AND  NOT A(1) AND  NOT A(0)) OR ( NOT A(3) AND A(1) AND A(0)) after 5 ns;
		F(3) <= (A(3) AND  NOT A(2) AND A(1) AND  NOT A(0)) OR ( NOT A(3) AND A(2) AND A(1) AND A(0)) OR ( NOT A(3) AND A(2) AND  NOT A(1) AND  NOT A(0)) OR (A(3) AND A(2) AND A(1) AND A(0)) OR ( NOT A(3) AND  NOT A(2) AND  NOT A(1) AND A(0)) after 5 ns;
		F(2) <= ( NOT A(3) AND  NOT A(2) AND A(1) AND  NOT A(0)) OR (A(3) AND A(2) AND  NOT A(0)) OR (A(3) AND A(2) AND A(1) AND A(0)) after 5 ns;
		F(1) <= (A(3) AND  NOT A(2) AND A(1) AND A(0)) OR ( NOT A(3) AND A(2) AND  NOT A(1) AND A(0)) OR (A(2) AND A(1) AND  NOT A(0)) OR (A(3) AND A(2) AND  NOT A(0)) OR (A(3) AND A(2) AND A(1) AND A(0)) after 5 ns;
		F(0) <= (A(3) AND  NOT A(2) AND A(1) AND A(0)) OR ( NOT A(3) AND A(2) AND  NOT A(1) AND  NOT A(0)) OR ( NOT A(3) AND  NOT A(2) AND  NOT A(1) AND A(0)) OR (A(3) AND A(2) AND  NOT A(1)) after 5 ns;		
	END PROCESS; 
END ARCHITECTURE TOHEX_Block;