--****************************************************--
	--			ENSA FES		      --
	--		Filiere   : GSEII1
--****************************************************--
	--Title   : Multiplieur
	--TP	  : Projet d'évaluation circuis reprogrammables & VHDL
	--block   : Multip_16bits_tb.vhd
--****************************************************--
	--File	  : SRC
	--Authors : Meryem ANNOUAR
	--Created : 06/09/2020
--****************************************************--
	--description :
	-- Ce block permet la multiplication de deux nombre
	-- Le résultat de la multiplication est sur 13 bits

--*****************************************************************--
--                        USED LIBRARIES                           --
--*****************************************************************--
	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;
	USE IEEE.STD_LOGIC_1164.ALL;

--*****************************************************************--
--                      ENTITY DECLARATION                         --
--*****************************************************************--

	ENTITY Multip_16bits IS 
		PORT(
	    	 Data_1 	: IN  std_logic_vector(2 DOWNTO 0);
	    	 Data_2     : IN std_logic_vector(12 DOWNTO 0);
	    	 mul        : OUT std_logic_vector(12 DOWNTO 0));
	END Multip_16bits;
	
--*******************************************************************--
--                        RTL DESCRIPTION                            --
--*******************************************************************--

	ARCHITECTURE RTL OF Multip_16bits IS
	SIGNAL a   :  STD_LOGIC_VECTOR(15 DOWNTO 0);
	BEGIN
	-- opération intermédiaire
	a  <=  Data_1 * Data_2;
	-- le résultat de la multiplication
	mul <= a(12 DOWNTO 0);
	
    END RTL;
    
