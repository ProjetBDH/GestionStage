-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 24 mai 2024 à 18:43
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
(3, 'Non Renseigné'),
(4, 'Agence Web'),
(5, 'Intégrateur d\'ERP : Codial (windev) + développement'),
(8, 'Médico-Social'),
(9, 'Métallerie'),
(10, 'Prestataire Informatique'),
(11, 'Production produits pétroliers'),
(12, 'Transport Urbain de Voyageurs');

--
-- Déchargement des données de la table `entreprise`
--

INSERT INTO `entreprise` (`id`, `activite_id`, `nom`, `rue`, `ville`, `pays`, `cp`, `num_rue`) VALUES
(8, 8, 'Association Le Pré de la Bataille', 'rue du pré de la bataille', 'Rouen', 'France', '76000', '39'),
(9, 3, '3D DENTAL STORE', 'route de Lyons la Forêt', 'Rouen', 'France', '76000', '75'),
(10, 3, 'ALTITUDE INFRA EXPLOITATION', 'Voie de l\'Orée', 'Val-de-Reuil', 'France', '27100', '2247'),
(11, 9, 'ANOXA (METALLERIE NORMANDE ) / YESKA Group', 'Rue de la coulée verte', 'Val-de-Reuil', 'France', '27400', '0'),
(12, 3, 'ATTINEOS Cybersécurité', 'Bd Ferdinand de Lesseps', 'Rouen', 'France', '76000', '20'),
(13, 3, 'ATTINEOS', 'Bd Ferdinand de Lesseps', 'Rouen', 'France', '76000', '20'),
(14, 3, 'Carrier Transicold industrie', 'Route de Paris', 'Franqueville Saint Pierre', 'France', '76520', '810'),
(15, 3, 'CARSAT Normandie', 'Avenue du Grand Cours – CS 36028', 'Rouen', 'France', '76028', '5'),
(16, 3, 'CCI Productions', 'ZA des Patis', 'ACQUIGNY', 'France', '27400', '0'),
(17, 3, 'Centre Henri-Becquerel', 'Rue d’Amiens - CS 11516', 'Rouen', 'France', '76038', '0'),
(18, 3, 'CESI', 'Avenue Edmund Halley', 'SAINT ETIENNE DU ROUVRAY', 'France', '76800', '80'),
(19, 3, 'CMA Normandie', 'rue Claude Boch', 'CAEN', 'France', '14000', '2'),
(20, 3, 'CS-LANE', 'rue de la république', 'ELBEUF', 'France', '76500', '16'),
(21, 3, 'De Rijke Normandie', 'Quai des Roches', 'Dieppalle Croiset', 'France', '76380', '37'),
(22, 3, 'Département de la Seine-Maritime', 'Quai Jean Moulin', 'Rouen', 'France', '76101', '0'),
(23, 3, 'DIGIACTIF', 'route de Neufchâtel', 'BOIS GUILLAUME', 'France', '76230', '1207'),
(24, 3, 'DOCAPOSTE', 'Rue Antoine Laurent de Lavoisier', 'SOTTEVILLE LES ROUEN', 'France', '76300', '1-2bis'),
(25, 3, 'ENOVEA', 'rue Jacques Monod', 'Mont-Saint-Aignan', 'France', '76130', '16'),
(26, 3, 'ESI ROUEN DGFIP', 'rue des mouettes', 'Mont Saint Aignan', 'France', '76130', '4'),
(27, 3, 'HELPEVIA', 'avenue de Bretagne', 'Rouen', 'France', '76000', '98'),
(28, 3, 'Hoki-Doki XEFI ROUEN', 'route de Paris', 'Franqueville Saint Pierre', 'France', '76520', '833'),
(29, 5, 'IAD INFORMATIQUE', 'Gare d\'Acquigny B.P. 9', 'Acquigny', 'France', '27400', '0'),
(30, 3, 'IFA Marcel Sauvage', 'rue du Tronquet', 'Mont Saint Aignan', 'France', '76130', '11'),
(31, 3, 'Interfas SAS', 'Rue Charles CROS', 'Louviers', 'France', '27400', '0'),
(32, 3, 'Mairie de Darnétal', 'Place du général de Gaulle', 'Darnétal', 'France', '76000', '0'),
(33, 3, 'Mairie de Rouen', 'Place du Général de GAULLE', 'ROUEN', 'France', '76000', '0'),
(34, 3, 'Marie de Franquiville Saint Pierre', 'rue de la République', 'Franqueville Saint Pierre', 'France', '76520', '331'),
(35, 3, 'MSA Haute Normandie', 'Cité de l\'agriculture chemin de la Bretèque', 'Bois Guillaume', 'France', '76230', '0'),
(36, 3, 'N-CyP', 'Odyssée F – Avenue de Cambridge HEROUVILLE SAINT CLAIR Ou ou 82 Avenue de Thiès', 'CAEN', 'France', '76000', '4'),
(37, 3, 'Overspeed sarl', 'boulevard des Belges', 'Rouen', 'France', '76000', '53 bis'),
(38, 3, 'PEP 76', 'rue du four', 'Rouen', 'France', '76100', '3'),
(39, 3, 'Proxiad Axe Seine', 'Passage de la Luciline Immeuble A – Le Vauban', 'Rouen', 'France', '76000', '4'),
(40, 3, 'RENAULT Cléon', 'Usine Renault de Cléon Zone d’activité du Moulin 3', 'Cléon', 'France', '76410', '0'),
(41, 3, 'SAFRAN Nacelles', 'Route du Pont VIII', 'GONFREVILLE L’ORCHER', 'France', '76700', '0'),
(42, 3, 'SEGC Ouvrez l\'œil', 'Ancienne route de Duclair', 'Canteleu', 'France', '76000', '0'),
(43, 3, 'SEMINOR', 'place du Général Leclerc', 'FECAMP', 'France', '76000', '16'),
(44, 3, 'SGA Mobility ou industries', 'Rue Jean philippe Rameau B6 Pôle Delta', 'Rouen', 'France', '76000', '27'),
(45, 3, 'SOWEBO', 'rue Jean Jaurès', 'Brionne', 'France', '27800', '31'),
(46, 3, 'TELLUX', 'Rue Aristide Briand', 'PETIT-COURONNE', 'France', '27800', '72'),
(47, 10, 'TIMAX', 'rue eustache de la queriere', 'Rouen', 'France', '76000', '31'),
(48, 3, 'Toshiba TEC Europe Imaging Systems', 'Rue Louis Berliot Neuville Les Dieppe', 'Dieppe', 'France', '76000', '0'),
(49, 11, 'TOTAL ENERGIES', 'Voie industrielle', 'Gonfreville L’Orcher', 'France', '76700', '0'),
(50, 12, 'TRANSDEV (Ex TCAR)', 'rue de la Petite Chartreuse CS 60099 76 002 ROUEN Cedex 1', 'ROUEN', 'France', '76002', '15'),
(51, 3, 'YETIC', 'rue Jeanne d\'Arc', 'Rouen', 'France', '76000', '77');

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id`, `nom`, `prenom`, `specialisation`) VALUES
(1, 'MERAT', 'Guillaume', ''),
(2, 'SODOYER', 'Killian', ''),
(3, 'Lavigne', 'Alexis', ''),
(4, 'MOREL', 'Thomas', ''),
(5, 'PONS', 'Tristan', ''),
(6, 'PUNTILLO', 'Anthony', ''),
(7, 'GRANDSIRE', 'Martin', ''),
(8, 'BOUKHORISSA', 'Bilal', ''),
(9, 'PETIT', 'Tom',''),
(10, 'PEDOUSSANT', 'Timéo',''),
(11, 'GODON', 'Corentin',''),
(12, 'COEURDOUX', 'Carl',''),
(13, 'DELATTRE', 'Louis',''),
(14, 'Billet', 'Tom',''),
(15, 'TAFFIN', 'Enzo',''),
(16, 'MORAND', 'Anthony',''),
(17, 'HAMOUDI', 'Noé',''),
(18, 'FERRAND', 'Robin',''),
(19, 'HOUZET', 'William',''),
(20, 'PIETRZAK', 'Tom',''),
(21, 'DELAPLACE', 'Hugo',''),
(22, 'Jean', 'Mathéo',''),
(23, 'Gougeon-Petit', 'Emile',''),
(24, 'ROULAND', 'Joryce',''),
(25, 'PERICA', 'Quentin',''),
(26, 'LEBERQUIER', 'Dorian',''),
(27, 'AUBRIL', 'Melvin',''),
(28, 'Billet', 'Tom',''),
(29, 'Philippe', 'Julien',''),
(30, 'LEDUC', 'Noam',''),
(31, 'PIRES BETO', 'Carlos',''),
(32, 'Boutin', 'Thomas',''),
(33, 'Rabbi', 'Omayma',''),
(34, 'Tirard', 'Lucas',''),
(35, 'Sodoyer', 'Killian',''),
(36, 'De Brabander', 'Hugo',''),
(37, 'Pires Beito', 'Carlos',''),
(38, 'Vievielle', 'Ethan',''),
(39, 'MARY', 'Killian',''),
(40, 'GARCIN', 'Thomas',''),
(41, 'DEROEUX', 'Gabriel',''),
(42, 'MOREL', 'Mathias',''),
(43, 'FOLLET', 'Yaroslav',''),
(44, 'LEFRANCOIS', 'Timothée',''),
(45, 'Martins Ribeiro', 'Paolo',''),
(46, 'LIMA', 'Yohan', 'SLAM');


--
-- Déchargement des données de la table `professionelle`
--

INSERT INTO `professionelle` (`id`, `nom`, `prenom`, `email`, `num_tel`, `metier`) VALUES
(43, 'Jourdan', 'Sophie', 'sjourdan@3ddentalstore.fr', '0230322403', 'DRH'),
(44, 'Marcotte', 'Guillaume', 'gmarcotte3ds@3ddentalstore.fr', '0230322403', 'NULL'),
(45, 'Vernier', 'Sebastien', 'sebastien.vernier@altitudeinfra.fr', '0636456737', 'CP SI'),
(46, 'LEPETIT', 'Coralie', 'clepetit@yeska.fr', '0788220848', 'Chargée de recrutement'),
(47, 'TROUVE', 'Florian', 'ftrouve@yeska.fr', '0232095784', 'Responsable Supply Chain'),
(48, 'MAZE', 'Kévin', 'kevin.maze@lepredelabataille.fr', '0630377810', 'Technicien informatique'),
(49, 'Henry', 'Frédéric', 'f.henry-cs@attineos.com', '0235764739', 'Directeur de projets'),
(50, 'LUTHIN', 'Sébastien', 's.lhutin@attineos.com', '0695600011', 'Resp du centre de service'),
(51, 'Chaloine', 'Marion', 'm.chaloine@attineos.com', 'NULL', 'Resp RH'),
(52, 'BAZIN', 'Nikhil', 'n.bazin@attineos-cyber.com', '0235641016', 'Directeur Technique'),
(53, 'Leonard', 'Mr', 'NULL', '0637412053', 'NULL'),
(54, 'SAVIO', 'Mikaël', 'NULL', 'NULL', 'Directeur'),
(55, 'ALVES', 'David', 'david.alves@carsat-normandie.fr', '0235036059', 'Tuteur Responsable Adjoint Informatique Régionale'),
(56, 'RICOUARD', 'Hubert', 'hubert.ricouard@carsat-normandie.fr', '0235035801', 'MSSI'),
(57, 'DEMARLY', 'Antoine', 'ademarly@cciproductions.fr', '0232094218', 'Développeur'),
(58, 'LE DENMAT', 'Jean-Marc', 'jean-marc.le-denmat@chb.unicancer.fr', '0232082209', 'Directeur des Systèmes d’Information'),
(59, 'BENATIA', 'Mohamed Amin', 'mbenatia@cesi.fr', '0763499411', 'Enseignant chercheur'),
(60, 'BORGIALI', 'M.', 'dborgiali@cma-normandie.fr', '0231532580', 'NULL'),
(61, 'BELLANGER', 'Bertrand', 'NULL', 'NULL', 'Président'),
(62, 'CANU', 'Philippe', 'philippe.canu@seinemaritime.fr', 'NULL', 'NULL'),
(63, 'DELIME', 'Jean', 'jean.delime@seinemaritime.fr', 'NULL', 'NULL'),
(64, 'MAUGER', 'Dominique', 'dominique,mauger@seinemaritime.fr', '0276516524', 'NULL'),
(65, 'LACROIX', 'Christophe', 'christophe.lacroix@seinemaritime.fr', '0235035574', 'Chef de Projet'),
(66, 'LETOUIT', 'Johan', 'johan.l@digiactif.fr', '0278770337', 'NULL'),
(67, 'BERNIERE', 'Vincent', 'vincent.berniere@docaposte.fr', '0672511824', 'Développeur'),
(68, 'Vauzelle', 'Sarah', 'sarah.vauzelle@enovea.net', '0232182200', 'Chef de projet'),
(69, 'Neel', 'Thibault', 'thibault.neel@enovea.net', 'NULL', 'NULL'),
(70, 'DETROIS', 'Mme', 'laurence.detrois@dgfip.finances.gouv.fr', 'NULL', 'NULL'),
(71, 'DALMONT', 'Jean marc', 'jean_marc.dalmont@dgfip.finances.gouv.fr', '0622353750', 'Inspecteur divisionnaire'),
(72, 'FOULON', 'Mickael', 'mickael.foulon@dgfip.finances.gouv.fr', '0235523591', 'NULL'),
(73, 'DESCHAMPS', 'Nicolas', 'Nicolas.DESCHAMPS@helpevia.fr', '0232818092', 'CP'),
(74, 'Hojnacki', 'Mr', 's.hojnacki@xefi.fr', '0232877348', 'NULL'),
(75, 'Hojnacki', 'Mme', 'valerie@hokidoki.fr', 'NULL', 'NULL'),
(76, 'AUZOU', 'Nicolas', 'n.auzou@iad-bat.com', '0232507888', 'NULL'),
(77, 'CORDIER', 'Magalie', 'administratif@iad-bat.com', '0677686191', 'Assistante de direction'),
(78, 'WILLEMS', 'Gautier', 'g.willems@iad-bat.com', '0232507888', 'Responsable Pole logiciel'),
(79, 'LEPAGNOL', 'Mr Olivier', 'olivier.lepagnol@ifa-rouen.fr', 'NULL', 'Administrateur Système et Réseau'),
(80, 'Vatelier', 'Catherine', 'catherine.vatelier@darnetal.fr', '0235082937', 'Responsable Service Informatique'),
(81, 'BISSON', 'Mr Frédéric', 'frederic.bisson@rouen.fr', '0235086942', 'webMaster'),
(82, 'DEDIEU', 'M. Pierre', 'pierre.dedieu@rouen.fr', '0235088637', 'NULL'),
(83, 'Goulay', 'Christophe', 'info.tel@franquevillesaintpierre.com', '0235802039', 'Resp info et téléphonie informatique'),
(84, 'HICHOUR', 'Khalid', 'hichour@khalid@hautenormandie.msa.fr', '0232987240', 'Responsable Informatique'),
(85, 'FELIX', 'Emmanuelle', 'emmanuelle.felix@totalenergies.com', '0235116062', 'Adjointe département maintenance'),
(86, 'HENRY', 'Arnaud', 'arnaud.henry@transdev.com', 'NULL', 'Chargé d\'Exploitation du SI Tcar'),
(87, 'LOUIS', 'Florent', 'Florent.louis@transdev.com', '0235525244', 'Responsable Support Utilisateurs'),
(88, 'MOREL', 'Stéphane', 'NULL', '0620430560', 'Resp. Infra numérique'),
(89, 'Bonnet', 'Fabrice', 'fabrice.bonnet@yetic.org', '0627343906', 'CEO'),
(90, 'RAMMACH', 'Hassan', 'h.rammach@proxiad.com', '0232081141', 'Ingénieur Etudes et Développements'),
(91, 'LAMY', 'Julien', 'j.lamy@proxiad.com', '0232081141', 'Ingénieur Etudes et Développements'),
(92, 'ROUDAUT', 'François-Joseph', 'francois-joseph.roudaut@tellux.fr', 'NULL', 'Ingénieur DATA'),
(93, 'Lherminier', 'Vincent', 'v.lherminier@timax-sig.fr', '0479490404', 'NULL'),
(94, 'BOUDEREAUX', 'Alexis', 'aboudereaux@toshiba-teis.com', '0235061035', 'Responsable maintenance'),
(95, 'Lerouly', 'Thierry', 'thierry.lerouy@totalenergies.com', '0235116346', 'NULL'),
(96, 'FELIX', 'Emmanuelle', 'emmanuelle.felix@totalenergies.com', '0235116062', 'Adjointe département maintenance'),
(97, 'HENRY', 'Arnaud', 'arnaud.henry@transdev.com', 'NULL', 'Chargé d\'Exploitation du SI Tcar'),
(98, 'LOUIS', 'Florent', 'Florent.louis@transdev.com', '0235525244', 'Responsable Support Utilisateurs'),
(99, 'MOREL', 'Stéphane', 'NULL', '0620430560', 'Resp. Infra numérique'),
(100, 'Bonnet', 'Fabrice', 'fabrice.bonnet@yetic.org', '0627343906', 'CEO');

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `labelle`) VALUES
(1, 'Administrateur'),
(2, 'Enseignant');

--
-- Déchargement des données de la table `specialisation`
--

INSERT INTO `specialisation` (`id`, `labelle`) VALUES
(3, '1SIO SLAM'),
(4, '2SIO SLAM'),
(5, '1SIO SISR'),
(6, '2SIO SISR'),
(7, 'Alternant');

--
-- Déchargement des données de la table `stage`
--

INSERT INTO `stage` (`id`, `entreprise_id`, `date`, `niveau`) VALUES
(1, 10, '2022', 'SLAM'),
(2, 10, '2024', 'SLAM'),
(3, 8, '2024', 'SISR'),
(4, 12, '2023', 'SISR'),
(5, 13, '2023', 'SLAM'),
(6, 15, '2024', 'SLAM'),
(7, 16, '2023', 'SLAM'),
(8, 17, '2023', 'SISR'),
(9, 17, '2024', 'SISR'),
(10, 18, '2023', 'SLAM'),
(11, 18, '2024', 'SLAM'),
(12, 19, '2023', 'SISR');

--
-- Déchargement des données de la table `jury`
--

INSERT INTO `jury` (`id`, `date`) VALUES
(1, '2023'),
(2, '2024'),
(3, '2022');

--
-- Déchargement des données de la table `etudiant_stage`
--

INSERT INTO `etudiant_stage` (`etudiant_id`, `stage_id`) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 3),
(5, 5),
(6, 4),
(7, 6),
(8, 7),
(9, 8),
(10, 9),
(11, 10),
(11, 11),
(12, 12);

--
-- Déchargement des données de la table `professionelle_stage`
--

INSERT INTO `professionelle_stage` (`professionelle_id`, `stage_id`) VALUES
(45, 1),
(45, 2),
(46, 3),
(47, 3),
(49, 5),
(50, 5),
(51, 5),
(52, 4),
(53, 4),
(54, 6),
(55, 6),
(56, 6),
(57, 7),
(58, 8),
(58, 9),
(59, 10),
(59, 11),
(60, 12);

--
-- Déchargement des données de la table `specialisation_entreprise`
--

INSERT INTO `specialisation_entreprise` (`specialisation_id`, `entreprise_id`) VALUES
(3, 9),
(3, 11),
(3, 12),
(3, 15),
(3, 16),
(3, 18),
(3, 19),
(3, 22),
(3, 23),
(3, 26),
(3, 29),
(3, 33),
(3, 36),
(3, 37),
(3, 41),
(3, 42),
(3, 43),
(3, 44),
(3, 45),
(3, 46),
(3, 48),
(3, 49),
(3, 50),
(4, 9),
(4, 10),
(4, 12),
(4, 13),
(4, 15),
(4, 16),
(4, 18),
(4, 19),
(4, 22),
(4, 24),
(4, 25),
(4, 26),
(4, 27),
(4, 29),
(4, 33),
(4, 36),
(4, 37),
(4, 39),
(4, 40),
(4, 41),
(4, 42),
(4, 43),
(4, 44),
(4, 45),
(4, 46),
(4, 48),
(4, 49),
(4, 50),
(4, 51),
(5, 8),
(5, 9),
(5, 11),
(5, 12),
(5, 16),
(5, 17),
(5, 18),
(5, 22),
(5, 23),
(5, 26),
(5, 28),
(5, 29),
(5, 30),
(5, 32),
(5, 33),
(5, 34),
(5, 35),
(5, 42),
(5, 43),
(5, 44),
(5, 45),
(5, 47),
(5, 48),
(5, 49),
(5, 50),
(6, 8),
(6, 9),
(6, 10),
(6, 12),
(6, 16),
(6, 17),
(6, 18),
(6, 22),
(6, 25),
(6, 26),
(6, 27),
(6, 28),
(6, 29),
(6, 30),
(6, 32),
(6, 33),
(6, 34),
(6, 35),
(6, 39),
(6, 40),
(6, 42),
(6, 43),
(6, 44),
(6, 45),
(6, 47),
(6, 48),
(6, 49),
(6, 50),
(7, 9),
(7, 10),
(7, 11),
(7, 17),
(7, 24),
(7, 25),
(7, 36),
(7, 43),
(7, 44),
(7, 51);

--
-- Déchargement des données de la table `jury_professionelle`
--

INSERT INTO `jury_professionelle` (`jury_id`, `professionelle_id`) VALUES
(1, 44),
(1, 50),
(1, 52),
(1, 56),
(1, 57),
(1, 60),
(1, 73),
(1, 79),
(1, 91),
(1, 92),
(1, 95),
(2, 45),
(2, 48),
(2, 56),
(2, 58),
(2, 65),
(2, 66),
(2, 69),
(2, 72),
(2, 78),
(2, 80),
(2, 81),
(2, 88),
(2, 93),
(2, 96),
(2, 99),
(3, 58),
(3, 95);

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `role_id`, `username`, `password`, `email`) VALUES
(1, 1, 'admin', '$2y$10$FeDWfRDrhdStJ6i0KCxSSurYtlKOtaaOmPchtkyDt/DvhLbV1oVm6', 'admin@localhost'),
(2, 2, 'ens', '$2y$10$oIbDsZRi1cZ6WLSOkvTOyOmbETS.eSzFXVTvFHnK4Im.PJ4i8rZZW', 'ens@localhost');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
