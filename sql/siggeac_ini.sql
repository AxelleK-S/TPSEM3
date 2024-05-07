/*
-- =========================================================================== A
Produit : SIGGEAC
Artefact : siggeac_ini.sql
Statut : travail en cours
Plateformes : PostgreSQL 12+
-- =========================================================================== A
*/


--
--  Définir le schéma principal de la base de données Universite (MDD).
--  Les autorisations d’accès sont faites par ailleurs
--  (voir fichier Universite_MDD_base.acc.sql dans une version subséquente).
--
drop schema if exists  "MDD" cascade ;
create schema "MDD" ;

--
--  Définir l’interface machine-machine IMM_base pour la base de données Universite
--  Les autorisations d’accès seront faites par ailleurs
--  (voir fichier Universite_IMM_base.acc.sql dans une version subséquente).
--
drop schema if exists  "IMM_cours" cascade ;
create schema "IMM_cours" ;

--
--  Définir l’interface machine-machine IMM_base pour la base de données Universite
--  Les autorisations d’accès seront faites par ailleurs
--  (voir fichier Universite_IMM_base.acc.sql dans une version subséquente).
--
drop schema if exists  "IMM_etudiant" cascade ;
create schema "IMM_etudiant" ;

--
--  Définir l’interface machine-machine IMM_base pour la base de données Universite
--  Les autorisations d’accès seront faites par ailleurs
--  (voir fichier Universite_IMM_base.acc.sql dans une version subséquente).
--
drop schema if exists  "IMM_offreService" cascade ;
create schema "IMM_offreService" ;
/*
-- =========================================================================== Z

=== Contributeurs
  FOYANG Etienne Junior
  ELO'O BIYO Henri
  NANGMO FODOUOP Kephren Curtis
  KWAMOU SIAGAT Axelle Steacy


=== Références
[ddv] http://info.usherbrooke.ca/llavoie/enseignement/Exemples/Universite/
      Universite_DDV.pdf
[std] http://info.usherbrooke.ca/llavoie/enseignement/Modules/
      BD190-STD-SQL-01_NDC.pdf

-- =========================================================================== Z
*/
