-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 13 mai 2020 à 01:04
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `headenclouds`
--

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirmation_token` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_account` datetime DEFAULT NULL,
  `reset_token` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `remember_token` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `confirmation_token`, `date_account`, `reset_token`, `reset_at`, `remember_token`) VALUES
(38, 'popo', 'popo@popo.fr', '$2y$10$GIFCXUtoeldhNydxVrYCYO7JHC7Hxa30eLs4ZCQvgPmdaSIEnj0KW', NULL, '2020-05-10 20:41:53', '0', NULL, NULL),
(39, 'qs', 'qs@sq.fd', '$2y$10$GIFCXUtoeldhNydxVrYCYO7JHC7Hxa30eLs4ZCQvgPmdaSIEnj0KW', NULL, '2020-05-10 20:55:36', '0', NULL, NULL),
(40, 'thomas', 'ofeo@reoorpe.fr', '$2y$10$GIFCXUtoeldhNydxVrYCYO7JHC7Hxa30eLs4ZCQvgPmdaSIEnj0KW', NULL, '2020-05-10 21:40:36', '0', NULL, NULL),
(41, 'admin', 'admin@admin.admin', '$2y$10$GIFCXUtoeldhNydxVrYCYO7JHC7Hxa30eLs4ZCQvgPmdaSIEnj0KW', NULL, '2020-05-11 04:11:30', 'd6qHykXVwwAYYJVExFAPBJ8DtluHoGY8PZLxdgPicORoIezfw3nZP1CYkOlX', '2020-05-12 03:19:17', NULL),
(42, 'zoo', 'zoo@zoo.fr', '$2y$10$GIFCXUtoeldhNydxVrYCYO7JHC7Hxa30eLs4ZCQvgPmdaSIEnj0KW', NULL, '2020-05-11 17:29:59', '', NULL, NULL),
(43, 'singe', 'singe@singe.fr', '$2y$10$GIFCXUtoeldhNydxVrYCYO7JHC7Hxa30eLs4ZCQvgPmdaSIEnj0KW', NULL, '2020-05-12 03:22:58', 'vPi0botNijwy4vO5a8PiI01TwmEmeQgitC2jtIxVU8eCOritZIDPWsRiRmSF', '2020-05-12 03:23:16', 'NG2NKlNoVXww1vue1LbuX0SiKOiD2731nLcGW8yTSnRaO8RVbJYzshycP39ZZeChsOZ3Eb0oKaO5TqQEJC6XUnE1Eu0dqvuH3Yi861JKcjR7jRFHv4VGxsnQJpy5jgGugkTLVhdQjRktDEHK9nbrQYUlF2qssJZxXAjZ4qXfwO4rlfDVJn3ykkBx1sh1ScaTh8MUDMwx3JQGYeE5nY5Fms8TOY1DHKhqdWJSSNNHXHdEtfQLEornP8h7Tw');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
