LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;    
ENTITY ass11_3_4BitAdder IS                     
   PORT(                                   
	Cin : IN std_logic;
	B : IN std_logic;
	A : IN std_logic;
	S : OUT std_logic;
	Cout : OUT std_logic
   );                                                     
-- Declarations
END ass11_3_4BitAdder;       
ARCHITECTURE ass11_3_4BitAdder OF ass11_3_4BitAdder IS
BEGIN                                       
	PROCESS ( Cin, B, A )
	BEGIN
		S <= (Cin AND  NOT B AND  NOT A) OR ( NOT Cin AND B AND  NOT A) OR ( NOT Cin AND  NOT B AND A) OR (Cin AND B AND A)after 5ns;
		Cout <= (B AND A) OR (Cin AND A) OR (Cin AND B)after 4ns;
		
	END PROCESS; 
END ARCHITECTURE ass11_3_4BitAdder;