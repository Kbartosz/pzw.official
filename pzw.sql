-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2025 at 02:18 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pzw`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `czlonkowie`
--

CREATE TABLE `czlonkowie` (
  `id` int(11) NOT NULL,
  `imie` varchar(50) NOT NULL,
  `nazwisko` varchar(50) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `haslo` varchar(20) NOT NULL,
  `wiek` int(11) NOT NULL,
  `nr_kola` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `czlonkowie`
--

INSERT INTO `czlonkowie` (`id`, `imie`, `nazwisko`, `mail`, `haslo`, `wiek`, `nr_kola`) VALUES
(1, 'Jan', 'Kowalski', 'jan.kowalski@example.com', 'haslo123', 55, 1),
(2, 'Anna', 'Nowak', 'anna.nowak@example.com', 'bezpieczneHaslo456', 66, 2),
(3, 'Piotr', 'Wiśniewski', 'piotr.wisniewski@example.com', 'tajneHaslo789', 77, 1),
(4, 'Katarzyna', 'Jankowska', 'katarzyna.jankowska@example.com', 'superHaslo321', 88, 3),
(5, 'Marek', 'Zieliński', 'marek.zielinski@example.com', 'trudneHaslo654', 99, 4),
(6, 'Ewa', 'Lewandowska', 'ewa.lewandowska@example.com', 'hasloTestowe987', 33, 2),
(7, 'Tomasz', 'Lis', 'tomasz.lis@example.com', 'sekretHaslo432', 22, 3),
(8, 'Zofia', 'Pawlak', 'zofia.pawlak@example.com', 'noweHaslo321', 44, 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gatunki`
--

CREATE TABLE `gatunki` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kola`
--

CREATE TABLE `kola` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) DEFAULT NULL,
  `nr_okregu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `kola`
--

INSERT INTO `kola` (`id`, `nazwa`, `nr_okregu`) VALUES
(1, 'Koło Wędkarskie „Wisła”', 2),
(2, 'Koło Wędkarskie „Mazury”', 1),
(3, 'Koło Wędkarskie „Łyna”', 3),
(4, 'Koło Wędkarskie „Bzura”', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kontroler`
--

CREATE TABLE `kontroler` (
  `id` int(11) NOT NULL,
  `imie` varchar(50) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `lata_doswiadczneia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `mandat`
--

CREATE TABLE `mandat` (
  `id` int(11) NOT NULL,
  `kwota` int(11) DEFAULT NULL,
  `nr_kontrolera` int(11) DEFAULT NULL,
  `nr_czlonka` int(11) DEFAULT NULL,
  `nr_stawu_kontroli` int(11) DEFAULT NULL,
  `przyczyna` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `okregi`
--

CREATE TABLE `okregi` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `okregi`
--

INSERT INTO `okregi` (`id`, `nazwa`) VALUES
(1, 'Okręg Mazowiecki'),
(2, 'Okręg Małopolski'),
(3, 'Okręg Warmińsko-Mazurski');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oplaty`
--

CREATE TABLE `oplaty` (
  `id` int(11) NOT NULL,
  `ilosc` int(11) DEFAULT NULL,
  `id_czlonka` int(11) DEFAULT NULL,
  `_znizka` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rekordy`
--

CREATE TABLE `rekordy` (
  `id` int(11) NOT NULL,
  `waga` int(11) DEFAULT NULL,
  `dlugosc` int(11) DEFAULT NULL,
  `staw` int(11) DEFAULT NULL,
  `ryba` int(11) DEFAULT NULL,
  `id_czlonka` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ryby`
--

CREATE TABLE `ryby` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) DEFAULT NULL,
  `okres_ochronny` date DEFAULT NULL,
  `gatunek` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `staw`
--

CREATE TABLE `staw` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) DEFAULT NULL,
  `miasto` varchar(50) DEFAULT NULL,
  `ulica` varchar(50) DEFAULT NULL,
  `nr_ulicy` int(11) DEFAULT NULL,
  `nr_kola` int(11) DEFAULT NULL,
  `typ_stawu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `staw`
--

INSERT INTO `staw` (`id`, `nazwa`, `miasto`, `ulica`, `nr_ulicy`, `nr_kola`, `typ_stawu`) VALUES
(1, 'Staw „Słoneczko”', 'Kraków', 'Ogrodowa', 5, 1, 2),
(2, 'Staw „Zielona Laguna”', 'Warszawa', 'Stawowa', 12, 2, 1),
(3, 'Staw „Cichy Kącik”', 'Olsztyn', 'Leśna', 8, 3, 3),
(4, 'Staw „Błękitne Oczko”', 'Nowy Sącz', 'Jeziorna', 2, 4, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `turnieje`
--

CREATE TABLE `turnieje` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(20) DEFAULT NULL,
  `nagroda` int(11) DEFAULT NULL,
  `ilosc_czlonkow` int(11) DEFAULT NULL,
  `data_wyd` date DEFAULT NULL,
  `zwyciezca` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `turnieje`
--

INSERT INTO `turnieje` (`id`, `nazwa`, `nagroda`, `ilosc_czlonkow`, `data_wyd`, `zwyciezca`) VALUES
(1, 'Turniej Wędkarski „Z', 500, 50, '2025-06-15', 1),
(2, 'Turniej „Szczupak Ro', 1000, 40, '2025-05-10', 2),
(3, 'Zawody „Król Wody”', 4000, 30, '2024-09-01', 3),
(4, 'Turniej „Wędkarski M', 50000, 35, '2025-07-20', 4),
(5, 'Zawody „Największy K', 1000000, 25, '2024-08-15', 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `typ_stawu`
--

CREATE TABLE `typ_stawu` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `typ_stawu`
--

INSERT INTO `typ_stawu` (`id`, `nazwa`) VALUES
(1, 'hodowlany'),
(2, 'rekreacyjny'),
(3, 'wedkarski');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zarybienia`
--

CREATE TABLE `zarybienia` (
  `id` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `ilosc` int(11) DEFAULT NULL,
  `koszt` int(11) DEFAULT NULL,
  `staw` int(11) DEFAULT NULL,
  `ryby` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `znizki`
--

CREATE TABLE `znizki` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(20) DEFAULT NULL,
  `rabat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `czlonkowie`
--
ALTER TABLE `czlonkowie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nr_kola` (`nr_kola`);

--
-- Indeksy dla tabeli `gatunki`
--
ALTER TABLE `gatunki`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `kola`
--
ALTER TABLE `kola`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nr_okregu` (`nr_okregu`);

--
-- Indeksy dla tabeli `kontroler`
--
ALTER TABLE `kontroler`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `mandat`
--
ALTER TABLE `mandat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nr_kontrolera` (`nr_kontrolera`),
  ADD KEY `nr_stawu_kontroli` (`nr_stawu_kontroli`),
  ADD KEY `nr_czlonka` (`nr_czlonka`);

--
-- Indeksy dla tabeli `okregi`
--
ALTER TABLE `okregi`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `oplaty`
--
ALTER TABLE `oplaty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `_znizka` (`_znizka`),
  ADD KEY `id_czlonka` (`id_czlonka`);

--
-- Indeksy dla tabeli `rekordy`
--
ALTER TABLE `rekordy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ryba` (`ryba`),
  ADD KEY `id_czlonka` (`id_czlonka`),
  ADD KEY `staw` (`staw`);

--
-- Indeksy dla tabeli `ryby`
--
ALTER TABLE `ryby`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gatunek` (`gatunek`);

--
-- Indeksy dla tabeli `staw`
--
ALTER TABLE `staw`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nr_okregu` (`nr_kola`),
  ADD KEY `typ_stawu` (`typ_stawu`);

--
-- Indeksy dla tabeli `turnieje`
--
ALTER TABLE `turnieje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zwyciezca` (`zwyciezca`);

--
-- Indeksy dla tabeli `typ_stawu`
--
ALTER TABLE `typ_stawu`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `zarybienia`
--
ALTER TABLE `zarybienia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staw` (`staw`),
  ADD KEY `ryby` (`ryby`);

--
-- Indeksy dla tabeli `znizki`
--
ALTER TABLE `znizki`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `czlonkowie`
--
ALTER TABLE `czlonkowie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `gatunki`
--
ALTER TABLE `gatunki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kola`
--
ALTER TABLE `kola`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kontroler`
--
ALTER TABLE `kontroler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mandat`
--
ALTER TABLE `mandat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `okregi`
--
ALTER TABLE `okregi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oplaty`
--
ALTER TABLE `oplaty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rekordy`
--
ALTER TABLE `rekordy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ryby`
--
ALTER TABLE `ryby`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staw`
--
ALTER TABLE `staw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `turnieje`
--
ALTER TABLE `turnieje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `typ_stawu`
--
ALTER TABLE `typ_stawu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `zarybienia`
--
ALTER TABLE `zarybienia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `znizki`
--
ALTER TABLE `znizki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `czlonkowie`
--
ALTER TABLE `czlonkowie`
  ADD CONSTRAINT `czlonkowie_ibfk_1` FOREIGN KEY (`nr_kola`) REFERENCES `kola` (`id`);

--
-- Constraints for table `kola`
--
ALTER TABLE `kola`
  ADD CONSTRAINT `kola_ibfk_1` FOREIGN KEY (`nr_okregu`) REFERENCES `okregi` (`id`),
  ADD CONSTRAINT `rel_prob` FOREIGN KEY (`nr_okregu`) REFERENCES `okregi` (`id`);

--
-- Constraints for table `mandat`
--
ALTER TABLE `mandat`
  ADD CONSTRAINT `mandat_ibfk_1` FOREIGN KEY (`nr_kontrolera`) REFERENCES `kontroler` (`id`),
  ADD CONSTRAINT `mandat_ibfk_2` FOREIGN KEY (`nr_stawu_kontroli`) REFERENCES `staw` (`id`),
  ADD CONSTRAINT `mandat_ibfk_3` FOREIGN KEY (`nr_czlonka`) REFERENCES `czlonkowie` (`id`);

--
-- Constraints for table `oplaty`
--
ALTER TABLE `oplaty`
  ADD CONSTRAINT `oplaty_ibfk_1` FOREIGN KEY (`_znizka`) REFERENCES `znizki` (`id`),
  ADD CONSTRAINT `oplaty_ibfk_2` FOREIGN KEY (`id_czlonka`) REFERENCES `czlonkowie` (`id`);

--
-- Constraints for table `rekordy`
--
ALTER TABLE `rekordy`
  ADD CONSTRAINT `rekordy_ibfk_1` FOREIGN KEY (`staw`) REFERENCES `staw` (`id`),
  ADD CONSTRAINT `rekordy_ibfk_2` FOREIGN KEY (`ryba`) REFERENCES `ryby` (`id`),
  ADD CONSTRAINT `rekordy_ibfk_3` FOREIGN KEY (`id_czlonka`) REFERENCES `czlonkowie` (`id`),
  ADD CONSTRAINT `rekordy_ibfk_4` FOREIGN KEY (`staw`) REFERENCES `staw` (`id`),
  ADD CONSTRAINT `rekordy_ibfk_5` FOREIGN KEY (`staw`) REFERENCES `staw` (`id`),
  ADD CONSTRAINT `rekordy_ibfk_6` FOREIGN KEY (`staw`) REFERENCES `staw` (`id`);

--
-- Constraints for table `ryby`
--
ALTER TABLE `ryby`
  ADD CONSTRAINT `ryby_ibfk_1` FOREIGN KEY (`gatunek`) REFERENCES `gatunki` (`id`);

--
-- Constraints for table `staw`
--
ALTER TABLE `staw`
  ADD CONSTRAINT `staw_ibfk_2` FOREIGN KEY (`typ_stawu`) REFERENCES `typ_stawu` (`id`),
  ADD CONSTRAINT `staw_ibfk_3` FOREIGN KEY (`nr_kola`) REFERENCES `kola` (`id`);

--
-- Constraints for table `turnieje`
--
ALTER TABLE `turnieje`
  ADD CONSTRAINT `turnieje_ibfk_1` FOREIGN KEY (`zwyciezca`) REFERENCES `czlonkowie` (`id`);

--
-- Constraints for table `zarybienia`
--
ALTER TABLE `zarybienia`
  ADD CONSTRAINT `zarybienia_ibfk_1` FOREIGN KEY (`staw`) REFERENCES `staw` (`id`),
  ADD CONSTRAINT `zarybienia_ibfk_2` FOREIGN KEY (`ryby`) REFERENCES `ryby` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
