DELETE FROM `activite`;
DELETE FROM `etudiant`;
DELETE FROM `etudiant_stage`;
DELETE FROM `jury`;
DELETE FROM `jury_professionelle`;
DELETE FROM `personne`;
DELETE FROM `professionelle`;
DELETE FROM `professionelle_stage`;
DELETE FROM `role`;
DELETE FROM `specialisation`;
DELETE FROM `specialisation_entreprise`;
DELETE FROM `stage`;
DELETE FROM `statut`;
DELETE FROM `statut_professionelle`;
DELETE FROM `utilisateur`;

---------- JEUX ESSAIS ----------------------------

INSERT INTO `activite` (`id`,`labelle`) VALUES
(1, 'Ventre Produit Electroménager'),
(2, 'Agence Web'),
(3, 'Industrie Automobile');

INSERT INTO `entreprise` (`id`, `activite_id`, `nom`, `rue`, `ville`, `pays`, `cp`, `num_rue`) VALUES
(1, 1, 'Tech Solutions Inc.', '123 Rue de l\'Innovation', 'Paris', 'France', '75001', '123'),
(2, 2, 'Data Experts Ltd.', '456 Data Drive', 'London', 'United Kingdom', 'EC1A ', '456'),
(3, 3, 'CyberGuard Technologies', '789 Cybersecurity Street', 'New York', 'United States', '10001', '789'),
(4, 1, 'WebSolutions SA', '101 Web Avenue', 'Geneva', 'Switzerland', '1201', '101'),
(5, 2, 'Cloud Innovations GmbH', '555 Cloud Way', 'Berlin', 'Germany', '10115', '555'),
(6, 3, 'Software Creations Corp.', '777 Software Street', 'San Francisco', 'United States', '94105', '777'),
(7, 1, 'Data Systems Ltd.', '888 Data Plaza', 'Sydney', 'Australia', '2000', '888'),
(8, 2, 'TechNet Solutions', '999 Tech Road', 'Tokyo', 'Japan', '100-0', '999'),
(9, 3, 'InnovaTech Inc.', '321 Innovation Boulevard', 'Toronto', 'Canada', 'M5J 2', '321'),
(10, 1, 'Digital Dynamics AG', '444 Digital Street', 'Zurich', 'Switzerland', '8001', '444');

INSERT INTO `etudiant` (`id`, `personne_id`, `specialisation`) VALUES
(1, 1, 'SLAM'),
(2, 2, 'SISR'),
(3, 3, 'SLAM'),
(4, 4, 'SISR'),
(5, 5, 'SLAM'),
(6, 6, 'SISR'),
(7, 7, 'SLAM'),
(8, 8, 'SISR'),
(9, 9, 'SLAM'),
(10, 10, 'SISR');

INSERT INTO `etudiant_stage` (`etudiant_id`, `stage_id`) VALUES
(1, 1),
(1, 11),
(2, 2),
(2, 12),
(3, 3),
(3, 13),
(4, 4),
(4, 14),
(5, 5),
(5, 15),
(6, 6),
(6, 16),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO `jury` (`id`, `date`) VALUES
(1, '2024'),
(2, '2023');

INSERT INTO `jury_professionelle` (`jury_id`, `professionelle_id`) VALUES
(1, 2),
(2, 1);

INSERT INTO `personne` (`id`, `nom`, `prenom`, `email`, `num_tel`) VALUES
(1, 'Dupont', 'Jean', 'jean.dupont@example.com', '0123456789'),
(2, 'Martin', 'Sophie', 'sophie.martin@example.com', '0987654321'),
(3, 'Leclerc', 'Pierre', 'pierre.leclerc@example.com', '0666666666'),
(4, 'Dubois', 'Marie', 'marie.dubois@example.com', '0712345678'),
(5, 'Lefevre', 'Thomas', 'thomas.lefevre@example.com', '0654321098'),
(6, 'Moreau', 'Emma', 'emma.moreau@example.com', '0956781234'),
(7, 'Garcia', 'Lucas', 'lucas.garcia@example.com', '0765432109'),
(8, 'Petit', 'Léa', 'lea.petit@example.com', '0823456789'),
(9, 'Robert', 'Anna', 'anna.robert@example.com', '0667891234'),
(10, 'Roux', 'Louis', 'louis.roux@example.com', '0978563412'),
(11, 'Nom1', 'Prenom1', 'email1@example.com', '0123456789'),
(12, 'Nom2', 'Prenom2', 'email2@example.com', '0123456789'),
(13, 'Nom3', 'Prenom3', 'email3@example.com', '0123456789'),
(14, 'Nom4', 'Prenom4', 'email4@example.com', '0123456789'),
(15, 'Nom5', 'Prenom5', 'email5@example.com', '0123456789'),
(16, 'Nom6', 'Prenom6', 'email6@example.com', '0123456789'),
(17, 'Nom7', 'Prenom7', 'email7@example.com', '0123456789'),
(18, 'Nom8', 'Prenom8', 'email8@example.com', '0123456789'),
(19, 'Nom9', 'Prenom9', 'email9@example.com', '0123456789'),
(20, 'Nom10', 'Prenom10', 'email10@example.com', '0123456789');

INSERT INTO `professionelle` (`id`, `personne_id`, `metier`) VALUES
(1, 11, 'Développeur logiciel'),
(2, 12, 'Administrateur système'),
(3, 13, 'Analyste de données'),
(4, 14, 'Ingénieur en sécurité informatique'),
(5, 15, 'Administrateur de base de données'),
(6, 16, 'Analyste en cybersécurité'),
(7, 17, 'Architecte cloud'),
(8, 18, 'Ingénieur réseau'),
(9, 19, 'Développeur web'),
(10, 20, 'Consultant en informatique');

INSERT INTO `professionelle_stage` (`professionelle_id`, `stage_id`) VALUES
(1, 10),
(2, 9),
(3, 8),
(4, 7),
(5, 6),
(5, 16),
(6, 5),
(6, 15),
(7, 4),
(7, 14),
(8, 3),
(8, 13),
(9, 2),
(9, 12),
(10, 1),
(10, 11);

INSERT INTO `role` (`id`, `labelle`) VALUES
(1, 'Administrateur'),
(2, 'Enseignent');

INSERT INTO `specialisation` (`id`, `labelle`) VALUES
(1, 'Développement logiciel'),
(2, 'Administration système'),
(3, 'Intelligence artificielle'),
(4, 'Analyse de données'),
(5, 'Cryptographie'),
(6, 'Ingénierie réseau'),
(7, 'Génie logiciel avancé avec focus sur les méthodologies Agile et DevOps'),
(8, 'Sécurité informatique avec spécialisation en tests d\'intrusion et audit de sécurité');

INSERT INTO `specialisation_entreprise` (`specialisation_id`, `entreprise_id`) VALUES
(1, 1),
(1, 7),
(2, 2),
(2, 8),
(3, 3),
(3, 9),
(4, 4),
(4, 10),
(5, 5),
(6, 6);

INSERT INTO `stage` (`id`, `entreprise_id`, `date`, niveau) VALUES
(1, 1, '2020-01-01', ),
(2, 2, '2020-01-01', ),
(3, 3, '2020-01-01', ),
(4, 4, '2020-01-01', ),
(5, 5, '2021-01-01', ),
(6, 6, '2021-01-01', ),
(7, 7, '2021-01-01'),
(8, 8, '2021-01-01'),
(9, 10, '2022-01-01'),
(10, 9, '2022-01-01'),
(11, 5, '2022-01-01'),
(12, 2, '2022-01-01'),
(13, 1, '2023-01-01'),
(14, 7, '2023-01-01'),
(15, 8, '2023-01-01'),
(16, 10, '2023-01-01'),
(17, 4, '2024-01-01'),
(18, 3, '2024-01-01'),
(19, 6, '2024-01-01'),
(20, 5, '2024-01-01');

INSERT INTO `statut` (`id`, `labelle`) VALUES
(1, 'Personne à contacter pour envoi CV'),
(2, 'Tuteur');

INSERT INTO `statut_professionelle` (`statut_id`, `professionelle_id`) VALUES
(1, 1),
(1, 10),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10);

INSERT INTO `utilisateur` (`id`, `role_id`, `username`, `password`, `email`) VALUES
(1, 1, 'admin', '$2y$10$1rqfAZizmHtZ1ZwBFmna4OIPvhKTJ.T03wNh1TkohaUzteWJk95mS', 'admin@localhost.fr');