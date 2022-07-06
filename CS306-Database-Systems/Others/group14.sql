-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 15 Ara 2020, 19:19:52
-- Sunucu sürümü: 10.1.38-MariaDB
-- PHP Sürümü: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `group14`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `account`
--

CREATE TABLE `account` (
  `account_id` int(11) NOT NULL,
  `passwrd` char(20) DEFAULT NULL,
  `mail` char(20) NOT NULL,
  `discount_points` float DEFAULT NULL,
  `is_loyal` tinyint(1) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `buy`
--

CREATE TABLE `buy` (
  `purchase_date` date DEFAULT NULL,
  `ticket_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `campaign`
--

CREATE TABLE `campaign` (
  `campaign_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `percentage` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `campaign`
--

INSERT INTO `campaign` (`campaign_id`, `company_id`, `percentage`) VALUES
(0, 0, 20),
(1, 1, 25),
(2, 2, 15),
(3, 8, 20),
(4, 5, 5),
(5, 6, 50),
(6, 7, 20),
(7, 3, 10),
(8, 9, 15),
(9, 4, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `company`
--

INSERT INTO `company` (`company_id`, `company_name`) VALUES
(9, 'American Airlines'),
(6, 'Anadolu Jet'),
(4, 'Emirates'),
(2, 'Frontier'),
(3, 'Onurair'),
(1, 'Pegasus'),
(7, 'Qatar Airways'),
(8, 'Swiss air'),
(0, 'Turkish Airlines'),
(5, 'United Airlines');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `destination_has`
--

CREATE TABLE `destination_has` (
  `location` char(20) DEFAULT NULL,
  `place_to_stay` char(20) DEFAULT NULL,
  `place_to_eat` char(20) DEFAULT NULL,
  `place_to_visit` char(20) DEFAULT NULL,
  `transportation_easiness` char(20) DEFAULT NULL,
  `ticket_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `frequent_ticket`
--

CREATE TABLE `frequent_ticket` (
  `update_price` int(11) NOT NULL,
  `frequent` tinyint(1) DEFAULT NULL,
  `ticket_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `has`
--

CREATE TABLE `has` (
  `account_id` int(11) NOT NULL,
  `since` date DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `ticket_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `non_frequent_ticket`
--

CREATE TABLE `non_frequent_ticket` (
  `update_price` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `frequent` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `points_of_interest`
--

CREATE TABLE `points_of_interest` (
  `ticket_id` int(11) NOT NULL,
  `place_to_visit` varchar(30) DEFAULT NULL,
  `place_to_eat` varchar(30) DEFAULT NULL,
  `place_to_stay` char(100) DEFAULT NULL,
  `transportation_easiness` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `shopping_history`
--

CREATE TABLE `shopping_history` (
  `account_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `purchase_date` date DEFAULT NULL,
  `ticeket_seat_no` int(11) NOT NULL,
  `company_name` char(20) DEFAULT NULL,
  `ticket_price` float NOT NULL,
  `ticket_from` char(30) NOT NULL,
  `ticket_to` char(30) NOT NULL,
  `flight_time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `seat_no` int(11) DEFAULT NULL,
  `frequency` float DEFAULT NULL,
  `flight_time` date DEFAULT NULL,
  `startpoint` char(20) DEFAULT NULL,
  `destination` char(20) DEFAULT NULL,
  `ticket_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `warn`
--

CREATE TABLE `warn` (
  `frequent` tinyint(1) DEFAULT NULL,
  `account_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_id`,`mail`);

--
-- Tablo için indeksler `buy`
--
ALTER TABLE `buy`
  ADD PRIMARY KEY (`account_id`,`ticket_id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Tablo için indeksler `campaign`
--
ALTER TABLE `campaign`
  ADD UNIQUE KEY `campaign_id` (`campaign_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Tablo için indeksler `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`),
  ADD UNIQUE KEY `company_id` (`company_id`),
  ADD UNIQUE KEY `company_name` (`company_name`);

--
-- Tablo için indeksler `destination_has`
--
ALTER TABLE `destination_has`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Tablo için indeksler `frequent_ticket`
--
ALTER TABLE `frequent_ticket`
  ADD PRIMARY KEY (`update_price`,`ticket_id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Tablo için indeksler `has`
--
ALTER TABLE `has`
  ADD PRIMARY KEY (`account_id`,`ticket_id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Tablo için indeksler `non_frequent_ticket`
--
ALTER TABLE `non_frequent_ticket`
  ADD PRIMARY KEY (`update_price`,`ticket_id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Tablo için indeksler `points_of_interest`
--
ALTER TABLE `points_of_interest`
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Tablo için indeksler `shopping_history`
--
ALTER TABLE `shopping_history`
  ADD PRIMARY KEY (`account_id`,`ticket_id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Tablo için indeksler `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Tablo için indeksler `warn`
--
ALTER TABLE `warn`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `frequent` (`frequent`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `account`
--
ALTER TABLE `account`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `buy`
--
ALTER TABLE `buy`
  ADD CONSTRAINT `buy_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `buy_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `campaign`
--
ALTER TABLE `campaign`
  ADD CONSTRAINT `campaign_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `destination_has`
--
ALTER TABLE `destination_has`
  ADD CONSTRAINT `destination_has_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `frequent_ticket`
--
ALTER TABLE `frequent_ticket`
  ADD CONSTRAINT `frequent_ticket_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `has`
--
ALTER TABLE `has`
  ADD CONSTRAINT `has_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `has_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `non_frequent_ticket`
--
ALTER TABLE `non_frequent_ticket`
  ADD CONSTRAINT `non_frequent_ticket_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `points_of_interest`
--
ALTER TABLE `points_of_interest`
  ADD CONSTRAINT `points_of_interest_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`);

--
-- Tablo kısıtlamaları `shopping_history`
--
ALTER TABLE `shopping_history`
  ADD CONSTRAINT `shopping_history_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `shopping_history_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `warn`
--
ALTER TABLE `warn`
  ADD CONSTRAINT `warn_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
