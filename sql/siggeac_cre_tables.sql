/*
-- =========================================================================== A
Produit : SIGGEAC
Artefact : siggeac_cre_tables.sql
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
drop schema if exists  "IMM_base" cascade ;
create schema "IMM_base" ;

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
