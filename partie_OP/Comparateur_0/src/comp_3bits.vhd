--****************************************************--
	--			ENSA FES		      --
	--		Filiere   : GSEII1
--****************************************************--
	--Title   : Comparateur
	--TP	  : Projet d'évaluation circuis reprogrammables & VHDL
	--block   : Comp_3bits
--****************************************************--
	--File	  : SRC
	--Authors : Meryem ANNOUAR
	--Created : 05/09/2020
--****************************************************--
	--description :
	-- Ce block permet de comparer une valeur d'entré avec 0
	-- Il detecte si l'entrer est different de 0
	-- Si Data_in different de 0 ==> la sortie prend la valeur 1 
	-- La sortie prend la valeur 0 si la condition précédente n'est pas vérifiée

--*****************************************************************--
--                        USED LIBRARIES                           --
--*****************************************************************--
	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;
	USE IEEE.STD_LOGIC_1164.ALL;

--*****************************************************************--
--                      ENTITY DECLARATION                         --
--*****************************************************************--

	ENTITY comp_3bits IS 
		PORT(
	    	 Data_in 	: IN std_logic_vector(2 DOWNTO 0);
	    	 -- diff permet de detecter si l'entrer est null ou non
	    	 diff       : OUT std_logic);
	END comp_3bits;

--*******************************************************************--
--                        RTL DESCRIPTION                            --
--*******************************************************************--

	ARCHITECTURE RTL OF comp_3bits IS
	
	BEGIN
		diff   <=   '1' WHEN Data_in > "000"  ELSE
		            '1' WHEN Data_in < "000" ELSE
					'0';
    END RTL;
    