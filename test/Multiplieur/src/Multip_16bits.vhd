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
	-- C'est deuxième solution avec FSM pour faire la multiplication de deux nombres au lieu d'utiliser la multiplication existant déjà dans la library IEEE

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
			-- Si on est à l'état 0, b prend la valeur de 2ème opérande
			
						b_input <= Data_2;
			 
			-- Si on détecte l'aquisition de b, on passe Start à 1
						  IF start = '1' THEN 
						
						    b_input<=Data_2;
						    
						 -- On rendre les deux opérande Data_1 et Data_2 de même size, donc on concatène Data_1 avec 13 bits de 0
						 
						    mul_s<=("0000000000000" & Data_1);
						    
						     n_state <= E1;
					      ELSE 
					      -- Sinn on boucle et on refait la même opération
                       		 n_state <= E0;
					      END IF;
					    
			WHEN E1 =>  
						-- Ici, On commence le calcul, alors on arrêre l'aquisition de données
						
							rdy <= '0';
							
						-- Si b_input est supérieur à 1
						
						IF b_input > "0000000000001" THEN
						
						-- On additionne le résultat précedent avec Data_1 et on décrémente b_input (2ème opérande)
						
						  mul_s <= mul_s + ("0000000000000" & Data_1);
						  
						  b_input <= STD_LOGIC_VECTOR(UNSIGNED(b_input) - "0000000000001");
						  
						  n_state <= E1;
						  
					    ELSIF(b_input = "0000000000001") THEN 
					    
						  mul <= mul_s(12 DOWNTO 0);
						  
						  -- Rdy = 1 , revenir à l'état initial
						  
						  rdy <= '1';
						  
						  n_state <= E0;
						  
					   END IF;
			END CASE;
		  END PROCESS;	
		
    END RTL;
    
