LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;    
ENTITY TruthTable IS                     
   PORT(                                   
	A2 : IN std_logic;
	A1 : IN std_logic;
	A0 : IN std_logic;
	F1 : OUT std_logic;
	F0 : OUT std_logic
   );                                                     
-- Declarations
END TruthTable ;       
ARCHITECTURE TruthTable OF TruthTable IS
BEGIN                                       
	PROCESS ( A2, A1, A0 )
	BEGIN
		F1 <= (A2 AND  NOT A1 AND  NOT A0) OR ( NOT A2 AND A1 AND  NOT A0) OR ( NOT A2 AND  NOT A1 AND A0) OR (A2 AND A1 AND A0);
		F0 <= (A1 AND A0) OR (A2 AND A0) OR (A2 AND A1);
		
	END PROCESS; 
END ARCHITECTURE TruthTable;
