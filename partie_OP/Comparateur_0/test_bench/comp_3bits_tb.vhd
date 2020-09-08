--****************************************************--
	--			ENSA FES		      --
	--		Filiere   : GSEII1
--****************************************************--
	--Title   : Comparateur
	--TP	  : Projet d'évaluation circuis reprogrammables & VHDL
	--block   : Comp_3bits_tb
--****************************************************--
	--File	  : teste bench
	--Authors : Meryem ANNOUAR
	--Created : 05/09/2020
--****************************************************--
	--description :
	-- Réalisation du teste bench du block comparateur qui compare un entrer avec 0
	
--*****************************************************************--
--                        USED LIBRARIES                           --
--*****************************************************************--
	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.all;
--*****************************************************************--
--                      ENTITY DECLARATION                         --
--*****************************************************************--

	ENTITY comp_3bits_tb IS
	END comp_3bits_tb;

--*******************************************************************--
--                        RTL DESCRIPTION                            --
--*******************************************************************--

 ARCHITECTURE RTL OF comp_3bits_tb IS 
		
		COMPONENT comp_3bits IS PORT(
	    	 	Data_in 	 : IN std_logic_vector(2 DOWNTO 0);
	    	 	diff         : OUT std_logic);
		END COMPONENT;
		
		SIGNAL Data_in : std_logic_vector(2 DOWNTO 0);
		SIGNAL diff    : STD_LOGIC;
		
	BEGIN
	 C : comp_3bits PORT MAP(
	 			Data_in  =>  Data_in,
	 			diff    =>  diff);
	 			
	 PROCESS
	 BEGIN
        Data_in   <=  "000";
        WAIT FOR 30 NS;
        Data_in   <=  "010";
        WAIT FOR 30 NS;
	 END PROCESS;
 END RTL;
    