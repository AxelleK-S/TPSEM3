/*
-- =========================================================================== A
Produit : SIGGEAC
Artefact : siggeac_insert.sql
Statut : travail en cours
Plateformes : PostgreSQL 12+
-- =========================================================================== A
*/

-- insertion des cours

INSERT INTO Cours (sigle, titre, credit) VALUES
('INF102', 'Algorithmique et structures de données', 4),
('INF201', 'Programmation orientée objet', 3),
('INF301', 'Bases de données', 3);

-- insertion des groupes

INSERT INTO Groupe (sigle, trimestre, noGroupe) VALUES
('INF102', '2024-05', 2),
('INF201', '2024-05', 1),
('INF301', '2024-05', 1);

-- insertion des affectations

INSERT INTO Affectation (sigle, trimestre, noGroupe, matriculeP) VALUES
('INF102', '2024-05', 2, '234567'),
('INF201', '2024-05', 1, '345678'),
('INF301', '2024-05', 1, '456789');

-- insertion des inscriptions

INSERT INTO Inscription (matriculeE, sigle, trimestre, noGroupe) VALUES
('876543', 'INF102', '2024-05', 2),
('765432', 'INF201', '2024-05', 1),
('654321', 'INF301', '2024-05', 1);

-- insertion des evaluations

INSERT INTO Evaluation (matriculeE, sigle, trimestre, noGroupe, note) VALUES
('876543', 'INF102', '2024-05', 2, 90),
('765432', 'INF201', '2024-05', 1, 75),
('654321', 'INF301', '2024-05', 1, 80);

-- insertion des prealables

INSERT INTO Prealable (sigle, siglePrealable) VALUES
('INF201', 'INF101'),
('INF301', 'INF201'),
('INF102', 'INF100');

-- insertion des offres

INSERT INTO Offre (sigle, trimestre) VALUES
('INF102', '2024-05'),
('INF201', '2024-05'),
('INF301', '2024-05');

-- insertion des competences

INSERT INTO Competence (sigle, matriculeP) VALUES
('INF102', '234567'),
('INF201', '345678'),
('INF301', '456789');

-- insertion des disponibilites

INSERT INTO Disponibilite (trimestre, matriculeP) VALUES
('2024-05', '234567'),
('2024-05', '345678'),
('2024-05', '456789');


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
