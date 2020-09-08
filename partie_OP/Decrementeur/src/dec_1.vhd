--****************************************************--
	--			ENSA FES		      --
	--		Filiere   : GSEII1
--****************************************************--
	--Title   : D�cr�mentation par 1
	--TP	  : Projet d'�valuation circuis reprogrammables & VHDL
	--block   : dec_1
--****************************************************--
	--File	  : SRC
	--Authors : Meryem ANNOUAR
	--Created : 05/09/2020
--****************************************************--
	--description :
	-- D�cr�mentater une valeur par 1 � chaque it�ration
	-- la valeur d'entrer initial est sur 3 bits

--*****************************************************************--
--                        USED LIBRARIES                           --
--*****************************************************************--

	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;
--*****************************************************************--
--                      ENTITY DECLARATION                         --
--*****************************************************************--

	ENTITY dec_1 IS 
	PORT(
			 Data_in 	: IN  std_logic_vector(2 DOWNTO 0);
	    	 Data_out	: OUT std_logic_vector(2 DOWNTO 0));
	END dec_1;

--*******************************************************************--
--                        RTL DESCRIPTION                            --
--*******************************************************************--

	ARCHITECTURE RTL OF dec_1 IS 
	BEGIN
	-- d�cr�mentation de l'entrer par 1
		Data_out <= Data_in - 1;
	END RTL;
	
	