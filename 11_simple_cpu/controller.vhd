LIBRARY ieee;
USE ieee.std_logic_1164.all;


--  Entity Declaration

ENTITY controller IS
	PORT
	(
		nrst    : IN STD_LOGIC;
		clk     : IN STD_LOGIC;
		opcode  : IN STD_LOGIC_VECTOR(2 downto 0);
		pc_en   : OUT STD_LOGIC;
		mux_sel : OUT STD_LOGIC;
		rega_ld : OUT STD_LOGIC;
		regb_ld : OUT STD_LOGIC;
		alu_sel : OUT STD_LOGIC_VECTOR(1 downto 0);
		acu_ld  : OUT STD_LOGIC
	);
END controller;


--  Architecture Body

ARCHITECTURE controller_architecture OF controller IS
	type state is (Su, Sx, S0, S1, S2, S3, S4, S5 ,S6 ,S7, S8, S9, S10, S11, S12, S13, S14); --Su = State uninitialized 
	
	signal presentstate, nextstate : state;
BEGIN
	Next_state_decoder: 
	process(presentstate,opcode)
		variable n_s : state;
	begin
		case presentstate is
			when Su => case opcode is 
			             when "000" => n_s := S14;
 							 when "001" => n_s := S1;
			             when "010" => n_s := S6;
			             when "011" => n_s := S7; 
							 when "100" => n_s := S8;
							 when "101" => n_s := S9;
							 when "110" => n_s := S11;
							 when "111" => n_s := S12;
			             when others => n_s := Sx;
			           end case;
			when S0 => case opcode is 
			             when "000" => n_s := S14;
 							 when "001" => n_s := S1;
			             when "010" => n_s := S6;
			             when "011" => n_s := S7; 
							 when "100" => n_s := S8;
							 when "101" => n_s := S9;
							 when "110" => n_s := S11;
							 when "111" => n_s := S12;
			             when others => n_s := Sx;
			           end case;						  
			when S1 => n_s := S2;
			when S2 => n_s := S3;
			when S3 => n_s := S4;
			when S4 => n_s := S5;
			when S5 => n_s := S0;
			when S6 => n_s := S0;
			when S7 => n_s := S0;
			when S8 => n_s := S0;	 
			when S9 => n_s := S10;
			when S10=> n_s := S0;
			when S11=> n_s := S0;
			when S12=> n_s := S13;	
			when S13=> n_s := S0;
			when S14=> n_s := S0;				
			when others => n_s := Sx;
		end case;
		nextstate <= n_s after 1 ns;
	end process;
	
	Memory: 
	process(nrst,clk)
	begin
		if nrst='0' then
			presentstate <= S0 after 1 ns;
		elsif rising_edge(clk) then
			presentstate <= nextstate after 1 ns;
		end if;
	end process;
	
	Output_decoder: 
	process(presentstate)
		variable outp_bus : std_LOGIC_VECTOR(6 downto 0);
	begin
		case presentstate is
--			                        ┌──────pc_en
--			                        │┌─────mux_sel
--			                        ││┌────rega_ld
--			                        │││┌───regb_ld
--			                        ││││┌──alu_sel1
--			                        │││││┌─alu_sel0
--			                        ││││││┌acu_ld
			when S0 => outp_bus := "0000000";
			when S1 => outp_bus := "0000001";
			when S2 => outp_bus := "0101010";
			when S3 => outp_bus := "0101011";
			when S4 => outp_bus := "0101010";
			when S5 => outp_bus := "1000011";		
			when S6 => outp_bus := "1010000";		
			when S7 => outp_bus := "1001000";			
			when S8 => outp_bus := "1000001";
			when S9 => outp_bus := "0101010";
			when S10 => outp_bus := "1000011";
			when S11 => outp_bus := "1101101";			
			when S12 => outp_bus := "0101000";
			when S13 => outp_bus := "1000111";
			when S14 => outp_bus := "1000000";
			when others => outp_bus := "0000000";
		end case;
		
		--drive all outputs
		pc_en   <= outp_bus(6) after 1 ns;
		mux_sel <= outp_bus(5) after 1 ns;
		rega_ld <= outp_bus(4) after 1 ns;
		regb_ld <= outp_bus(3) after 1 ns;
		alu_sel <= outp_bus(2 downto 1) after 1 ns;
		acu_ld  <= outp_bus(0) after 1 ns;
	end process;

END controller_architecture;
