-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2024 at 04:15 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `absence`
--

-- --------------------------------------------------------

--
-- Table structure for table `absence`
--

CREATE TABLE `absence` (
  `ID_Absence` int(11) NOT NULL,
  `Date_Absence` date DEFAULT current_timestamp(),
  `Entrée_matin` varchar(20) DEFAULT 'حاضر',
  `Entrée_soir` varchar(20) DEFAULT 'حاضر',
  `Sortie_matin` varchar(20) DEFAULT 'حاضر',
  `Sortie_soir` varchar(20) DEFAULT 'حاضر',
  `IDétudient` int(11) DEFAULT NULL,
  `IDbus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `absence`
--

INSERT INTO `absence` (`ID_Absence`, `Date_Absence`, `Entrée_matin`, `Entrée_soir`, `Sortie_matin`, `Sortie_soir`, `IDétudient`, `IDbus`) VALUES
(1, '2024-05-19', 'حاضر', 'حاضر', 'حاضر', 'حاضر', 2, 2),
(2, '2024-05-17', 'حاضر', 'حاضر', 'حاضر', 'حاضر', 4, 5),
(3, '2024-05-21', 'حاضر', 'حاضر', 'حاضر', 'حاضر', 4, 3),
(4, '2024-05-21', 'حاضر', 'حاضر', 'حاضر', 'حاضر', 2, 3),
(5, '2024-05-20', 'حاضر', 'حاضر', 'حاضر', 'حاضر', 4, 4),
(6, '2024-05-20', 'حاضر', 'حاضر', 'حاضر', 'حاضر', 4, 4),
(7, '2024-05-21', 'حاضر', 'حاضر', 'حاضر', 'حاضر', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `bus_scolaire`
--

CREATE TABLE `bus_scolaire` (
  `ID_bus` int(11) NOT NULL,
  `Numéro_de_bus` int(11) DEFAULT NULL,
  `IdChauffeur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus_scolaire`
--

INSERT INTO `bus_scolaire` (`ID_bus`, `Numéro_de_bus`, `IdChauffeur`) VALUES
(2, 16, 5),
(3, 15, 4),
(4, 20, 3),
(5, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `etudient`
--

CREATE TABLE `etudient` (
  `ID_étudient` int(11) NOT NULL,
  `Nom_complet` varchar(100) DEFAULT NULL,
  `niveau_étude` varchar(250) DEFAULT NULL,
  `IdBus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `etudient`
--

INSERT INTO `etudient` (`ID_étudient`, `Nom_complet`, `niveau_étude`, `IdBus`) VALUES
(2, 'حمدي التوباليdfg', 'الاولى ابتدائي', 4),
(4, 'haitam', 'الاولى ابتدائي', 5);

-- --------------------------------------------------------

--
-- Table structure for table `responsable_des_transports`
--

CREATE TABLE `responsable_des_transports` (
  `ID_responsable` int(11) NOT NULL,
  `User_R` varchar(100) DEFAULT NULL,
  `PWD_R` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `responsable_des_transports`
--

INSERT INTO `responsable_des_transports` (`ID_responsable`, `User_R`, `PWD_R`) VALUES
(1, 'Mustapha1984', 'Mustapha2014');

-- --------------------------------------------------------

--
-- Table structure for table `responsable_du_bus_scolaire`
--

CREATE TABLE `responsable_du_bus_scolaire` (
  `ID_chauffeur` int(11) NOT NULL,
  `nom_chauffeur` varchar(100) DEFAULT NULL,
  `User_C` varchar(100) DEFAULT NULL,
  `PWD_C` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `responsable_du_bus_scolaire`
--

INSERT INTO `responsable_du_bus_scolaire` (`ID_chauffeur`, `nom_chauffeur`, `User_C`, `PWD_C`) VALUES
(3, 'Mike Johnsonmm', 'mike_johnson', 'securepasss5'),
(4, 'مبارك حمدي', 'مبارك12', 'مبارك123'),
(5, 'haitamgdfg', 'sdfsdf', 'vvb454');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absence`
--
ALTER TABLE `absence`
  ADD PRIMARY KEY (`ID_Absence`),
  ADD KEY `RAE` (`IDétudient`),
  ADD KEY `RAB` (`IDbus`);

--
-- Indexes for table `bus_scolaire`
--
ALTER TABLE `bus_scolaire`
  ADD PRIMARY KEY (`ID_bus`),
  ADD KEY `RBR` (`IdChauffeur`);

--
-- Indexes for table `etudient`
--
ALTER TABLE `etudient`
  ADD PRIMARY KEY (`ID_étudient`),
  ADD KEY `REB` (`IdBus`);

--
-- Indexes for table `responsable_des_transports`
--
ALTER TABLE `responsable_des_transports`
  ADD PRIMARY KEY (`ID_responsable`);

--
-- Indexes for table `responsable_du_bus_scolaire`
--
ALTER TABLE `responsable_du_bus_scolaire`
  ADD PRIMARY KEY (`ID_chauffeur`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absence`
--
ALTER TABLE `absence`
  MODIFY `ID_Absence` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bus_scolaire`
--
ALTER TABLE `bus_scolaire`
  MODIFY `ID_bus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `etudient`
--
ALTER TABLE `etudient`
  MODIFY `ID_étudient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `responsable_des_transports`
--
ALTER TABLE `responsable_des_transports`
  MODIFY `ID_responsable` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `responsable_du_bus_scolaire`
--
ALTER TABLE `responsable_du_bus_scolaire`
  MODIFY `ID_chauffeur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absence`
--
ALTER TABLE `absence`
  ADD CONSTRAINT `RAB` FOREIGN KEY (`IDbus`) REFERENCES `bus_scolaire` (`ID_bus`),
  ADD CONSTRAINT `RAE` FOREIGN KEY (`IDétudient`) REFERENCES `etudient` (`ID_étudient`);

--
-- Constraints for table `bus_scolaire`
--
ALTER TABLE `bus_scolaire`
  ADD CONSTRAINT `RBR` FOREIGN KEY (`IdChauffeur`) REFERENCES `responsable_du_bus_scolaire` (`ID_chauffeur`);

--
-- Constraints for table `etudient`
--
ALTER TABLE `etudient`
  ADD CONSTRAINT `REB` FOREIGN KEY (`IdBus`) REFERENCES `bus_scolaire` (`ID_bus`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
