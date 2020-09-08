--****************************************************--
	--			ENSA FES		      --
	--		Filiere   : GSEII1
--****************************************************--
	--Title   : Multiplieur
	--TP	  : Projet d'�valuation circuis reprogrammables & VHDL
	--block   : Multip_16bits_tb.vhd
--****************************************************--
	--File	  : SRC
	--Authors : Meryem ANNOUAR
	--Created : 06/09/2020
--****************************************************--

	--description :
	-- Ce block permet la multiplication de deux nombre
	-- Le r�sultat de la multiplication est sur 13 bits
	-- C'est deuxi�me solution avec FSM pour faire la multiplication de deux nombres au lieu d'utiliser la multiplication existant d�j� dans la library IEEE

--*****************************************************************--
--                        USED LIBRARIES                           --
--*****************************************************************--
	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;
	USE IEEE.STD_LOGIC_1164.ALL;
	use IEEE.NUMERIC_STD.all;

--*****************************************************************--
--                      ENTITY DECLARATION                         --
--*****************************************************************--

	ENTITY Multip_16bits IS 
		PORT(
	    	Data_1        : IN   STD_LOGIC_VECTOR(2 downto 0);
			Data_2        : IN   STD_LOGIC_VECTOR(12 downto 0); 		
			clk,rst,start : IN   STD_LOGIC;
			rdy           : OUT  STD_LOGIC;
			mul           : OUT  STD_LOGIC_VECTOR(12 downto 0));
	END Multip_16bits;
	
--*******************************************************************--
--                        RTL DESCRIPTION                            --
--*******************************************************************--

	ARCHITECTURE RTL OF Multip_16bits IS
	TYPE Etat is (E0,E1);
	SIGNAL c_state,n_state : Etat;

	SIGNAL mul_s        : STD_LOGIC_VECTOR(15 DOWNTO 0) := "0000000000000000";
	SIGNAL b_input      : STD_LOGIC_VECTOR(12 DOWNTO 0);


	BEGIN
	  PROCESS(clk,rst)
	  BEGIN
		IF(rst = '1') THEN c_state <= E0;
		ELSIF(clk'EVENT AND clk = '1') then 
			c_state <= n_state;
		END IF;
	  END PROCESS;
	  
      PROCESS(Data_1,Data_2,start,c_state)
	  BEGIN
		CASE c_state IS 

		
			WHEN E0 =>  
			-- Si on est � l'�tat 0, b prend la valeur de 2�me op�rande
			
						b_input <= Data_2;
			 
			-- Si on d�tecte l'aquisition de b, on passe Start � 1
						  IF start = '1' THEN 
						
						    b_input<=Data_2;
						    
						 -- On rendre les deux op�rande Data_1 et Data_2 de m�me size, donc on concat�ne Data_1 avec 13 bits de 0
						 
						    mul_s<=("0000000000000" & Data_1);
						    
						     n_state <= E1;
					      ELSE 
					      -- Sinn on boucle et on refait la m�me op�ration
                       		 n_state <= E0;
					      END IF;
					    
			WHEN E1 =>  
						-- Ici, On commence le calcul, alors on arr�re l'aquisition de donn�es
						
							rdy <= '0';
							
						-- Si b_input est sup�rieur � 1
						
						IF b_input > "0000000000001" THEN
						
						-- On additionne le r�sultat pr�cedent avec Data_1 et on d�cr�mente b_input (2�me op�rande)
						
						  mul_s <= mul_s + ("0000000000000" & Data_1);
						  
						  b_input <= STD_LOGIC_VECTOR(UNSIGNED(b_input) - "0000000000001");
						  
						  n_state <= E1;
						  
					    ELSIF(b_input = "0000000000001") THEN 
					    
						  mul <= mul_s(12 DOWNTO 0);
						  
						  -- Rdy = 1 , revenir � l'�tat initial
						  
						  rdy <= '1';
						  
						  n_state <= E0;
						  
					   END IF;
			END CASE;
		  END PROCESS;	
		
    END RTL;
    
