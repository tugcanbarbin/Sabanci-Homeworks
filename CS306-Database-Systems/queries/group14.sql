-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 27 Ara 2020, 13:24:49
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
-- Veritabanı: `submitlenen`
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

--
-- Tablo döküm verisi `account`
--

INSERT INTO `account` (`account_id`, `passwrd`, `mail`, `discount_points`, `is_loyal`, `latitude`, `longitude`) VALUES
(0, 'mypass', 'mymail@gmail', 0, 0, 41.7896, 34.7976),
(1, 'mypass1', 'mymail1@gmail', 0, 0, 41.7896, 34.7976),
(2, 'mypass2', 'mymail2@gmail', 0, 0, 41.7896, 34.7976),
(3, 'mypass3', 'mymail3@gmail', 0, 0, 41.7896, 34.7976),
(4, 'mypass4', 'mymail4@gmail', 1, 0, 41.7896, 34.7976),
(5, 'mypass5', 'mymail5@gmail', 1, 0, 41.7896, 34.7976),
(6, 'mypass6', 'mymail6@gmail', 0, 0, 41.7896, 34.7976),
(7, 'mypass7', 'mymail7@gmail', 1, 0, 41.7896, 34.7976),
(8, 'mypass8', 'mymail8@gmail', 0, 0, 41.7896, 34.7976),
(9, 'mypass9', 'mymail9@gmail', 0, 0, 41.7896, 34.7976),
(10, 'mypass10', 'mymail10@gmail', 0, 0, 41.7896, 34.7976),
(11, 'mypass11', 'mymail11@gmail', 0, 0, 41.7896, 34.7976),
(12, 'mypass12', 'mymail12@gmail', 0, 0, 41.7896, 34.7976),
(13, 'mypass1', 'mymail13@gmail', 0, 0, 41.7896, 34.7976),
(14, 'mypass14', 'mymail14@gmail', 0, 0, 41.7896, 34.7976);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `buy`
--

CREATE TABLE `buy` (
  `purchase_date` date DEFAULT NULL,
  `ticket_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `buy`
--

INSERT INTO `buy` (`purchase_date`, `ticket_id`, `account_id`) VALUES
('2019-06-04', 1, 4),
('2020-06-18', 2, 11),
('2020-07-14', 3, 4),
('2016-07-15', 4, 2),
('2020-09-16', 5, 12),
('2020-10-07', 6, 9),
('2020-07-16', 7, 8),
('2020-10-02', 8, 13),
('2020-01-09', 9, 7),
('2017-04-11', 10, 5),
('2019-11-06', 11, 5),
('2020-12-18', 12, 14),
('2020-10-13', 13, 7),
('2018-05-02', 14, 3),
('2020-08-06', 15, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `campaign`
--

CREATE TABLE `campaign` (
  `campaign_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `percentage` int(11) DEFAULT '0',
  `flight_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `campaign`
--

INSERT INTO `campaign` (`campaign_id`, `company_id`, `percentage`, `flight_id`) VALUES
(0, 0, 20, 0),
(1, 1, 25, 10),
(2, 2, 15, 12),
(3, 8, 20, 11),
(4, 5, 5, 8),
(5, 6, 50, 2),
(6, 7, 20, 7),
(7, 3, 10, 4),
(8, 9, 15, 6),
(9, 4, 3, 0),
(10, 10, 10, -1),
(11, 11, 30, -1),
(12, 12, 5, -1),
(13, 14, 10, -1),
(14, 13, 7, -1);

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
(13, 'Air France'),
(9, 'American Airlines'),
(6, 'Anadolu Jet'),
(14, 'Asiana Airlines'),
(4, 'Emirates'),
(2, 'Frontier'),
(12, 'Japan Airlines'),
(11, 'Lufthansa'),
(3, 'Onurair'),
(1, 'Pegasus'),
(7, 'Qatar Airways'),
(10, 'Singapore Airlines'),
(8, 'Swiss air'),
(0, 'Turkish Airlines'),
(5, 'United Airlines');

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

--
-- Tablo döküm verisi `points_of_interest`
--

INSERT INTO `points_of_interest` (`ticket_id`, `place_to_visit`, `place_to_eat`, `place_to_stay`, `transportation_easiness`) VALUES
(0, 'Tour Guide', 'inflight service', 'contracted hotel 1 night', 'baggage handling'),
(1, 'small tour in transfer city', NULL, 'contracted hotel 1 night', NULL),
(2, 'small tour in transfer city', NULL, 'contracted hotel 2 night', 'baggage handling'),
(3, 'small tour in transfer city', NULL, 'contracted hotel 48', 'baggage handling'),
(4, 'Tour Guide', 'fastfood ticket', 'contracted hotel 1 night', 'baggage handling'),
(5, 'Tour guide 12', 'fastfood ticket', NULL, 'baggage handling'),
(6, 'Tour Guide', 'fastfood ticket', NULL, NULL),
(7, NULL, 'fastfood ticket', 'contracted hotel 1 night', 'service in city'),
(8, NULL, 'fastfood ticket', 'contracted hotel 2 night', 'service in city'),
(10, 'Tour Guide', NULL, NULL, 'service in city'),
(11, 'Tour Guide', 'inflight service', NULL, NULL),
(12, 'Tour Guide', NULL, 'contracted hotel 1 night', 'service in city'),
(13, 'Tour Guide', 'inflight service', NULL, 'service in city'),
(14, 'Tour Guide', 'fastfood ticket', NULL, NULL),
(15, 'Tour Guide', 'inflight service', NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `shopping_history`
--

CREATE TABLE `shopping_history` (
  `account_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `purchase_date` date DEFAULT NULL,
  `ticket_seat_no` int(11) DEFAULT NULL,
  `company_name` varchar(20) DEFAULT NULL,
  `ticket_price` float DEFAULT NULL,
  `ticket_from` char(30) DEFAULT NULL,
  `ticket_to` char(30) DEFAULT NULL,
  `ticket_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `shopping_history`
--

INSERT INTO `shopping_history` (`account_id`, `ticket_id`, `purchase_date`, `ticket_seat_no`, `company_name`, `ticket_price`, `ticket_from`, `ticket_to`, `ticket_date`) VALUES
(1, 15, '2020-08-06', 5, 'Swiss air', 300, 'Izmir', 'Istanbul', '2020-12-25'),
(2, 4, '2016-07-15', 89, 'Onurair', 750, 'Usak', 'Sivas', '2021-04-13'),
(3, 14, '2018-05-02', 176, 'Frontier', 6250, 'Istanbul', 'Denver', '2021-01-13'),
(4, 1, '2020-10-02', 78, 'Turkish Airlines', 240, 'Konya', 'Trabzon', '2021-07-04'),
(4, 3, '2019-06-04', 65, 'Turkish Airlines', 350, 'Antalya', 'Istanbul', '2021-07-04'),
(5, 10, '2017-04-11', 89, 'Qatar Airways', 1700, 'Ankara', 'Doha', '2021-08-02'),
(5, 11, '2019-11-06', 17, 'Pegasus', 600, 'Sinop', 'Mersin', '2021-08-25'),
(7, 9, '2020-01-09', 177, 'United Airlines', 5500, 'Istanbul', 'Los_Angeles', '2021-01-10'),
(7, 13, '2020-10-13', 50, 'Swiss air', 300, 'Izmir', 'Istanbul', '2020-12-25'),
(8, 7, '2020-07-16', 255, 'Turkish Airlines', 2500, 'Londra', 'Istanbul', '2021-02-02'),
(9, 6, '2020-10-07', 19, 'American Airlines', 3750, 'New_York', 'Ankara', '2021-01-01'),
(11, 2, '2020-06-18', 37, 'Anadolu Jet', 350, 'Samsun', 'Ankara', '2021-03-12'),
(12, 5, '2020-09-16', 49, 'Onurair', 500, 'Istanbul', 'Hatay', '2020-12-28'),
(13, 8, '2020-10-02', 122, 'Qatar Airways', 1000, 'Doha', 'Paris', '2021-01-18'),
(14, 12, '2020-12-18', 17, 'Swiss air', 300, 'Izmir', 'Istanbul', '2020-12-25');

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
  `flight_id` int(11) NOT NULL,
  `ticket_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `ticket`
--

INSERT INTO `ticket` (`ticket_id`, `company_id`, `seat_no`, `frequency`, `flight_time`, `startpoint`, `destination`, `flight_id`, `ticket_price`) VALUES
(0, 0, 10, 0.1, '2021-02-02', 'Londra', 'Istanbul', 0, 2500),
(1, 0, 78, 0, '2021-07-04', 'Konya', 'Trabzon', 1, 240),
(2, 6, 37, 0, '2021-03-12', 'Samsun', 'Ankara', 2, 350),
(3, 0, 65, 0, '2021-07-04', 'Antalya', 'Istanbul', 3, 350),
(4, 3, 89, 0, '2021-04-13', 'Usak', 'Sivas', 4, 750),
(5, 3, 49, 0, '2020-12-28', 'Istanbul', 'Hatay', 5, 500),
(6, 9, 19, 0, '2021-01-01', 'New_York', 'Ankara', 6, 3750),
(7, 0, 255, 0.1, '2021-02-02', 'Londra', 'Istanbul', 0, 2500),
(8, 7, 122, 0, '2021-01-18', 'Doha', 'Paris', 7, 1000),
(9, 5, 177, 0, '2021-01-10', 'Istanbul', 'Los_Angeles', 8, 5500),
(10, 7, 89, 0, '2021-08-02', 'Ankara', 'Doha', 9, 1700),
(11, 1, 17, 0, '2021-08-25', 'Sinop', 'Mersin', 10, 600),
(12, 8, 17, 0.3, '2020-12-25', 'Izmir', 'Istanbul', 11, 300),
(13, 8, 50, 0.3, '2020-12-25', 'Izmir', 'Istanbul', 11, 300),
(14, 2, 176, 0, '2021-01-13', 'Istanbul', 'Denver', 12, 6250),
(15, 8, 5, 0.3, '2020-12-25', 'Izmir', 'Istanbul', 11, 300);

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
  ADD PRIMARY KEY (`ticket_id`) USING BTREE,
  ADD KEY `account_id` (`account_id`),
  ADD KEY `purchase_date` (`purchase_date`);

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
-- Tablo için indeksler `points_of_interest`
--
ALTER TABLE `points_of_interest`
  ADD UNIQUE KEY `ticket_id` (`ticket_id`) USING BTREE;

--
-- Tablo için indeksler `shopping_history`
--
ALTER TABLE `shopping_history`
  ADD PRIMARY KEY (`account_id`,`ticket_id`),
  ADD UNIQUE KEY `ticket_id` (`ticket_id`) USING BTREE,
  ADD KEY `purchase_date` (`purchase_date`);

--
-- Tablo için indeksler `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `account`
--
ALTER TABLE `account`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `buy`
--
ALTER TABLE `buy`
  ADD CONSTRAINT `buy_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `buy_ibfk_3` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);

--
-- Tablo kısıtlamaları `campaign`
--
ALTER TABLE `campaign`
  ADD CONSTRAINT `campaign_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `shopping_history_ibfk_2` FOREIGN KEY (`purchase_date`) REFERENCES `buy` (`purchase_date`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shopping_history_ibfk_3` FOREIGN KEY (`ticket_id`) REFERENCES `buy` (`ticket_id`);

--
-- Tablo kısıtlamaları `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `campaign` (`company_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
