-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 28 mars 2024 à 14:32
-- Version du serveur : 8.2.0
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestionstagebdh`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

DROP TABLE IF EXISTS `activite`;
CREATE TABLE IF NOT EXISTS `activite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `labelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240326081605', '2024-03-26 08:16:14', 1744);

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

DROP TABLE IF EXISTS `entreprise`;
CREATE TABLE IF NOT EXISTS `entreprise` (
  `id` int NOT NULL AUTO_INCREMENT,
  `activite_id` int DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pays` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_rue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D19FA609B0F88B1` (`activite_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `entreprise`
--

INSERT INTO `entreprise` (`id`, `activite_id`, `nom`, `rue`, `ville`, `pays`, `cp`, `num_rue`) VALUES
(1, NULL, 'Tech Solutions Inc.', '123 Rue de l\'Innovation', 'Paris', 'France', '75001', '123'),
(2, NULL, 'Data Experts Ltd.', '456 Data Drive', 'London', 'United Kingdom', 'EC1A ', '456'),
(3, NULL, 'CyberGuard Technologies', '789 Cybersecurity Street', 'New York', 'United States', '10001', '789'),
(4, NULL, 'WebSolutions SA', '101 Web Avenue', 'Geneva', 'Switzerland', '1201', '101'),
(5, NULL, 'Cloud Innovations GmbH', '555 Cloud Way', 'Berlin', 'Germany', '10115', '555'),
(6, NULL, 'Software Creations Corp.', '777 Software Street', 'San Francisco', 'United States', '94105', '777'),
(7, NULL, 'Data Systems Ltd.', '888 Data Plaza', 'Sydney', 'Australia', '2000', '888'),
(8, NULL, 'TechNet Solutions', '999 Tech Road', 'Tokyo', 'Japan', '100-0', '999'),
(9, NULL, 'InnovaTech Inc.', '321 Innovation Boulevard', 'Toronto', 'Canada', 'M5J 2', '321'),
(10, NULL, 'Digital Dynamics AG', '444 Digital Street', 'Zurich', 'Switzerland', '8001', '444');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `personne_id` int NOT NULL,
  `specialisation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_717E22E3A21BD112` (`personne_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `etudiant`
--

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

-- --------------------------------------------------------

--
-- Structure de la table `etudiant_stage`
--

DROP TABLE IF EXISTS `etudiant_stage`;
CREATE TABLE IF NOT EXISTS `etudiant_stage` (
  `etudiant_id` int NOT NULL,
  `stage_id` int NOT NULL,
  PRIMARY KEY (`etudiant_id`,`stage_id`),
  KEY `IDX_BD46BF75DDEAB1A3` (`etudiant_id`),
  KEY `IDX_BD46BF752298D193` (`stage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `etudiant_stage`
--

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

-- --------------------------------------------------------

--
-- Structure de la table `jury`
--

DROP TABLE IF EXISTS `jury`;
CREATE TABLE IF NOT EXISTS `jury` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `jury`
--

INSERT INTO `jury` (`id`, `date`) VALUES
(1, '2024'),
(2, '2023');

-- --------------------------------------------------------

--
-- Structure de la table `jury_professionelle`
--

DROP TABLE IF EXISTS `jury_professionelle`;
CREATE TABLE IF NOT EXISTS `jury_professionelle` (
  `jury_id` int NOT NULL,
  `professionelle_id` int NOT NULL,
  PRIMARY KEY (`jury_id`,`professionelle_id`),
  KEY `IDX_FFF3F317E560103C` (`jury_id`),
  KEY `IDX_FFF3F317B4371B94` (`professionelle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `jury_professionelle`
--

INSERT INTO `jury_professionelle` (`jury_id`, `professionelle_id`) VALUES
(1, 2),
(2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

DROP TABLE IF EXISTS `personne`;
CREATE TABLE IF NOT EXISTS `personne` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_tel` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personne`
--

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

-- --------------------------------------------------------

--
-- Structure de la table `professionelle`
--

DROP TABLE IF EXISTS `professionelle`;
CREATE TABLE IF NOT EXISTS `professionelle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `personne_id` int NOT NULL,
  `metier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A7CFF384A21BD112` (`personne_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `professionelle`
--

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

-- --------------------------------------------------------

--
-- Structure de la table `professionelle_stage`
--

DROP TABLE IF EXISTS `professionelle_stage`;
CREATE TABLE IF NOT EXISTS `professionelle_stage` (
  `professionelle_id` int NOT NULL,
  `stage_id` int NOT NULL,
  PRIMARY KEY (`professionelle_id`,`stage_id`),
  KEY `IDX_30E8B603B4371B94` (`professionelle_id`),
  KEY `IDX_30E8B6032298D193` (`stage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `professionelle_stage`
--

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

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `labelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `labelle`) VALUES
(1, 'Administrateur'),
(2, 'Enseignent');

-- --------------------------------------------------------

--
-- Structure de la table `specialisation`
--

DROP TABLE IF EXISTS `specialisation`;
CREATE TABLE IF NOT EXISTS `specialisation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `labelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `specialisation`
--

INSERT INTO `specialisation` (`id`, `labelle`) VALUES
(1, 'Développement logiciel'),
(2, 'Administration système'),
(3, 'Intelligence artificielle'),
(4, 'Analyse de données'),
(5, 'Cryptographie'),
(6, 'Ingénierie réseau'),
(7, 'Génie logiciel avancé avec focus sur les méthodologies Agile et DevOps'),
(8, 'Sécurité informatique avec spécialisation en tests d\'intrusion et audit de sécurité');

-- --------------------------------------------------------

--
-- Structure de la table `specialisation_entreprise`
--

DROP TABLE IF EXISTS `specialisation_entreprise`;
CREATE TABLE IF NOT EXISTS `specialisation_entreprise` (
  `specialisation_id` int NOT NULL,
  `entreprise_id` int NOT NULL,
  PRIMARY KEY (`specialisation_id`,`entreprise_id`),
  KEY `IDX_2B884D7C5627D44C` (`specialisation_id`),
  KEY `IDX_2B884D7CA4AEAFEA` (`entreprise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `specialisation_entreprise`
--

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

-- --------------------------------------------------------

--
-- Structure de la table `stage`
--

DROP TABLE IF EXISTS `stage`;
CREATE TABLE IF NOT EXISTS `stage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entreprise_id` int NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C27C9369A4AEAFEA` (`entreprise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `stage`
--

INSERT INTO `stage` (`id`, `entreprise_id`, `date`) VALUES
(1, 1, '2020-01-01'),
(2, 2, '2020-01-01'),
(3, 3, '2020-01-01'),
(4, 4, '2020-01-01'),
(5, 5, '2021-01-01'),
(6, 6, '2021-01-01'),
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

-- --------------------------------------------------------

--
-- Structure de la table `statut`
--

DROP TABLE IF EXISTS `statut`;
CREATE TABLE IF NOT EXISTS `statut` (
  `id` int NOT NULL AUTO_INCREMENT,
  `labelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `statut`
--

INSERT INTO `statut` (`id`, `labelle`) VALUES
(1, 'Personne à contacter pour envoi CV'),
(2, 'Tuteur');

-- --------------------------------------------------------

--
-- Structure de la table `statut_professionelle`
--

DROP TABLE IF EXISTS `statut_professionelle`;
CREATE TABLE IF NOT EXISTS `statut_professionelle` (
  `statut_id` int NOT NULL,
  `professionelle_id` int NOT NULL,
  PRIMARY KEY (`statut_id`,`professionelle_id`),
  KEY `IDX_DA7EA46BF6203804` (`statut_id`),
  KEY `IDX_DA7EA46BB4371B94` (`professionelle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `statut_professionelle`
--

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

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1D1C63B3D60322AC` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `role_id`, `username`, `password`, `email`) VALUES
(1, 1, 'Hougooo', '1234', 'hougoo@mail.fr'),
(2, 2, 'toto', '0+0', 'toto@mail.fr');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `entreprise`
--
ALTER TABLE `entreprise`
  ADD CONSTRAINT `FK_D19FA609B0F88B1` FOREIGN KEY (`activite_id`) REFERENCES `activite` (`id`);

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `FK_717E22E3A21BD112` FOREIGN KEY (`personne_id`) REFERENCES `personne` (`id`);

--
-- Contraintes pour la table `etudiant_stage`
--
ALTER TABLE `etudiant_stage`
  ADD CONSTRAINT `FK_BD46BF752298D193` FOREIGN KEY (`stage_id`) REFERENCES `stage` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_BD46BF75DDEAB1A3` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `jury_professionelle`
--
ALTER TABLE `jury_professionelle`
  ADD CONSTRAINT `FK_FFF3F317B4371B94` FOREIGN KEY (`professionelle_id`) REFERENCES `professionelle` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_FFF3F317E560103C` FOREIGN KEY (`jury_id`) REFERENCES `jury` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `professionelle`
--
ALTER TABLE `professionelle`
  ADD CONSTRAINT `FK_A7CFF384A21BD112` FOREIGN KEY (`personne_id`) REFERENCES `personne` (`id`);

--
-- Contraintes pour la table `professionelle_stage`
--
ALTER TABLE `professionelle_stage`
  ADD CONSTRAINT `FK_30E8B6032298D193` FOREIGN KEY (`stage_id`) REFERENCES `stage` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_30E8B603B4371B94` FOREIGN KEY (`professionelle_id`) REFERENCES `professionelle` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `specialisation_entreprise`
--
ALTER TABLE `specialisation_entreprise`
  ADD CONSTRAINT `FK_2B884D7C5627D44C` FOREIGN KEY (`specialisation_id`) REFERENCES `specialisation` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_2B884D7CA4AEAFEA` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprise` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `stage`
--
ALTER TABLE `stage`
  ADD CONSTRAINT `FK_C27C9369A4AEAFEA` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprise` (`id`);

--
-- Contraintes pour la table `statut_professionelle`
--
ALTER TABLE `statut_professionelle`
  ADD CONSTRAINT `FK_DA7EA46BB4371B94` FOREIGN KEY (`professionelle_id`) REFERENCES `professionelle` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_DA7EA46BF6203804` FOREIGN KEY (`statut_id`) REFERENCES `statut` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `FK_1D1C63B3D60322AC` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
