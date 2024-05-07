/*
-- =========================================================================== A
Produit : SIGGEAC
Artefact : siggeac_imm_cours.sql
Statut : travail en cours
Plateformes : PostgreSQL 12+
-- =========================================================================== A
*/
--  Cours
--  TODO 2021-03-19 (LL01) : Ajouter, retirer, modifier un cours

--  Offre
--  TODO 2021-03-19 (LL01) : Ajouter, retirer, modifier une offre

--
--  Ajouter, retirer : un préalable à un cours.
--
--  TODO 2021-03-19 (LL01) : Ajouter, retirer : un préalable à un cours.

--
--  Déterminer si un étudiant remplit les conditions préalables à un cours.
--
--  TODO 2021-03-19 (LL01) : Déterminer si un étudiant remplit les conditions préalables à un cours.


--
--  Déterminer si l’offre effective est en accord avec l’offre planifiée.
--

create or replace function Offre_plan_non_couverte ()
  returns table
    (
      sigle Sigle,
      trimestre Trimestre
    )
  language sql as
$$
  select sigle, trimestre from Offre
  except
  select distinct sigle, trimestre from Affectation
$$;
comment on function Offre_plan_non_couverte () is
  'Détermine les cours de l’offre (planifiée) non couverts par l’affection (offre effective).'
;

create or replace function Offre_eff_conforme () returns boolean
  language sql as
$$
  select not exists(select * from Offre_plan_non_couverte())
$$;
comment on function Offre_eff_conforme () is
  'Détermine si l’affection (offre effective) est conforme à l’offre (planifiée).'
;


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
