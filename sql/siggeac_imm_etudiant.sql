/*
-- =========================================================================== A
Produit : SIGGEAC
Artefact : siggeac_imm_etudiant.sql
Statut : travail en cours
Plateformes : PostgreSQL 12+
-- =========================================================================== A
*/



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
set search_path to 'IMM_etudiant' ;

--- Ajouter etudiant
CREATE PROCEDURE AjouterEtudiant (
    IN p_matriculeE "MDD".MatriculeE,
    IN p_nom "MDD".Nom,
    IN p_ddn Date
)
    language plpgsql
as $$
BEGIN
    INSERT INTO "MDD".Etudiant (matriculeE, nom, ddn)
    VALUES (p_matriculeE, p_nom, p_ddn);
END;
$$;

--- Retirer etudiant
CREATE PROCEDURE RetirerEtudiant (
    IN p_matriculeE "MDD".MatriculeE
)
    language plpgsql
as $$
BEGIN
    DELETE FROM "MDD".Etudiant
    WHERE matriculeE = p_matriculeE;
END;
$$;

--- Modification etudiant
CREATE PROCEDURE ModifierEtudiant (
    IN p_matriculeE "MDD".MatriculeE,
    IN p_nouveauNom "MDD".Nom,
    IN p_nouvelleDdn Date
)
    language plpgsql
as $$
BEGIN
    UPDATE "MDD".Etudiant
    SET nom = p_nouveauNom,
        ddn = p_nouvelleDdn
    WHERE matriculeE = p_matriculeE;
END;
$$;

--- Ajouter inscription etudiant à un groupe
CREATE PROCEDURE AjouterInscription (
    IN p_matriculeE "MDD".MatriculeE,
    IN p_sigle "MDD".Sigle,
    IN p_trimestre "MDD".Trimestre,
    IN p_noGroupe "MDD".NoGroupe
)
    language plpgsql
as $$
BEGIN
    INSERT INTO "MDD".Inscription (matriculeE, sigle, trimestre, noGroupe)
    VALUES (p_matriculeE, p_sigle, p_trimestre, p_noGroupe);
END;
$$;

--- Retirer inscription etudiant à un groupe
CREATE PROCEDURE RetirerInscription (
    IN p_matriculeE "MDD".MatriculeE,
    IN p_sigle "MDD".Sigle,
    IN p_trimestre "MDD".Trimestre,
    IN p_noGroupe "MDD".NoGroupe
)
    language plpgsql
as $$
BEGIN
    DELETE FROM "MDD".Inscription
    WHERE matriculeE = p_matriculeE
      AND sigle = p_sigle
      AND trimestre = p_trimestre
      AND noGroupe = p_noGroupe;
END;
$$;

--- Déterminer si un étudiant remplis les conditions préalables à un cours
-- CREATE PROCEDURE VerifierPreRequisCours(
--     IN p_matriculeE "MDD".MatriculeE,
--     IN p_sigleCours "MDD".Sigle
-- )
--     language plpgsql
-- as
-- $$
--     DECLARE
--         v_prerequisRequis VARCHAR(255);
--         v_coursPreRequis "MDD".Sigle;
--         v_prerequisFulfilled BOOLEAN;
-- BEGIN
--         SET v_prerequisFulfilled = TRUE;
--
-- END;
-- $$;
--
--     SELECT prerequis FROM "MDD".Prealable
-- WHERE sigle = p_sigleCours;
--
--     WHILE v_prerequisRequis IS NOT NULL LOOP
--     IF EXISTS (
--       SELECT *
--       FROM Inscription
--       WHERE matriculeE = p_matriculeE
--         AND sigle = v_coursPreRequis
--     ) THEN
--     SELECT prerequis FROM "MDD".Prealable
-- WHERE prerequisPrecedent = v_prerequisRequis;
--     SET v_coursPreRequis = v_prerequisRequis;
--     ELSE
--         SET v_prerequisFulfilled = FALSE;
--     LEAVE;
--     END IF;
--     END LOOP;
--
--     IF v_prerequisFulfilled THEN
--     SELECT CONCAT('L''étudiant ', p_matriculeE, ' remplit les prérequis pour le cours ', p_sigleCours);
--     ELSE
--     SELECT CONCAT('L''étudiant ', p_matriculeE, ' ne remplit pas les prérequis pour le cours ', p_sigleCours);
--     END IF;
--     END;
-- $$;


--- Consultation des informations des étudiants
CREATE PROCEDURE ConsulterEtudiants()
    language plpgsql
as $$
BEGIN
    SELECT nom, ddn
    FROM "MDD".Etudiant;
END;
$$;

--- Rechercher étudiant par nom
CREATE PROCEDURE RechercherEtudiant
(
    IN p_nom varchar(50)
)
    language plpgsql
as $$
BEGIN
    SELECT nom, ddn
    FROM "MDD".Etudiant
    WHERE nom = p_nom;
END;
$$;




