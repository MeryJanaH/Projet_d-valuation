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
	    	Data_1        : IN   STD_LOGIC_VECTOR(2 downto 0);
			Data_2        : IN   STD_LOGIC_VECTOR(12 downto 0); 		
			clk,rst,start : IN   STD_LOGIC;
			rdy           : OUT  STD_LOGIC;
			mul           : OUT  STD_LOGIC_VECTOR(12 downto 0));
	    END COMPONENT;
	    
	SIGNAL a                  : STD_LOGIC_VECTOR(2 downto 0);
	SIGNAL b                  : STD_LOGIC_VECTOR(12 downto 0);
	SIGNAL clk,rst,start,rdy  : STD_LOGIC; 
	SIGNAL mul_s              : STD_LOGIC_VECTOR(12 downto 0);

	begin
	
	U :  Multip_16bits PORT MAP (a,b,clk,rst,start,rdy,mul_s);
	
    PROCESS
	BEGIN
	clk <= '1';
	WAIT FOR 30 ns;
	clk <= '0';
	WAIT FOR 30 ns;
	END PROCESS;
	
	PROCESS 
	BEGIN
	rst <= '1';
	WAIT FOR 20 ns;
	rst <= '0';
	WAIT FOR 1 ms;
	END PROCESS ;
	
	PROCESS 
	begin
	start <= '0';
	WAIT FOR 200 ns;
	start <= '1';
	WAIT FOR 100 ns;
	END PROCESS;
	
    PROCESS 
	BEGIN
	a<= "011";
	b<= "0000000000101";
	WAIT FOR 20 ms;
	END PROCESS;
	
	END rtl;