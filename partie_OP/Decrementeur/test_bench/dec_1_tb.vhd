--****************************************************--
	--			ENSA FES		      --
	--		Filiere   : GSEII1
--****************************************************--
	--Title   : Teste de bloc qui décrémente par 1
	--TP	  : Projet d'évaluation circuis reprogrammables & VHDL
	--block   : dec_1_tb
--****************************************************--
	--File	  : teste bench
	--Authors : Meryem ANNOUAR
	--Created : 05/09/2020
--****************************************************--
	--description :
	-- Réalisation du teste bench d'un block qui décrémente la valeur d'entrer par 1

--*****************************************************************--
--                        USED LIBRARIES                           --
--*****************************************************************--
	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;

--*****************************************************************--
--                      ENTITY DECLARATION                         --
--*****************************************************************--

	ENTITY dec_1_tb IS 
	END dec_1_tb;

--*******************************************************************--
--                        RTL DESCRIPTION                            --
--*******************************************************************--

	ARCHITECTURE RTL OF dec_1_tb IS
		
		COMPONENT dec_1 PORT(
			 Data_in 	: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
	    	 Data_out	: OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
		END COMPONENT;
	
	SIGNAL Data_in, Data_out : STD_LOGIC_VECTOR(2 DOWNTO 0);
		
	BEGIN
	
	I :	dec_1 PORT MAP(
		Data_in   =>    Data_in,
		Data_out  =>    Data_out);
	
	PROCESS
	BEGIN
		Data_in   <=  "010";
		WAIT FOR 30 ns;
		Data_in   <=  (OTHERS => '0');
		WAIT FOR 30 ns;
		Data_in   <=  (OTHERS => '1');
		WAIT FOR 30 ns;
	END PROCESS;
	END RTL;
	