-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 02 avr. 2024 à 07:38
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `activite`
--

INSERT INTO `activite` (`id`, `labelle`) VALUES
(1, 'Développement de logiciels sur mesure'),
(2, 'Services d\'infrastructure et de cloud computing'),
(3, 'Consulting en technologie de l\'information (TI)'),
(4, 'Sécurité informatique et gestion des risques');

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
('DoctrineMigrations\\Version20240326081605', '2024-03-26 08:16:14', 1744),
('DoctrineMigrations\\Version20240402072915', '2024-04-02 07:29:26', 307);

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
(1, 3, 'Tech Solutions Inc.', '123 Rue de l\'Innovation', 'Paris', 'France', '75001', '123'),
(2, 4, 'Data Experts Ltd.', '456 Data Drive', 'London', 'United Kingdom', 'EC1A ', '456'),
(3, 1, 'CyberGuard Technologies', '789 Cybersecurity Street', 'New York', 'United States', '10001', '789'),
(4, 2, 'WebSolutions SA', '101 Web Avenue', 'Geneva', 'Switzerland', '1201', '101'),
(5, 3, 'Cloud Innovations GmbH', '555 Cloud Way', 'Berlin', 'Germany', '10115', '555'),
(6, 1, 'Software Creations Corp.', '777 Software Street', 'San Francisco', 'United States', '94105', '777'),
(7, 2, 'Data Systems Ltd.', '888 Data Plaza', 'Sydney', 'Australia', '2000', '888'),
(8, 3, 'TechNet Solutions', '999 Tech Road', 'Tokyo', 'Japan', '100-0', '999'),
(9, 2, 'InnovaTech Inc.', '321 Innovation Boulevard', 'Toronto', 'Canada', 'M5J 2', '321'),
(10, 4, 'Digital Dynamics AG', '444 Digital Street', 'Zurich', 'Switzerland', '8001', '444');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `specialisation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_tel` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `etudiant`
--


INSERT INTO `etudiant` (`id`, `specialisation`, `nom`, `prenom`, `email`, `num_tel`) VALUES
(1, 'SLAM', 'Dupont', 'Jean', 'dupont.jean@example.com', '1234567890'),
(2, 'SISR', 'Durand', 'Pierre', 'durand.pierre@example.com', '0987654321'),
(3, 'SLAM', 'Martin', 'Marie', 'martin.marie@example.com', '1357924680'),
(4, 'SISR', 'Lefevre', 'Sophie', 'lefevre.sophie@example.com', '9876543210'),
(5, 'SLAM', 'Dubois', 'Paul', 'dubois.paul@example.com', '0123456789'),
(6, 'SISR', 'Moreau', 'Julie', 'moreau.julie@example.com', '5432167890'),
(7, 'SLAM', 'Garcia', 'Antoine', 'garcia.antoine@example.com', '9870123456'),
(8, 'SISR', 'Rodriguez', 'Emma', 'rodriguez.emma@example.com', '6789012345'),
(9, 'SLAM', 'Leroy', 'Lucie', 'leroy.lucie@example.com', '4567890123'),
(10, 'SISR', 'Sanchez', 'Thomas', 'sanchez.thomas@example.com', '3210987654');

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
-- Structure de la table `professionelle`
--

DROP TABLE IF EXISTS `professionelle`;
CREATE TABLE IF NOT EXISTS `professionelle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `metier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_tel` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `professionelle`
--

INSERT INTO `professionelle` (`id`, `metier`, `nom`, `prenom`, `email`, `num_tel`) VALUES
(1, 'Développeur logiciel', 'Dupuis', 'Luc', 'dupuis.luc@example.com', '1234567890'),
(2, 'Administrateur système', 'Lemaire', 'Sophie', 'lemaire.sophie@example.com', '0987654321'),
(3, 'Analyste de données', 'Mercier', 'Pauline', 'mercier.pauline@example.com', '1357924680'),
(4, 'Ingénieur en sécurité informatique', 'Fournier', 'Thomas', 'fournier.thomas@example.com', '9876543210'),
(5, 'Administrateur de base de données', 'Caron', 'Camille', 'caron.camille@example.com', '0123456789'),
(6, 'Analyste en cybersécurité', 'Roy', 'Julien', 'roy.julien@example.com', '5432167890'),
(7, 'Architecte cloud', 'Gauthier', 'Emma', 'gauthier.emma@example.com', '9870123456'),
(8, 'Ingénieur réseau', 'Girard', 'Louise', 'girard.louise@example.com', '6789012345'),
(9, 'Développeur web', 'Lefebvre', 'Antoine', 'lefebvre.antoine@example.com', '4567890123'),
(10, 'Consultant en informatique', 'Perrin', 'Charlotte', 'perrin.charlotte@example.com', '3210987654');

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
  `niveau` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C27C9369A4AEAFEA` (`entreprise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `stage`
--

INSERT INTO `stage` (`id`, `entreprise_id`, `date`, `niveau`) VALUES
(1, 1, '2020-01-01', ''),
(2, 2, '2020-01-01', ''),
(3, 3, '2020-01-01', ''),
(4, 4, '2020-01-01', ''),
(5, 5, '2021-01-01', ''),
(6, 6, '2021-01-01', ''),
(7, 7, '2021-01-01', ''),
(8, 8, '2021-01-01', ''),
(9, 10, '2022-01-01', ''),
(10, 9, '2022-01-01', ''),
(11, 5, '2022-01-01', ''),
(12, 2, '2022-01-01', ''),
(13, 1, '2023-01-01', ''),
(14, 7, '2023-01-01', ''),
(15, 8, '2023-01-01', ''),
(16, 10, '2023-01-01', ''),
(17, 4, '2024-01-01', ''),
(18, 3, '2024-01-01', ''),
(19, 6, '2024-01-01', ''),
(20, 5, '2024-01-01', '');

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
  KEY `IDX_1D1C63B3D60322AC` (`role_id`)
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
