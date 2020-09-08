--****************************************************--
	--			ENSA FES		      --
	--		Filiere   : GSEII1
--****************************************************--
	--Title   : Teste du Multiplexeur
	--TP	  : Projet d'évaluation circuis reprogrammables & VHDL
	--block   : Mux2_1
--****************************************************--
	--File	  : teste bench
	--Authors : Meryem ANNOUAR
	--Created : 05/09/2020
--****************************************************--
	--description :
	-- réalisation du teste bench d'un multiplexeur 2 vers 1

--*****************************************************************--
--                        USED LIBRARIES                           --
--*****************************************************************--
	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.all;
--*****************************************************************--
--                      ENTITY DECLARATION                         --
--*****************************************************************--

	ENTITY Mux2_1_tb IS 
	END Mux2_1_tb;

--*******************************************************************--
--                        RTL DESCRIPTION                            --
--*******************************************************************--
ARCHITECTURE RTL OF Mux2_1_tb IS
	

	
		COMPONENT Mux2_1 IS GENERIC ( Nb_bits : integer := 4); PORT(
				 Data_0 	: IN std_logic_vector(Nb_bits-1 DOWNTO 0);
		    	 Data_1 	: IN std_logic_vector(Nb_bits-1 DOWNTO 0);
		    	 Sel 		: IN std_logic;
		    	 Data_out   : OUT std_logic_vector(Nb_bits-1 DOWNTO 0));
		END COMPONENT;
		
		SIGNAL Data_0, Data_1, Data_out : std_logic_vector(3 DOWNTO 0);
		SIGNAL Sel : STD_LOGIC;
		
	BEGIN
	
	U : Mux2_1 GENERIC MAP (4) PORT MAP(
		Data_0 		=>      Data_0,
		Data_1 		=>      Data_1,
		Sel         =>      Sel,
		Data_out    =>      Data_out);
		
		--*****************************--
			Data_0 <=  "0101";
			Data_1 <=  "1110";
		--*****************************--
		PROCESS
		BEGIN
		Sel    <=  '1';
		WAIT FOR 30 ns;  
		Sel    <=  '0';
		WAIT FOR 30 ns;
		END PROCESS;
	END RTL;
	