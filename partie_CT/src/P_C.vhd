--****************************************************--
	--			ENSA FES		      --
	--		Filiere   : GSEII1
--****************************************************--
	--Title   : partie commande 
	--TP	  : Projet d'�valuation circuis reprogrammables & VHDL
	--block   : P_C
--****************************************************--
	--File	  : SRC
	--Authors : Meryem ANNOUAR
	--Created : 05/09/2020
--****************************************************--
	--description :
	-- C'est la partie commande qui va guider le process de synth�se
	-- Cette partie va g�n�rer la logique que la partie op�rative va suivre 

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
                         -- signaler le d�but // ready � l'aquisition des donn�es 
                              Rdy <= '1';
                              
                              Sel_a <= '1';
                              Sel_b <= '1';
                              
                              En_c  <= '0';
                              
                              En_a  <= '0';
                              En_b  <= '0';
                              
                          IF(Start = '1')THEN
                          -- le d�pot des op�rande est fait
                                  n_state <= E1;
                               ELSE 
                                  n_state <= E0;
                           END IF;
                           
                           WHEN E1 =>
                          -- le d�but et le commencement de la premier op�ration
                               Rdy <= '0';
                               
                               Sel_a <= '1';
                               Sel_b <= '1';
                               
                               En_c  <= '0';
                               
                               En_a  <= '1';
                               En_b  <= '1';
                               
                               n_state <= E2;
                               
                            WHEN E2 =>
                          -- les op�ration qui restent sont effectuer � cette �tape en mettant les selection � 0 pour arr�ter l'aquisition de nouveau donn�es
                                Rdy <= '0';
                                
                                Sel_a <= '0';
                                Sel_b <= '0';
                                
                                En_c  <= '0';
                                
                                En_a  <= '1';
                                En_b  <= '1';
                          -- si le r�sultat de comparaison est null on passe � l'�tat suivant       
                                IF(Comp = '0')THEN
                                    En_c    <= '1';
                                    n_state <= E3;
                                    ELSE 
                                    n_state <= E2;     
                                 END IF;
                                 
                             WHEN E3 => 
                         -- on d�sactive le tout afin d'afficher le r�sultat � l'�tat initial
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
