--****************************************************--
	--			ENSA FES		      --
	--		Filiere   : GSEII1
--****************************************************--
	--Title   : Fichier TOP du partie opérative
	--TP	  : Projet d'évaluation circuis reprogrammables & VHDL
	--block   : top_op
--****************************************************--
	--File	  : SRC
	--Authors : Meryem ANNOUAR
	--Created :05/09/2020
--****************************************************--
	--description :
	-- Ici j'ai réalisé le fichier TOP de la Partie Opérative du calculateur de factoriel
	

--*****************************************************************--
--                        USED LIBRARIES                           --
--*****************************************************************--
	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
--*****************************************************************--
--                      ENTITY DECLARATION                         --
--*****************************************************************--

		ENTITY top_op IS
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
	END top_op;
	
--*******************************************************************--
--                        RTL DESCRIPTION                            --
--*******************************************************************--

ARCHITECTURE RTL OF top_op IS
	
		COMPONENT comp_3bits IS 
		 PORT(
	    	 Data_in 	: IN std_logic_vector(2 DOWNTO 0);
	    	 diff       : OUT std_logic);
		END COMPONENT;
		
		COMPONENT dec_1 IS 
		PORT(
			 Data_in 	: IN  std_logic_vector(2 DOWNTO 0);
	    	 Data_out	: OUT std_logic_vector(2 DOWNTO 0));
		END COMPONENT;
		
		COMPONENT Multip_16bits IS 
		PORT(
	    	 Data_1 	: IN  std_logic_vector(2 DOWNTO 0);
	    	 Data_2     : IN std_logic_vector(12 DOWNTO 0);
	    	 mul        : OUT std_logic_vector(12 DOWNTO 0));
	    END COMPONENT;
	    
	    COMPONENT Mux2_1 IS 
	    GENERIC (NB_bits : INTEGER :=3);
		PORT(
			 Data_0 	: IN  std_logic_vector(NB_bits-1 DOWNTO 0);
	    	 Data_1 	: IN  std_logic_vector(NB_bits-1 DOWNTO 0);
	    	 Sel 		: IN  std_logic;
	    	 Data_out   : OUT std_logic_vector(NB_bits-1 DOWNTO 0));
	    END COMPONENT;
	    
	    COMPONENT registre_nbits IS
		GENERIC (NB_bits : INTEGER :=3); 
		PORT(
		    Clk : IN std_logic;
		    RST : IN std_logic;
		    Enable : IN std_logic; 
		    Data_in : IN std_logic_vector(NB_bits-1 DOWNTO 0);
		    Data_out : OUT std_logic_vector(NB_bits-1 DOWNTO 0));
	    END COMPONENT;
	    
	    SIGNAL mux1_out, reg_aout, s_dec   : STD_LOGIC_VECTOR(2 DOWNTO 0);
	    SIGNAL reg_bout                    : STD_LOGIC_VECTOR(12 DOWNTO 0);
	    SIGNAL unite                       : STD_LOGIC_VECTOR(12 DOWNTO 0) := "0000000000001";
	    SIGNAL mul_out, mux2_out           : STD_LOGIC_VECTOR(12 DOWNTO 0);

	
	BEGIN
	
	Comp :   comp_3bits PORT MAP(
	    	 Data_in 	=>   mux1_out,
	    	 diff       =>   R_diff);
	    	 
  	Decr :  dec_1 PORT MAP (
			 Data_in 	=>   reg_aout,
	    	 Data_out	=>   s_dec);
    
	 Mul  :  Multip_16bits PORT MAP (
	    	 Data_1 	=>   reg_aout,
	    	 Data_2     =>   reg_bout,
	    	 mul        =>   mul_out);
	    	 
	Mux1 :  Mux2_1 GENERIC MAP(3) PORT MAP (
			 Data_0 	=>   N,
	    	 Data_1 	=>   s_dec,
	    	 Sel 		=>   sel_a,
	    	 Data_out   =>   mux1_out);
	    	 
	Mux2 :  Mux2_1 GENERIC MAP(13) PORT MAP (
			 Data_0 	=>   unite,
			 Data_1 	=>   mul_out,
			 Sel 		=>   sel_b,
			 Data_out   =>   mux2_out);

		 
	Reg_a:  registre_nbits GENERIC MAP(3) PORT MAP(
		    Clk         =>   Clk,
		    RST         =>   Rst,
		    Enable      =>   En_a, 
		    Data_in     =>   mux1_out,
		    Data_out    =>   reg_aout);
	
	Reg_b:  registre_nbits GENERIC MAP(13) PORT MAP(
		    Clk         =>   Clk,
		    RST 		=>   Rst,
		    Enable      =>   En_b, 
		    Data_in     =>   mux2_out,
		    Data_out    =>   reg_bout);
	
	Reg_c:  registre_nbits GENERIC MAP(13) PORT MAP(
		    Clk         =>   Clk,
		    RST         =>   Rst,
		    Enable      =>   En_r, 
		    Data_in     =>   mul_out,
		    Data_out    =>   R_mul);
		    
	END RTL;
		
	    
		