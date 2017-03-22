-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 22 Mars 2017 à 17:06
-- Version du serveur :  5.6.15-log
-- Version de PHP :  5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `bachelor_bdd`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `ID_Client` bigint(20) NOT NULL AUTO_INCREMENT,
  `Porteur_Projet` varchar(50) DEFAULT NULL,
  `Adresse` varchar(100) DEFAULT NULL,
  `Telephone` varchar(20) DEFAULT NULL,
  `Mail` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID_Client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `etape`
--

CREATE TABLE IF NOT EXISTS `etape` (
  `ID_Etape` bigint(20) NOT NULL AUTO_INCREMENT,
  `Libelle_Etape` varchar(100) DEFAULT NULL,
  `Descriptif_Etape` varchar(300) DEFAULT NULL,
  `Debut_Etape` date DEFAULT NULL,
  `Fin_Etape` date DEFAULT NULL,
  `ID_Projet` bigint(20) NOT NULL,
  PRIMARY KEY (`ID_Etape`),
  KEY `FK_ETAPE_ID_Projet` (`ID_Projet`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `finance`
--

CREATE TABLE IF NOT EXISTS `finance` (
  `ID_Client` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID_Projet` bigint(20) NOT NULL,
  `Budget` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_Client`,`ID_Projet`),
  KEY `FK_FINANCE_ID_Projet` (`ID_Projet`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

CREATE TABLE IF NOT EXISTS `projet` (
  `ID_Projet` bigint(20) NOT NULL AUTO_INCREMENT,
  `Libelle_Projet` varchar(50) DEFAULT NULL,
  `Nature` varchar(100) DEFAULT NULL,
  `Debut_Projet` date DEFAULT NULL,
  `Fin_Projet` date DEFAULT NULL,
  PRIMARY KEY (`ID_Projet`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `synthese`
--

CREATE TABLE IF NOT EXISTS `synthese` (
  `ID_Synthese` bigint(20) NOT NULL AUTO_INCREMENT,
  `Notes` varchar(300) DEFAULT NULL,
  `ID_Projet` bigint(20) NOT NULL,
  PRIMARY KEY (`ID_Synthese`),
  KEY `FK_SYNTHESE_ID_Projet` (`ID_Projet`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `travaille`
--

CREATE TABLE IF NOT EXISTS `travaille` (
  `ID_Utilisateur` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID_Projet` bigint(20) NOT NULL,
  `Fonction_primaire` varchar(30) DEFAULT NULL,
  `Fonction_secondaire` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_Utilisateur`,`ID_Projet`),
  KEY `FK_TRAVAILLE_ID_Projet` (`ID_Projet`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `ID_Utilisateur` bigint(20) NOT NULL AUTO_INCREMENT,
  `Login` varchar(30) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_Utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `etape`
--
ALTER TABLE `etape`
  ADD CONSTRAINT `FK_ETAPE_ID_Projet` FOREIGN KEY (`ID_Projet`) REFERENCES `projet` (`ID_Projet`);

--
-- Contraintes pour la table `finance`
--
ALTER TABLE `finance`
  ADD CONSTRAINT `FK_FINANCE_ID_Projet` FOREIGN KEY (`ID_Projet`) REFERENCES `projet` (`ID_Projet`),
  ADD CONSTRAINT `FK_FINANCE_ID_Client` FOREIGN KEY (`ID_Client`) REFERENCES `client` (`ID_Client`);

--
-- Contraintes pour la table `synthese`
--
ALTER TABLE `synthese`
  ADD CONSTRAINT `FK_SYNTHESE_ID_Projet` FOREIGN KEY (`ID_Projet`) REFERENCES `projet` (`ID_Projet`);

--
-- Contraintes pour la table `travaille`
--
ALTER TABLE `travaille`
  ADD CONSTRAINT `FK_TRAVAILLE_ID_Projet` FOREIGN KEY (`ID_Projet`) REFERENCES `projet` (`ID_Projet`),
  ADD CONSTRAINT `FK_TRAVAILLE_ID_Utilisateur` FOREIGN KEY (`ID_Utilisateur`) REFERENCES `utilisateur` (`ID_Utilisateur`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
