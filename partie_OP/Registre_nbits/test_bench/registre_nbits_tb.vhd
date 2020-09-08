--****************************************************--
	--			ENSA FES		      --
	--		Filiere   : GSEII1
--****************************************************--
	--Title   : Teste d'un registre sur n bits
	--TP	  : Projet d'évaluation circuis reprogrammables & VHDL
	--block   : registre_nbits_tb
--****************************************************--
	--File	  : teste bench
	--Authors : Meryem ANNOUAR
	--Created : 05/09/2020
--****************************************************--
	--description :
	-- Réalisation du teste bench d'un registre générique sur n bits

--*****************************************************************--
--                        USED LIBRARIES                           --
--*****************************************************************--
	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
--*****************************************************************--
--                      ENTITY DECLARATION                         --
--*****************************************************************--
	ENTITY registre_nbits_tb IS 
	END registre_nbits_tb;	
--*******************************************************************--
--                        RTL DESCRIPTION                            --
--*******************************************************************--
	ARCHITECTURE RTL OF registre_nbits_tb IS
		
	CONSTANT Nb_bits     : INTEGER := 3; 
	
		COMPONENT registre_nbits IS GENERIC ( Nb_bits : integer); PORT(
	    Clk 	 : IN std_logic;
	    RST 	 : IN std_logic;
	    Enable   : IN std_logic; 
	    Data_in  : IN std_logic_vector(Nb_bits-1 DOWNTO 0);
	    Data_out : OUT std_logic_vector(Nb_bits-1 DOWNTO 0));
	    END COMPONENT;
		
		SIGNAL CLK, RST, Enable  : STD_LOGIC;
		SIGNAL Data_out, Data_in : STD_LOGIC_VECTOR(Nb_bits-1 DOWNTO 0);
	
	BEGIN
	
U1 :  registre_nbits GENERIC MAP (Nb_bits) PORT MAP(
	  CLK 	   =>  CLK,
	  RST      =>  RST,
	  Enable   =>  Enable,
	  Data_in  =>  Data_in,
	  Data_out =>  Data_out);
	  
	  
	  PROCESS
	  BEGIN
		  CLK <= '0';
		  WAIT FOR 20 ns;
		  CLK <= '1';
		  WAIT FOR 20 ns;
	  END PROCESS;
	  
	  PROCESS
	  BEGIN
		  RST <= '0';
		  WAIT FOR 40 ns;
		  RST <= '1';
		  WAIT FOR 20 ms;
	  END PROCESS;
	  
	  PROCESS
	  BEGIN
		  Enable <= '0';
		  WAIT FOR 20 ns;
		  Enable <= '1';
		  WAIT FOR 40 ns;
	  END PROCESS;
	  
	  PROCESS
	  BEGIN
		  Data_in <= "010";
		  WAIT FOR 30 ns;
		  Data_in <= "100";
		  WAIT FOR 30 ns;
		  Data_in <= "111";
		  WAIT FOR 30 ns;
		  Data_in <= "000";
		  WAIT FOR 30 ns;
	  END PROCESS;
END RTL;
	  
	  
	  
	  

	  
	  