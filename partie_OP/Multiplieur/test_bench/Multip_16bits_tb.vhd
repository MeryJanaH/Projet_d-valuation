--****************************************************--
	--			ENSA FES		      --
	--		Filiere   : GSEII1
--****************************************************--
	--Title   : Multiplieur
	--TP	  : Projet d'évaluation circuis reprogrammables & VHDL
	--block   : Multip_16bits_tb.vhd
--****************************************************--
	--File	  : teste bench
	--Authors : Meryem ANNOUAR
	--Created : 06/09/2020
--****************************************************--
	--description :
	-- Ce block permet de tester la multiplication réaliser par le block Multip_16bits.vhd

--*****************************************************************--
--                        USED LIBRARIES                           --
--*****************************************************************--
	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;
	USE IEEE.STD_LOGIC_1164.ALL;

--*****************************************************************--
--                      ENTITY DECLARATION                         --
--*****************************************************************--

	ENTITY Multip_16bits_tb IS
	END Multip_16bits_tb;

--*******************************************************************--
--                        RTL DESCRIPTION                            --
--*******************************************************************--

 ARCHITECTURE RTL OF Multip_16bits_tb IS 
		
		COMPONENT Multip_16bits IS PORT(
	    	 Data_1 	: IN  std_logic_vector(2 DOWNTO 0);
	    	 Data_2     : IN std_logic_vector(12 DOWNTO 0);
	    	 mul        : OUT std_logic_vector(12 DOWNTO 0));
	    END COMPONENT;
		
		SIGNAL d1  : std_logic_vector(2 DOWNTO 0);
		SIGNAL d2  : std_logic_vector(12 DOWNTO 0);
		SIGNAL ml  : std_logic_vector(12 DOWNTO 0);
		
	BEGIN
	 C : Multip_16bits PORT MAP(
	 			Data_1  =>  d1,
	 			Data_2  =>  d2,
	 			mul     =>  ml);
	 			
	 PROCESS
	 BEGIN
        d1   <=  "100";
        d2   <=  "0001101110000";
        WAIT FOR 30 NS;
        d1   <=  "000";
        d2   <=  "0001011001000";
        WAIT FOR 30 NS;
	 END PROCESS;
 END RTL;
    