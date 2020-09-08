--****************************************************--
--			ENSA FES		      --
--		Filiere   : GSEII1
--****************************************************--
	--Title   : Calcule du Factorielle
	--TP	  : Projet d'évaluation circuis reprogrammables & VHDL
	--block   : Factorielle
--****************************************************--
	--File	  : SRC
	--Authors : Meryem ANNOUAR
	--Created : 06/09/2020
--****************************************************--
	--description :
	-- Ici est le bloc général qui permet de calculer le factorielle 
	-- Ce fichier combine la partie commande et la partie opérative
	
--****************************************************--
--****************************************************--
--					USED LIBRARIES
--****************************************************--

	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	
--****************************************************--
--					ENTITY DECLARATION
--****************************************************--

	ENTITY factorielle IS 
	PORT(
		CLK  	:	IN  STD_LOGIC;
		RST 	: 	IN  STD_LOGIC;
		START	:   IN  STD_LOGIC;
		Rdy		:   OUT STD_LOGIC;
		N 		:	IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		fact    :   OUT STD_LOGIC_VECTOR(12 DOWNTO 0));
	END factorielle;
	
-- **********************************************************************
-- *                        RTL Description                             *
-- **********************************************************************

	ARCHITECTURE RTL OF factorielle IS
	
		COMPONENT P_C IS
		PORT(
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
		
		COMPONENT top_op IS 	
        PORT(
			    N       : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			    Clk		: IN std_logic;
			    Rst     : IN std_logic;
			    Sel_a   : IN std_logic;
			    Sel_b   : IN std_logic;
			    En_a    : IN std_logic;
			    En_b    : IN std_logic;
			    En_r    : IN std_logic;
			    R_diff  : OUT std_logic;
			    R_mul   : OUT std_logic_vector(12 DOWNTO 0));
	    END COMPONENT;
	    
	    SIGNAL Sel_a,Sel_b,En_a,En_b,En_c,Comp : STD_LOGIC;
	    
	    
	    BEGIN
		    O : top_op PORT MAP(
		             N       => N,
		             Clk     => Clk,
		             RST     => RST,
		             Sel_a   => Sel_a,
		             Sel_b   => Sel_b,
		             En_a    => En_a,
		             En_b    => En_b,
		             En_r    => En_c,
		             R_diff  => Comp,
		             R_mul   => fact);
             
             
		    C : P_C PORT MAP(
		             Clk     => Clk,
		             RST     => RST,
		             Start   => Start,
		             Rdy     => Rdy,
		             Comp    => Comp,
		             Sel_a   => Sel_a,
		             Sel_b   => Sel_b,
		             En_a    => En_a,
		             En_b    => En_b,
		             En_c    => En_c);
		
		END RTL;

