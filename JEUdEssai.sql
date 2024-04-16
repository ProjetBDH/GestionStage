-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 11 avr. 2024 à 13:25
-- Version du serveur : 8.0.31
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

--
-- Déchargement des données de la table `activite`
--

INSERT INTO `activite` (`id`, `labelle`) VALUES
                                             (1, 'Activite1'),
                                             (2, 'Activite2'),
                                             (3, 'Activite3'),
                                             (4, 'dsqdqs');

--
-- Déchargement des données de la table `entreprise`
--

INSERT INTO `entreprise` (`id`, `activite_id`, `nom`, `rue`, `ville`, `pays`, `cp`, `num_rue`) VALUES
                                                                                                   (1, 1, 'Entreprise1', 'Rue de rouen', 'Rouen', 'France', '76000', '16'),
                                                                                                   (2, 1, 'Entrerpise2', '5', '555', '55', '55000', '555');

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id`, `nom`, `prenom`, `email`, `num_tel`, `specialisation`) VALUES
                                                                                         (1, 'Etudiant1', 'Etudiant1', 'Etudiant1@localhost', '0123456789', 'Etudiant'),
                                                                                         (2, 'Bob', 'Dylan', 'dd@localhost', '0658781165', 'SLam');


--
-- Déchargement des données de la table `jury`
--

INSERT INTO `jury` (`id`, `date`) VALUES
                                      (1, '2024'),
                                      (2, '2024');


--
-- Déchargement des données de la table `professionelle`
--

INSERT INTO `professionelle` (`id`, `nom`, `prenom`, `email`, `num_tel`, `metier`) VALUES
    (1, 'Professionelle1', 'Professionelle1', 'Professionelle1@localhost', '0123456789', '0123456789');


--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `labelle`) VALUES
                                         (1, 'Role1'),
                                         (2, 'Role2'),
                                         (3, 'Role3');

--
-- Déchargement des données de la table `specialisation`
--

INSERT INTO `specialisation` (`id`, `labelle`) VALUES
                                                   (1, 'Specialisation1'),
                                                   (2, 'Specialisation2'),
                                                   (3, 'Specialisation3');


--
-- Déchargement des données de la table `stage`
--

INSERT INTO `stage` (`id`, `entreprise_id`, `date`, `niveau`) VALUES
                                                                  (1, 2, '2024', 'SLAM'),
                                                                  (2, 2, '2425', '456'),
                                                                  (3, 2, '2024', 'SLAM');

--
-- Déchargement des données de la table `statut`
--

INSERT INTO `statut` (`id`, `labelle`) VALUES
                                           (1, 'Salarié'),
                                           (2, 'Boss'),
                                           (3, 'Esclave');


--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `role_id`, `username`, `password`, `email`) VALUES
                                                                                 (1, 1, 'Utilisateur1', '$2y$10$xLjfI8Qy/SWR0y0fhor1WuxUhbO/rCd2E04wbI49kcu0KepnW2w8i', 'Utilisateur1@localhost'),
                                                                                 (2, 1, 'Utilisateur2', '$2y$10$F24sDvk7kb.j.J1qaMtBKexGU.BAshQyri.iXKVg6OxdYm.fT721O', 'Utilisateur2@localhost'),
                                                                                 (3, 1, 'admin', '$2y$10$m8bpSDh168ckpqfXqYhI/u8pS7nyp1GACjzIzBUge88h4uKBz3aT6', 'admin@localhost');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
