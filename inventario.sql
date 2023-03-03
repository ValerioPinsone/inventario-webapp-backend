-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mar 03, 2023 alle 09:51
-- Versione del server: 10.4.24-MariaDB
-- Versione PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventario`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `bucket`
--

CREATE TABLE `bucket` (
  `bucket_id` int(11) NOT NULL,
  `bucket_name` varchar(255) NOT NULL,
  `bucket_desc` text NOT NULL DEFAULT 'n/d',
  `bucket_creation` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `bucket`
--

INSERT INTO `bucket` (`bucket_id`, `bucket_name`, `bucket_desc`, `bucket_creation`) VALUES
(1, 'Frandi\'s Bucket', 'Bucket', '2023-03-01 14:12:16');

-- --------------------------------------------------------

--
-- Struttura della tabella `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `gategory_name` varchar(255) NOT NULL,
  `category_desc` varchar(255) NOT NULL DEFAULT 'n/d'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `category`
--

INSERT INTO `category` (`category_id`, `gategory_name`, `category_desc`) VALUES
(1, 'Nessuna Categoria', 'Nessuna Categoria');

-- --------------------------------------------------------

--
-- Struttura della tabella `product`
--

CREATE TABLE `product` (
  `product_id` bigint(20) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_desc` text NOT NULL DEFAULT 'n/d',
  `product_quantity` int(11) NOT NULL DEFAULT 0,
  `product_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `product_category_id` int(11) NOT NULL,
  `product_bucket_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_desc`, `product_quantity`, `product_creation`, `product_category_id`, `product_bucket_id`) VALUES
(1, 'Cavi 2x71', 'Cavi 2x3', 25, '2023-03-01 14:31:10', 1, 1),
(2, 'Cavi 2x3', 'Cavi 2x3', 2, '2023-03-01 14:32:17', 1, 1),
(3, 'Cavi 2x6', 'Cavi 2x6', 23, '2023-03-01 14:32:17', 1, 1),
(4, 'Tubo Alluminio', 'Tubo di alluminio spesso', 17, '2023-03-01 14:32:17', 1, 1),
(5, 'Pannello plexiglass', 'Pannello trasparente', 4, '2023-03-01 14:32:17', 1, 1);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `bucket`
--
ALTER TABLE `bucket`
  ADD PRIMARY KEY (`bucket_id`);

--
-- Indici per le tabelle `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indici per le tabelle `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `bucket`
--
ALTER TABLE `bucket`
  MODIFY `bucket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `product`
--
ALTER TABLE `product`
  MODIFY `product_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
