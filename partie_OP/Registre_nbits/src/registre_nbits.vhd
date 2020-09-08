--****************************************************--
	--			ENSA FES		      --
	--		Filiere   : GSEII1
--****************************************************--
	--Title   : Registre sur n bits
	--TP	  : Projet d'�valuation circuis reprogrammables & VHDL
	--block   : registre_nbits
--****************************************************--
	--File	  : SRC
	--Authors : Meryem ANNOUAR
	--Created : 05/09/2020
--****************************************************--
	--description :
	-- R�alisation d'un registre sur n bits
	-- Ce registre permet de stocker les valeurs d'entr�es et de les envoyer en sortie pour les exploiter 
	-- registre g�n�rique pour multiple utilisation
	
--*****************************************************************--
--                        USED LIBRARIES                           --
--*****************************************************************--
	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;
--*****************************************************************--
--                      ENTITY DECLARATION                         --
--*****************************************************************--
		ENTITY registre_nbits IS
		GENERIC (NB_bits : INTEGER :=3); 
		PORT(
		    Clk : IN std_logic;
		    RST : IN std_logic;
		    Enable : IN std_logic; 
		    Data_in : IN std_logic_vector(NB_bits-1 DOWNTO 0);
		    Data_out : OUT std_logic_vector(NB_bits-1 DOWNTO 0));
		END registre_nbits;

--**********************************************************************************--
--                              RTL DESCRIPTION                                     --
--**********************************************************************************--
			ARCHITECTURE RTL OF registre_nbits IS 
			BEGIN
			PROCESS(Clk,RST)
		    BEGIN 
		    			-- condition sur la remise � 0
				        IF(RST = '0')THEN
			                Data_out <= (OTHERS => '0');	               
			            -- detection du front montant 
			        	ELSIF(rising_edge(Clk))THEN
			              IF(Enable = '1')THEN
			                Data_out <= Data_in;
			              END IF;
			            END IF;
			END PROCESS;
			END RTL;
			
