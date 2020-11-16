-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 16 2020 г., 15:30
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `countries-name`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cities`
--

CREATE TABLE `cities` (
  `id` int(255) NOT NULL,
  `Name_cities` varchar(20) NOT NULL,
  `Name_region` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cities`
--

INSERT INTO `cities` (`id`, `Name_cities`, `Name_region`) VALUES
(0, 'Belogorsk', 'Amurska'),
(1, 'Blagoveshchensk', 'Amurska'),
(2, 'Borispol', 'Kyivska'),
(3, 'Donetsk', 'Donetska'),
(4, 'Gatchina', 'Leningradska'),
(5, 'Kyiv', 'Kyivska'),
(6, 'Luga', 'Leningradska'),
(7, 'Makeevka', 'Donetska'),
(8, 'Mariupol\'', 'Donetska'),
(9, 'Sankt_Peterburg', 'Leningradska'),
(10, 'Tinda', 'Amurska'),
(11, 'Zitomyr', 'Kyivska');

-- --------------------------------------------------------

--
-- Структура таблицы `countries`
--

CREATE TABLE `countries` (
  `id` int(255) NOT NULL,
  `Name_country` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `countries`
--

INSERT INTO `countries` (`id`, `Name_country`) VALUES
(0, 'Russia'),
(1, 'Ukraine');

-- --------------------------------------------------------

--
-- Структура таблицы `regions`
--

CREATE TABLE `regions` (
  `id` int(255) NOT NULL,
  `Name_region` varchar(20) NOT NULL,
  `Name_country` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `regions`
--

INSERT INTO `regions` (`id`, `Name_region`, `Name_country`) VALUES
(0, 'Amurska', 'Russia'),
(1, 'Donetska', 'Ukraine'),
(2, 'Kyivska', 'Ukraine'),
(3, 'Leningradska', 'Russia');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`Name_cities`),
  ADD KEY `cities_fk0` (`Name_region`);

--
-- Индексы таблицы `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`Name_country`);

--
-- Индексы таблицы `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`Name_region`),
  ADD KEY `regions_fk0` (`Name_country`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_fk0` FOREIGN KEY (`Name_region`) REFERENCES `regions` (`Name_region`);

--
-- Ограничения внешнего ключа таблицы `regions`
--
ALTER TABLE `regions`
  ADD CONSTRAINT `regions_fk0` FOREIGN KEY (`Name_country`) REFERENCES `countries` (`Name_country`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
