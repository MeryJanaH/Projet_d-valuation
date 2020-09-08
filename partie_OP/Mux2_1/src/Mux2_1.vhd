--****************************************************--
	--			ENSA FES		      --
	--		Filiere   : GSEII1
--****************************************************--
	--Title   : Multiplexeur
	--TP	  : Projet d'évaluation circuis reprogrammables & VHDL
	--block   : Mux2_1
--****************************************************--
	--File	  : SRC
	--Authors : Meryem ANNOUAR
	--Created : 05/09/2020
--****************************************************--
	--description :
	-- sortie prend Data_0 si sel est à 1 
	-- elle prend Data_1 sinon 
	-- multiplexeur générique pour multiple utilisation

--*****************************************************************--
--                        USED LIBRARIES                           --
--*****************************************************************--
	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.all;
--*****************************************************************--
--                      ENTITY DECLARATION                         --
--*****************************************************************--

	ENTITY Mux2_1 IS 
	GENERIC (NB_bits : INTEGER := 3);
	PORT(
			 Data_0 	: IN  std_logic_vector(NB_bits-1 DOWNTO 0);
	    	 Data_1 	: IN  std_logic_vector(NB_bits-1 DOWNTO 0);
	    	 Sel 		: IN  std_logic;
	    	 Data_out   : OUT std_logic_vector(NB_bits-1 DOWNTO 0));
	END Mux2_1;

--*******************************************************************--
--                        RTL DESCRIPTION                            --
--*******************************************************************--

	ARCHITECTURE RTL OF Mux2_1 IS
	
		BEGIN
			
			Data_out <= Data_0 WHEN sel = '1' ELSE
						Data_1;
		
    END RTL;
    