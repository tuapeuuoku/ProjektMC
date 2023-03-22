-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 22 Mar 2023, 14:09
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `post`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `TimeStamp` datetime NOT NULL,
  `FileName` varchar(255) NOT NULL,
  `Tytuł` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `post`
--

INSERT INTO `post` (`id`, `timestamp`, `filename`) VALUES
(3, '2023-02-15 14:20:50', '88d543ad78927fb9b9474fe5de6e0ea630dfe05683f953cb9eb7b866807e3616'),
(4, '2023-02-15 14:20:57', '2fa0e2865cf594d737dd257ab21354c8f51d6ecd3a515a6230add5c4e6c36a95'),
(5, '2023-02-15 14:50:05', '6414e3962d091c4a6ac4f46f9acdf65d021aa853445b4ceb621a2919d1c01874'),
(6, '2023-02-15 15:05:04', 'c9945d42b6c8cbf1eaa83800fb72da45d6f37ea4ac63d5029463caca2ef88a4f'),
(7, '2023-03-08 10:16:34', '301dc2a4d719d26341a723d0888d35530ecceafa6e6233670660e50eee99cbec.webp'),
(8, '2023-03-08 10:17:30', '9f89f820ec42c14df2d3d36b4c022a4fbfc2ba17708c917a96ae0769d34e7a05.webp');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
