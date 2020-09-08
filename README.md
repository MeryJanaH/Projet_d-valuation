# Projet_d-valuation
Projet d'évaluation : VHDL &amp;&amp; CR

## Organisation des dossiers

 Dossier `Factorielle`          : Contient les fichiers qui concernent la partie Top qui rassemble les deux parties OP et CT pour la réalisation de la fonction souhaité (calcule du factorielle)
 Dossier `partie_CT`            : Contient les fichiers de la partie côntrole du circuit
 Dossier `partie_OP`            : Contient les fichiers de la partie opérative du circuit
 Dossier `test` (Optionnel)     : Contient les fichiers de la deuxième méthode de la réalisation du multiplication (en utilisant FSM) que j'ai adapté avec mon circuit (En faisant des petits modifications sur la partie opérative au niveau des connexions pour l'inclusion de cette méthode, ça marche très bien)
 
 -------------------------------------------------
 Chaque code qui réalise un fonctionnement précis contient 4 dossiers :
   
    modelsim   : Le script de compilation et simulation
    quartus    : Projet quartus 
    src        : Code source
    test_bench : Code de teste 
    
    
## Règles à respecter
 
 Avant de démarrer ce projet sur Quartus ou ModelSim, vous devez avoir un __clone local__ de votre repository.
 
## Comment cloner localement votre repo

Récupérér le lien de votre repo :
    Cliquer sur le bouton vert __Clone or download__ et copier l'URL

Cloner avec __Visual Studio Code__ :
    * Ouvrir Visual Studio Code
    * Appuyer sur `F1`, ensuite taper `clone`, choisissez `Git: Clone`
    * Coller l'URL dans le champ demandé
    * Sauvegarder quelque part (`C:\Travail`)
    * Cliquer sur `Open Repository`
    
    
## Branches, Commits, et Synchronisation
------------------------------------------

Vous devez installer les logiciels qui vous seront utiles pour travailler avec ce projet 
Dans l'ordre, installer :
  Pour installer **Git**      (https://www.git-scm.com/download)
  Pour installer **Visual Studio Code**    (https://code.visualstudio.com/download)
  Pour installer **Quartus et ModelSim**   (http://fpgasoftware.intel.com/16.1/?edition=standard&platform=windows&download_manager=direct&product=modelsim_ae#tabs-2)

Ensuite, installer les extensions sur Visual Studio Code
  Pour cela, cloner juste votre repo sous Visual Studio Code
  Accepter toutes les requêtes de Visual Studio Code.
