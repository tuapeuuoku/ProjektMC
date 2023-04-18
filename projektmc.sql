-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 29 Mar 2023, 13:46
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
-- Baza danych: `projektmc`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `post`
--

CREATE TABLE `post` (
  `ID` int(64) NOT NULL,
  `TimeStamp` datetime NOT NULL,
  `FileName` varchar(98) NOT NULL,
  `memeTitle` text NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `post`
--

INSERT INTO `post` (`ID`, `TimeStamp`, `FileName`, `memeTitle`, `userID`) VALUES
(32, '2023-03-01 14:55:00', 'img/3d0bd3a087fa34f851bb8a09faf9953ca45539a9f431487790757dce746c3b19.webp', '', 1),
(33, '2023-03-01 14:57:36', 'img/de24df4fb7905c761db67f2dabacb595921efc78930d6733198acfd7996887ad.webp', '', 2),
(34, '2023-03-01 14:59:03', 'img/12e21262e73f23f6c4949198282f262c2f560c2dccc70806fa15847ff4d081a7.webp', '', 3),
(35, '2023-03-08 15:08:30', 'img/d670b467c5735f5e1dc38c0288a2eaf2298770b2877868c2507dba8d64f493bd.webp', '', 4),
(36, '2023-03-08 15:19:40', 'img/a02326096067788837c0cb29d4ac7e7611f0cdc1f72919a8faad3e9f37f50045.webp', '', 5),
(37, '2023-03-08 15:20:48', 'img/5058acc94d52bed04d490a752166f331b42440fb8894075ecbbb7f6444d27feb.webp', '', 6),
(38, '2023-03-08 15:21:03', 'img/ac1ede0f727174eda4934426689bd230f17b7ac448e6adb26bf4d9cebbba30be.webp', '', 7),
(39, '2023-03-08 15:36:01', 'img/b6393cce89b6fa48f14a5784e14d63d80b1f5d6174cfa5263b3c8a3369f890a0.webp', '', 8),
(40, '2023-03-15 14:22:54', 'img/948cba1543b893d90eb835008b7bad8b7fe1092c873ad0f8cf4fb28cca09252b.webp', 'Podaj Tytul mema', 9),
(41, '2023-03-15 14:23:27', 'img/c174ab3ed6ebc467e2fbb2c02ecb921365d708f77afc01ecbe5bd95e28ae1194.webp', 'Podaj Tytul mema', 10),
(42, '2023-03-15 14:42:24', 'img/f87e510ca9d18de45b3ecf02ddf4be9c79cc1257c716e1355282768c312ecf8b.webp', 'Działa', 11);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`ID`, `email`, `password`) VALUES
(1, 'TAK@wp.pl', 'TAK'),
(2, 'DUPA@wp.pl', 'tak');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `post`
--
ALTER TABLE `post`
  MODIFY `ID` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
