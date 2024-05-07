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

    -- Ajouter un cours
    create or replace procedure insert_cour
        (sigle "MDD".sigle,title "MDD".titre,cdc "MDD".cdc)
    LANGUAGE plpgsql AS
    $$
    BEGIN
    --  remplit les éléments de la dernière commande enregistrées
    INSERT INTO cours(sigle, titre, credit) VALUES (insert_cour.sigle, title, cdc);
    END
    $$;

    -- Retirer un cours
    create or replace procedure delete_cour
        (id "MDD".sigle)
    LANGUAGE plpgsql AS
    $$
    BEGIN
    --  remplit les éléments de la dernière commande enregistrées
    DELETE FROM cours WHERE sigle == id;
    END
    $$;

    -- Modifier un cours
    create or replace procedure replace_cour
        (id "MDD".sigle,title "MDD".titre,cdc "MDD".cdc)
    LANGUAGE plpgsql AS
    $$
    BEGIN
    --  remplit les éléments de la dernière commande enregistrées
    UPDATE cours SET titre = title AND credit = cdc WHERE sigle == id;
    END
    $$;

--  Offre
--  TODO 2021-03-19 (LL01) : Ajouter, retirer, modifier une offre
    -- Ajouter une offre
    create or replace procedure insert_offer
        (sigle "MDD".sigle,trimestre "MDD".trimestre)
    LANGUAGE plpgsql AS
    $$
    BEGIN
    --  remplit les éléments de la dernière commande enregistrées
    INSERT INTO offre(sigle,trimestre) VALUES (insert_offer.sigle, insert_offer.trimestre);
    END
    $$;

    -- Retirer une offre
    create or replace procedure delete_offer
        (id "MDD".sigle,trimest "MDD".trimestre)
    LANGUAGE plpgsql AS
    $$
    BEGIN
    --  remplit les éléments de la dernière commande enregistrées
    DELETE FROM offre WHERE sigle == id AND trimestre == trimest ;
    END
    $$;

    -- Modifier une offre
    create or replace procedure replace_offer
        (id "MDD".sigle,trimest "MDD".trimestre, newTrim "MDD".trimestre)
    LANGUAGE plpgsql AS
    $$
    BEGIN
    --  remplit les éléments de la dernière commande enregistrées
    UPDATE offre SET trimestre = newTrim  WHERE sigle == id AND trimestre = trimest;
    END
    $$;

--
--  Ajouter, retirer : un préalable à un cours.
--
--  TODO 2021-03-19 (LL01) : Ajouter, retirer : un préalable à un cours.
    -- Ajouter une préalable à un cours
    create or replace procedure insert_prealable
        (sigle "MDD".sigle,siglePrealable "MDD".sigle)
    LANGUAGE plpgsql AS
    $$
    BEGIN
    --  remplit les éléments de la dernière commande enregistrées
    INSERT INTO prealable(sigle, sigleprealable) VALUES (insert_prealable.sigle,insert_prealable.siglePrealable);
    END
    $$;

     -- Retirer une prealable à un cours
    create or replace procedure delete_offer
        (id "MDD".sigle,siglePre "MDD".sigle)
    LANGUAGE plpgsql AS
    $$
    BEGIN
    --  remplit les éléments de la dernière commande enregistrées
    DELETE FROM prealable WHERE sigle== id  AND sigleprealable == siglePre  ;
    END
    $$;

--
--  Déterminer si un étudiant remplit les conditions préalables à un cours.
--
--  TODO 2021-03-19 (LL01) : Déterminer si un étudiant remplit les conditions préalables à un cours.

-- prendre le sigle du cours, regrouper les sigles prealables,
-- vérifier si l'etudiant a passé des evaluations dans celles-ci
    create or replace function EtudiantCondCours (id "MDD".sigle,matE "MDD".matriculee)
  returns table
    (
      Cours Sigle,
      Etudiant matriculee,
      ConditionsRemplies boolean
    )
  language sql as
$$
  select "MDD".prealable.sigle as Cours, "MDD".evaluation.matriculee as Etudiant
  from prealable join "MDD".evaluation e on prealable.sigleprealable = e.sigle
    where prealable.sigle = id AND "MDD".evaluation.matriculee = matE
$$;
comment on function EtudiantCondCours () is
  'Détermine si un étudiant remplit les conditions préalables à un cours'
;

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
