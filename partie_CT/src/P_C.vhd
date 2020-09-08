--****************************************************--
	--			ENSA FES		      --
	--		Filiere   : GSEII1
--****************************************************--
	--Title   : partie commande 
	--TP	  : Projet d'évaluation circuis reprogrammables & VHDL
	--block   : P_C
--****************************************************--
	--File	  : SRC
	--Authors : Meryem ANNOUAR
	--Created : 05/09/2020
--****************************************************--
	--description :
	-- C'est la partie commande qui va guider le process de synthèse
	-- Cette partie va générer la logique que la partie opérative va suivre 

--*****************************************************************--
--                        USED LIBRARIES                           --
--*****************************************************************--
	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.all;
--*****************************************************************--
--                      ENTITY DECLARATION                         --
--*****************************************************************--

	ENTITY P_C IS
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
	END ENTITY;
		
--*******************************************************************--
--                        RTL DESCRIPTION                            --
--*******************************************************************--

	ARCHITECTURE RTL OF P_C IS

		Type Etat is (E0,E1,E2,E3);
		SIGNAL c_state,n_state : Etat;

	BEGIN 
	              PROCESS(RST,Clk)
	                BEGIN
	                   IF(RST = '0')THEN
	                        c_state <= E0;
	                   ELSIF(Clk'event AND Clk = '1')THEN
	                   c_state <= n_state;
	                   END IF;
	                END PROCESS;
               
               
    		PROCESS(c_state, Comp, Start)
                   BEGIN
                       CASE c_state IS 
                          WHEN E0 => 
                         -- signaler le début // ready à l'aquisition des données 
                              Rdy <= '1';
                              
                              Sel_a <= '1';
                              Sel_b <= '1';
                              
                              En_c  <= '0';
                              
                              En_a  <= '0';
                              En_b  <= '0';
                              
                          IF(Start = '1')THEN
                          -- le dépot des opérande est fait
                                  n_state <= E1;
                               ELSE 
                                  n_state <= E0;
                           END IF;
                           
                           WHEN E1 =>
                          -- le début et le commencement de la premier opération
                               Rdy <= '0';
                               
                               Sel_a <= '1';
                               Sel_b <= '1';
                               
                               En_c  <= '0';
                               
                               En_a  <= '1';
                               En_b  <= '1';
                               
                               n_state <= E2;
                               
                            WHEN E2 =>
                          -- les opération qui restent sont effectuer à cette étape en mettant les selection à 0 pour arréter l'aquisition de nouveau données
                                Rdy <= '0';
                                
                                Sel_a <= '0';
                                Sel_b <= '0';
                                
                                En_c  <= '0';
                                
                                En_a  <= '1';
                                En_b  <= '1';
                          -- si le résultat de comparaison est null on passe à l'état suivant       
                                IF(Comp = '0')THEN
                                    En_c    <= '1';
                                    n_state <= E3;
                                    ELSE 
                                    n_state <= E2;     
                                 END IF;
                                 
                             WHEN E3 => 
                         -- on désactive le tout afin d'afficher le résultat à l'état initial
                                Rdy   <= '0';
                                Sel_a <= '0';
                                Sel_b <= '0';
                                
                                En_c  <= '0';
                                
                                En_a  <= '0';
                                En_b  <= '0';

                                n_state <= E0;
                                
                            WHEN OTHERS => 
                                Rdy   <= '1';
                                
                                Sel_a <= '1';
                                Sel_b <= '1';
                                
                                En_c  <= '1';
                                
                                En_a  <= '0';
                                En_b  <= '0';

                                n_state <= E0;
                            END CASE;
                    END PROCESS;
		END RTL;
