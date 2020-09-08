--****************************************************--
	--			ENSA FES		      --
	--		Filiere   : GSEII1
--****************************************************--
	--Title   : Teste du Fichier TOP du partie opérative
	--TP	  : Projet d'évaluation circuis reprogrammables & VHDL
	--block   : top_op
--****************************************************--
	--File	  : teste bench
	--Authors : Meryem ANNOUAR
	--Created :05/09/2020
--****************************************************--
	--description :
	-- Le teste du fonctionnement de la partie opérative du bloc qui va réaliser le calcul du factoriel
	

--*****************************************************************--
--                        USED LIBRARIES                           --
--*****************************************************************--
	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
--*****************************************************************--
--                      ENTITY DECLARATION                         --
--*****************************************************************--

	ENTITY top_op_tb IS	 
	END top_op_tb;
	
--*******************************************************************--
--                        RTL DESCRIPTION                            --
--*******************************************************************--

ARCHITECTURE RTL OF top_op_tb IS
	
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
			    R_mul   : OUT std_logic_vector(12 DOWNTO 0)
			    );    	 
		END COMPONENT;
	    
	    SIGNAL mul                         : STD_LOGIC_VECTOR(12 DOWNTO 0);
	    SIGNAL n                           : STD_LOGIC_VECTOR(2 DOWNTO 0);
	    SIGNAL clk, rst, sela, selb, ena, enb, enr, rdiff    : STD_LOGIC;


	BEGIN
	
	T	:   top_op PORT MAP(
    		    N       =>     n,
			    Clk		=>     clk,
			    Rst     =>     rst,
			    Sel_a   =>     sela,
			    Sel_b   =>     selb,
			    En_a    =>     ena,
			    En_b    =>     enb,
			    En_r    =>     enr,
			    R_diff  =>     rdiff,
			    R_mul   =>     mul);
			    
		PROCESS
             BEGIN
                 clk <= '1';
                 WAIT FOR 20 ns;
                 clk <= '0';
                 WAIT FOR 20 ns;
        END PROCESS;
        
        
        PROCESS
            BEGIN 
                rst <= '0';
                WAIT FOR 30 ns;
                rst <= '1';
                WAIT FOR 20 ms;
        END PROCESS;
        PROCESS 
            BEGIN
                sela <= '1';
		        selb <= '1';
		        ena  <= '1';
		        enb  <= '1';
		        enr  <= '0';
                WAIT FOR 30 ns;
                sela <= '0';
		        selb <= '0';
		        ena  <= '1';
		        enb  <= '1';
		        enr  <= '1';
                WAIT FOR 400 ns;
        END PROCESS;


                n <= "100";

		    
	END RTL;
		
	    
		