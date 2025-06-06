--Faudio:   50
-- Nofbits:   24
--Fspraak:   10
-- Nofbits:    8
--Channel capacity: 4000000
--Frame:
--Ratio:    5
--Number of spraak +sync :   20
--Number of spraak channels before audio:    4 

LIBRARY ieee; 
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY sfcontr IS
   PORT(           
      clk      : IN     std_logic;
      nrst     : IN     std_logic;    
      chsel_c    : OUT    std_logic_vector (7 DOWNTO 0);
      readadc  : OUT    std_logic;                        
      shL_c      : OUT    std_logic;
      shR_c      : OUT    std_logic;    
      syncadd_c  : OUT    std_logic;            
      loadpiso_c : OUT    std_logic             
   );                                            

-- Declarations

END sfcontr ;       

ARCHITECTURE sfcontr OF sfcontr IS
BEGIN                      
  PROCESS (nrst,Clk)            
    Variable count : Integer:=0;     
  BEGIN                                   
  if nrst = '0' then count:=0;                 
   elsif rising_edge(Clk) then                      
    Case count is                                        
      when 0      => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00000000";syncadd_c <= '1'; -- sync toevoegen
         -- load speech 
      when 2      => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00000000";syncadd_c <= '1';
         -- start new sample speech 
      when 3      => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00000000";syncadd_c <= '1';
         -- select speech channel 
      when 4      => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00000011";syncadd_c <= '1';
      when 8       => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00000011";syncadd_c <= '0'; --end of sync 
         -- select speech channel 
      when 12     => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00000100";syncadd_c <= '0';
         -- select speech channel 
      when 20     => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00000101";syncadd_c <= '0';

         -- load audio 
      when 26     => loadpiso_c<='1'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00000101";syncadd_c <= '0';
         -- start new sample audio 
      when 27     => loadpiso_c<='0'; readadc <= '1';shL_c<='0';shR_c<='0';chsel_c <= "00000101";syncadd_c <= '0';
      when 28     => loadpiso_c<='0'; readadc <= '0';shL_c<='1';shR_c<='0';chsel_c <= "00000001";syncadd_c <= '0';
      when 52     => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='1';chsel_c <= "00000010";syncadd_c <= '0';
         -- select speech channel 
      when 76     => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00000110";syncadd_c <= '0';
         -- select speech channel 
      when 84     => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00000111";syncadd_c <= '0';
         -- select speech channel 
      when 92     => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00001000";syncadd_c <= '0';
         -- select speech channel 
      when 100    => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00001001";syncadd_c <= '0';

         -- load audio 
      when 106    => loadpiso_c<='1'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00001001";syncadd_c <= '0';
         -- start new sample audio 
      when 107    => loadpiso_c<='0'; readadc <= '1';shL_c<='0';shR_c<='0';chsel_c <= "00001001";syncadd_c <= '0';
      when 108    => loadpiso_c<='0'; readadc <= '0';shL_c<='1';shR_c<='0';chsel_c <= "00000001";syncadd_c <= '0';
      when 132    => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='1';chsel_c <= "00000010";syncadd_c <= '0';
         -- select speech channel 
      when 156    => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00001010";syncadd_c <= '0';
         -- select speech channel 
      when 164    => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00001011";syncadd_c <= '0';
         -- select speech channel 
      when 172    => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00001100";syncadd_c <= '0';
         -- select speech channel 
      when 180    => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00001101";syncadd_c <= '0';

         -- load audio 
      when 186    => loadpiso_c<='1'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00001101";syncadd_c <= '0';
         -- start new sample audio 
      when 187    => loadpiso_c<='0'; readadc <= '1';shL_c<='0';shR_c<='0';chsel_c <= "00001101";syncadd_c <= '0';
      when 188    => loadpiso_c<='0'; readadc <= '0';shL_c<='1';shR_c<='0';chsel_c <= "00000001";syncadd_c <= '0';
      when 212    => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='1';chsel_c <= "00000010";syncadd_c <= '0';
         -- select speech channel 
      when 236    => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00001110";syncadd_c <= '0';
         -- select speech channel 
      when 244    => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00001111";syncadd_c <= '0';
         -- select speech channel 
      when 252    => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00010000";syncadd_c <= '0';
         -- select speech channel 
      when 260    => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00010001";syncadd_c <= '0';

         -- load audio 
      when 266    => loadpiso_c<='1'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00010001";syncadd_c <= '0';
         -- start new sample audio 
      when 267    => loadpiso_c<='0'; readadc <= '1';shL_c<='0';shR_c<='0';chsel_c <= "00010001";syncadd_c <= '0';
      when 268    => loadpiso_c<='0'; readadc <= '0';shL_c<='1';shR_c<='0';chsel_c <= "00000001";syncadd_c <= '0';
      when 292    => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='1';chsel_c <= "00000010";syncadd_c <= '0';
         -- select speech channel 
      when 316    => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00010010";syncadd_c <= '0';
         -- select speech channel 
      when 324    => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00010011";syncadd_c <= '0';
         -- select speech channel 
      when 332    => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00010100";syncadd_c <= '0';
         -- select speech channel 
      when 340    => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00010101";syncadd_c <= '0';

         -- load audio 
      when 346    => loadpiso_c<='1'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00010101";syncadd_c <= '0';
         -- start new sample audio 
      when 347    => loadpiso_c<='0'; readadc <= '1';shL_c<='0';shR_c<='0';chsel_c <= "00010101";syncadd_c <= '0';
      when 348    => loadpiso_c<='0'; readadc <= '0';shL_c<='1';shR_c<='0';chsel_c <= "00000001";syncadd_c <= '0';
      when 372    => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='1';chsel_c <= "00000010";syncadd_c <= '0';
         -- select speech channel 
      when 396    => loadpiso_c<='0'; readadc <= '0';shL_c<='0';shR_c<='0';chsel_c <= "00000000";syncadd_c <= '0';

      when others => null; 
     End  Case;            
     count := count+1;          
    if (count >  399) then count:=0; end if;
   end if;
  END PROCESS; 
END ARCHITECTURE sfcontr;
