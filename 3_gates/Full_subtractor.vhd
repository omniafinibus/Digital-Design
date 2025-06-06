LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;    
ENTITY Full_subtractor IS                     
   PORT(                                   
	A : IN std_logic;
	B : IN std_logic;
	Ci : IN std_logic;
	S : OUT std_logic;
	Bo : OUT std_logic
   );                                                     
-- Declarations
END Full_subtractor ;       
ARCHITECTURE Full_subtractor OF Full_subtractor IS
BEGIN                                       
	PROCESS ( A, B, Ci )
	BEGIN
		S <= (A AND  NOT B AND  NOT Ci) OR ( NOT A AND  NOT B AND Ci) OR ( NOT A AND B AND  NOT Ci) OR (A AND B AND Ci);
		Bo <= ( NOT A AND Ci) OR ( NOT A AND B AND  NOT Ci) OR (A AND B AND Ci);
		
	END PROCESS; 
END ARCHITECTURE Full_subtractor;
