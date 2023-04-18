-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 18 Kwi 2023, 15:52
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `cms_ss`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `liked`
--


--
-- Zrzut danych tabeli `liked`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `post`
--

CREATE TABLE `post` (
  `ID` int(11) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `filename` varchar(1024) NOT NULL,
  `memeTitle` text NOT NULL,
  `removed` tinyint(1) NOT NULL DEFAULT 0,
  `userID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `post`
--

INSERT INTO `post` (`ID`, `timestamp`, `filename`, `memeTitle`,`removed`, `userID`) VALUES
(1, '2023-03-22 15:42:32', 'img/3d0bd3a087fa34f851bb8a09faf9953ca45539a9f431487790757dce746c3b19.webp', 'geg', 0, 3),
(2, '2023-04-18 15:52:30', 'img/de24df4fb7905c761db67f2dabacb595921efc78930d6733198acfd7996887ad.webp', 'hhh', 0, 3),
(3, '2023-04-18 15:44:54', 'img/12e21262e73f23f6c4949198282f262c2f560c2dccc70806fa15847ff4d081a7.webp', 'hree', 0, 3),
(4, '2023-04-18 15:44:26', 'img/d670b467c5735f5e1dc38c0288a2eaf2298770b2877868c2507dba8d64f493bd.webp', 'essa123123', 0, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`ID`, `email`, `password`) VALUES
(1, 'Sebaskiba1@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$NU02Z1d3NkRZbnhVUWNISg$8EMlLvEyjgmoBqGa92jObgT/CWd1j6EFlqWi09sCgqU'),
(2, 'geg@geg.crf', '$argon2i$v=19$m=65536,t=4,p=1$TTlNa0JmY3ZYblRwTlNhdA$09rR0RIjHxEYW5ZHrmtQ1G0anfx+p6r8s01JJdQuDmg'),
(3, 'a@a.a', '$argon2i$v=19$m=65536,t=4,p=1$eDhpRmowVTlMeHFxcy9MSg$9P8ok0tkSKqtnZTx6+w4uQvhUaaH8vaJ2mGsll0fZbs'),
(4, 'q@q.q', '$argon2i$v=19$m=65536,t=4,p=1$LmRLVHdWTEJFMTFsTTV1RQ$DmbCzK+Eu26ydq6wDskyQgWX9p9GB3ooOt/pbQK22og'),
(5, 'z@z.z', '$argon2i$v=19$m=65536,t=4,p=1$TXcvYUhOb2R3eUNSMFBsMA$yGB2s8oAz4vbevA0Bt4rj97t+ctVUltsuZruP5YqhVo');

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
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `post`
--
ALTER TABLE `post`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;