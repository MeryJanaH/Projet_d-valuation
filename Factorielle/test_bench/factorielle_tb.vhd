--****************************************************--
--			ENSA FES		      --
--		Filiere   : GSEII1
--****************************************************--
	--Title   : Diviseur 8 bits
	--TP	  : TP 3
	--block   : Div_8bits_tb
--****************************************************--
	--File	  : teste bench
	--Authors : Meryem ANNOUAR
	--Created : 07/04/2020
--****************************************************--
	--description :
	-- le teste du Diviseur de deux nombre sur 8 bits
--****************************************************--
--****************************************************--
--****************************************************--
--					USED LIBRARIES
--****************************************************--

	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	
--****************************************************--
--					ENTITY DECLARATION
--****************************************************--

	ENTITY factorielle_tb IS
	END factorielle_tb;
	
-- **********************************************************************
-- *                        RTL Description                             *
-- **********************************************************************

	ARCHITECTURE RTL OF factorielle_tb IS 
	
		COMPONENT factorielle IS
		PORT(
			CLK  	:	IN  STD_LOGIC;
			RST 	: 	IN  STD_LOGIC;
			START	:   IN  STD_LOGIC;
			Rdy		:   OUT STD_LOGIC;
			N 		:	IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
			fact    :   OUT STD_LOGIC_VECTOR(12 DOWNTO 0));
		END COMPONENT;
		
		SIGNAL Clk,RST,Start,Rdy : STD_LOGIC;
		SIGNAL N                 : STD_LOGIC_VECTOR(2 DOWNTO 0);
		SIGNAL fact              : STD_LOGIC_VECTOR(12 DOWNTO 0);

	BEGIN
    f : factorielle PORT MAP(
             Clk   => Clk,
             RST   => RST,
             N     => N,
             Start => Start,
             Rdy   => Rdy,
             fact  => fact);
                        
             
             
        PROCESS 
            BEGIN
                Clk <= '1';
                WAIT FOR 20 NS;
                Clk <= '0';
                WAIT FOR 20 NS;
       END PROCESS;
       
       
       PROCESS 
           BEGIN 
               RST <= '0';
               WAIT FOR 40 ns;
               RST <= '1';
               WAIT FOR 10 ms;
        END PROCESS;
        
       
        PROCESS
        BEGIN 
              Start <= '1';
              WAIT FOR 60 ns;
              Start <= '0';
              WAIT FOR 340 ns; 
       END PROCESS;
       
       PROCESS
        BEGIN 
              N <= "100";  
              WAIT FOR 260 ns;
              N <= "111";
              WAIT FOR 400 ns; 
       END PROCESS;
               
                 
                     
	END RTL;

	