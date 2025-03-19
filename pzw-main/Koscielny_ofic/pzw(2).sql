-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2025 at 01:04 AM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

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
  `imie` varchar(50) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `wiek` int(11) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `haslo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gatunki`
--

CREATE TABLE `gatunki` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) DEFAULT NULL
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

--
-- Dumping data for table `ryby`
--

INSERT INTO `ryby` (`id`, `nazwa`, `okres_ochronny`, `gatunek`) VALUES
(1, 'Szczupak', '0000-00-00', 0),
(2, 'Karp', '0000-00-00', 0),
(3, 'Sum', '0000-00-00', 0),
(4, 'Sandacz', '0000-00-00', 0),
(5, 'Leszcz', '0000-00-00', 0),
(6, 'Pstrąg potokowy', '0000-00-00', 0),
(7, 'Węgorz', '0000-00-00', 0),
(8, 'Troć wędrowna', '0000-00-00', 0),
(9, 'Okoń', '0000-00-00', 0),
(10, 'Lin', '0000-00-00', 0);

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
  `nr_okregu` int(11) DEFAULT NULL,
  `typ_stawu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `staw`
--

INSERT INTO `staw` (`id`, `nazwa`, `miasto`, `ulica`, `nr_ulicy`, `nr_okregu`, `typ_stawu`) VALUES
(1, 'Staw Rybacki', 'Gliwice', 'Leśna', 12, 1, 0),
(2, 'Zalew Sportowy', 'Katowice', 'Słoneczna', 8, 2, 0),
(3, 'Łowisko Główne', 'Zabrze', 'Wędkarska', 15, 3, 0),
(4, 'Staw Karpowy', 'Ruda Śląska', 'Rybna', 5, 1, 0),
(5, 'Małe Łowisko', 'Bytom', 'Szuwarowa', 22, 2, 0),
(6, 'Staw Złoty', 'Tychy', 'Zielona', 33, 4, 0),
(7, 'Łowisko Sumowe', 'Sosnowiec', 'Brzegowa', 7, 5, 0),
(8, 'Staw Cichy', 'Chorzów', 'Leśniczówka', 10, 3, 0),
(9, 'Zbiornik Głęboki', 'Mysłowice', 'Podgórska', 18, 2, 0),
(10, 'Łowisko Okoniowe', 'Dąbrowa Górnicza', 'Błękitna', 25, 4, 0);

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

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `typ_stawu`
--

CREATE TABLE `typ_stawu` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

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
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `nr_okregu` (`nr_okregu`),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gatunki`
--
ALTER TABLE `gatunki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kola`
--
ALTER TABLE `kola`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `staw`
--
ALTER TABLE `staw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `turnieje`
--
ALTER TABLE `turnieje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `typ_stawu`
--
ALTER TABLE `typ_stawu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- Constraints for table `kola`
--
ALTER TABLE `kola`
  ADD CONSTRAINT `kola_ibfk_1` FOREIGN KEY (`nr_okregu`) REFERENCES `okregi` (`id`);

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
