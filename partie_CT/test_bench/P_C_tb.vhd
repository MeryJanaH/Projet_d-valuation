--****************************************************--
	--			ENSA FES		      --
	--		Filiere   : GSEII1
--****************************************************--
	--Title   : partie commande 
	--TP	  : Projet d'évaluation circuis reprogrammables & VHDL
	--block   : P_C_tb
--****************************************************--
	--File	  : teste bench
	--Authors : Meryem ANNOUAR
	--Created : 05/09/2020
--****************************************************--
	--description :
	-- Ce fichier est à fin de tester le fonctionnement de la machine à état ou de la partie commande qu'on a réaliser

--*****************************************************************--
--                        USED LIBRARIES                           --
--*****************************************************************--
	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.all;
--*****************************************************************--
--                      ENTITY DECLARATION                         --
--*****************************************************************--

	ENTITY P_C_tb IS
	END P_C_tb;
	
--*******************************************************************--
--                        RTL DESCRIPTION                            --
--*******************************************************************--

	ARCHITECTURE RTL OF P_C_tb IS
	
		COMPONENT P_C IS PORT(
				CLK 			: IN  STD_LOGIC;
				RST				: IN  STD_LOGIC;
				START			: IN  STD_LOGIC;
				Comp            : IN  STD_LOGIC;
				Rdy				: OUT STD_LOGIC;
				Sel_a 			: OUT STD_LOGIC;
			    Sel_b 			: OUT STD_LOGIC;
			    En_a 			: OUT STD_LOGIC;
			    En_b			: OUT STD_LOGIC;
			    En_c		    : OUT STD_LOGIC);
	    END COMPONENT;
	    
	    
	    SIGNAL Clk,RST,Start,Comp,Rdy,Sel_a,Sel_b,En_a,En_b,En_c : STD_LOGIC;

	BEGIN 
    U : P_C PORT MAP(
    		-- on met la liaison des entrées
	          Clk	 => Clk,
	          RST 	 => RST,
	          Start  => Start,
	          Comp   => Comp,
	          Rdy	 => Rdy,
			  Sel_a  => Sel_a,
			  Sel_b  => Sel_b,
			  En_a 	 => En_a,
			  En_b	 => En_b,
			  En_c	 => En_c);

	
	   PROCESS
	       BEGIN 
	           Clk <= '1';
	           WAIT FOR 20 ns;
	           Clk <= '0';
	           WAIT FOR 20 ns;
	    END PROCESS;
    
    
	    PROCESS 
	        BEGIN 
	            RST <= '1';
	            WAIT FOR 20 ns;
	            RST <= '0';
	            WAIT FOR 60 ns;
	    END PROCESS;
    
	    PROCESS
	        BEGIN
	        --dépot des opérandes
	            Start <= '1';
	            Comp <= '1';
	            WAIT FOR 100 ns;
	            Comp <= '0';
	            WAIT FOR 20 ns;
	            Comp <= '1';
	            WAIT FOR 20 ns;
	    END PROCESS;
	END RTL;
	