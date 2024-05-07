/*
-- =========================================================================== A
Produit : SIGGEAC
Artefact : siggeac_imm_professeur.sql
Statut : travail en cours
Plateformes : PostgreSQL 12+
-- =========================================================================== A
*/

--  Professeur
--  TODO 2021-03-19 (LL01) : Ajouter, retirer, modifier un professeur

    -- Ajouter un professeur
    CREATE OR REPLACE PROCEDURE AjouterProfesseur(
      IN p_nom Nom,
      IN p_matriculeP MatriculeP
    )
    LANGUAGE plpgsql AS
    $$
    BEGIN
      -- Insérer le nouveau professeur dans la table "Professeur"
      INSERT INTO Professeur (nom, matriculeP)
      VALUES (p_nom, p_matriculeP);

      -- Afficher un message de succès
      RAISE NOTICE 'Le professeur % a été ajouté avec succès.', p_nom || ' ' || p_matriculeP;
    END;
        $$;

    --Retirer un professeur
        CREATE OR REPLACE PROCEDURE RetirerProfesseur(
          IN p_matriculeP MatriculeP
        )
        LANGUAGE plpgsql
        AS $$
        BEGIN
          -- Vérifier si le professeur existe
          IF EXISTS (SELECT 1 FROM Professeur WHERE matriculeP = p_matriculeP) THEN
            -- Supprimer le professeur de la table "Professeur"
            DELETE FROM Professeur WHERE matriculep = p_matriculeP;

            -- Afficher un message de succès
            RAISE NOTICE 'Le professeur avec l''ID % a été retiré avec succès.', p_matriculeP;
          ELSE
            -- Afficher un message d'erreur si le professeur n'existe pas
            RAISE EXCEPTION 'Le professeur avec l''ID % n''existe pas.', p_matriculeP;
          END IF;
        END;
        $$;

        --Modifier un professeur
            CREATE PROCEDURE modifierprofesseur(
                IN p_matriculeP MatriculeP,
                IN p_nom Nom
                )
                LANGUAGE plpgsql
                AS $$
                BEGIN
                IF EXISTS (SELECT 1 FROM Professeur WHERE maticuleP = p_matriculeP)
                THEN
                    -- Mettre à jour les informations du professeur
                    UPDATE Professeur
                    SET nom = p_nom
                    WHERE matriucleP = p_matriculeP;
                    -- Afficher un message de confirmation
                    RAISE NOTICE 'Le professeur a été modifié avec succès.';
                 END;
                $$

--  Ajouter, retirer : une compétence, une disponibilité ou une affectation à un professeur.
--
--  TODO 2021-03-19 (LL01) : Ajouter, retirer : une compétence, une disponibilité ou une affectation à un professeur.

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
