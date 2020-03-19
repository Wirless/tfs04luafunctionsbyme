-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 19 Mar 2020, 18:25
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `ots2`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL,
  `salt` varchar(40) NOT NULL DEFAULT '',
  `premdays` int(11) NOT NULL DEFAULT 0,
  `golden_days` int(11) NOT NULL DEFAULT 0,
  `lastday` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `email` varchar(255) NOT NULL DEFAULT '',
  `creation` int(11) NOT NULL,
  `key` varchar(32) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'internal usage',
  `warnings` int(11) NOT NULL DEFAULT 0,
  `group_id` int(11) NOT NULL DEFAULT 1,
  `email_new` varchar(255) NOT NULL DEFAULT '',
  `email_new_time` int(11) NOT NULL DEFAULT 0,
  `rlname` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `page_access` int(11) NOT NULL DEFAULT 0,
  `email_code` varchar(255) NOT NULL DEFAULT '',
  `next_email` int(11) NOT NULL DEFAULT 0,
  `premium_points` int(11) NOT NULL DEFAULT 0,
  `create_date` int(11) NOT NULL DEFAULT 0,
  `create_ip` int(11) NOT NULL DEFAULT 0,
  `last_post` int(11) NOT NULL DEFAULT 0,
  `flag` varchar(80) NOT NULL DEFAULT '',
  `vote` int(11) NOT NULL,
  `remember_token` varchar(255) NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `password`, `salt`, `premdays`, `golden_days`, `lastday`, `email`, `creation`, `key`, `blocked`, `warnings`, `group_id`, `email_new`, `email_new_time`, `rlname`, `location`, `page_access`, `email_code`, `next_email`, `premium_points`, `create_date`, `create_ip`, `last_post`, `flag`, `vote`, `remember_token`, `updated_at`) VALUES
(1, '121211', '41da8bef22aaef9d7c5821fa0f0de7cccc4dda4d', '', 551, 0, 1584578894, 'a@gmail.com', 0, '', 0, 0, 1, '', 0, '', '', 0, '', 0, 0, 1545871694, 2130706433, 0, 'unknown', 0, '', '0000-00-00'),
(2, '1', '41da8bef22aaef9d7c5821fa0f0de7cccc4dda4d', '', 551, 0, 1584580786, 'hbdwahb@gmail.com', 0, '', 0, 0, 1, '', 0, '', '', 0, '', 0, 0, 1545873586, 2130706433, 0, 'unknown', 0, '', '0000-00-00'),
(3, '1212111', '41da8bef22aaef9d7c5821fa0f0de7cccc4dda4d', '', 551, 29, 1584584827, 'aojg@o2.pl', 0, '', 0, 0, 1, '', 0, '', '', 0, '', 0, 50, 1545877627, 1422597795, 0, 'ie', 0, '', '0000-00-00');

--
-- Wyzwalacze `accounts`
--
DELIMITER $$
CREATE TRIGGER `ondelete_accounts` BEFORE DELETE ON `accounts` FOR EACH ROW BEGIN



	DELETE FROM `bans` WHERE `type` IN (3, 4) AND `value` = OLD.`id`;



END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `account_viplist`
--

CREATE TABLE `account_viplist` (
  `account_id` int(11) NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL,
  `description` varchar(128) NOT NULL,
  `icon` int(11) UNSIGNED NOT NULL,
  `notify` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bans`
--

CREATE TABLE `bans` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 - ip banishment, 2 - namelock, 3 - account banishment, 4 - notation, 5 - deletion',
  `value` int(10) UNSIGNED NOT NULL COMMENT 'ip address (integer), player guid or account number',
  `param` int(10) UNSIGNED NOT NULL DEFAULT 4294967295 COMMENT 'used only for ip banishment mask (integer)',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `expires` int(11) NOT NULL,
  `added` int(10) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text NOT NULL,
  `reason` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `action` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `statement` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `country`
--

CREATE TABLE `country` (
  `country` char(2) NOT NULL,
  `points` smallint(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `deaths_in_wars`
--

CREATE TABLE `deaths_in_wars` (
  `guild_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `killer_guild` int(11) NOT NULL,
  `killer` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `result1` int(11) NOT NULL,
  `result2` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `environment_killers`
--

CREATE TABLE `environment_killers` (
  `kill_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `events`
--

CREATE TABLE `events` (
  `event` varchar(255) NOT NULL,
  `player_id` varchar(255) NOT NULL,
  `won_item` varchar(255) NOT NULL,
  `time` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `global_storage`
--

CREATE TABLE `global_storage` (
  `key` varchar(32) NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `guilds`
--

CREATE TABLE `guilds` (
  `id` int(11) NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `checkdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL,
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `guild_logo` mediumblob DEFAULT NULL,
  `create_ip` int(11) NOT NULL DEFAULT 0,
  `invited_to` int(11) NOT NULL,
  `invited_by` int(11) NOT NULL,
  `in_war_with` int(11) NOT NULL,
  `kills` int(11) NOT NULL,
  `show` smallint(1) NOT NULL,
  `war_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Wyzwalacze `guilds`
--
DELIMITER $$
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds` FOR EACH ROW BEGIN



	INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Leader', 3, NEW.`id`);



	INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Vice-Leader', 2, NEW.`id`);



	INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Member', 1, NEW.`id`);



END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ondelete_guilds` BEFORE DELETE ON `guilds` FOR EACH ROW BEGIN



	UPDATE `players` SET `guildnick` = '', `rank_id` = 0 WHERE `rank_id` IN (SELECT `id` FROM `guild_ranks` WHERE `guild_id` = OLD.`id`);



END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `guild_invites`
--

CREATE TABLE `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `guild_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `guild_kills`
--

CREATE TABLE `guild_kills` (
  `id` int(11) NOT NULL,
  `victim` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `war_id` int(11) NOT NULL,
  `death_id` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `guild_membership`
--

CREATE TABLE `guild_membership` (
  `player_id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `nick` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `guild_ranks`
--

CREATE TABLE `guild_ranks` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `level` int(11) NOT NULL COMMENT '1 - leader, 2 - vice leader, 3 - member',
  `guildjoin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `guild_wars`
--

CREATE TABLE `guild_wars` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `enemy_id` int(11) NOT NULL,
  `name1` varchar(255) NOT NULL,
  `name2` varchar(255) NOT NULL,
  `begin` bigint(20) NOT NULL DEFAULT 0,
  `end` bigint(20) NOT NULL DEFAULT 0,
  `frags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `payment` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guild_kills` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `enemy_kills` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `houses`
--

CREATE TABLE `houses` (
  `id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL,
  `paid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `warnings` int(11) NOT NULL DEFAULT 0,
  `lastwarning` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `town` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `size` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `price` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rent` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `doors` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `beds` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tiles` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `guild` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `clear` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `bid` int(11) NOT NULL DEFAULT 0,
  `highest_bidder` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `houses`
--

INSERT INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`, `bid`, `highest_bidder`) VALUES
(1, 0, 0, 0, 0, 0, 'House #1', 1, 20, 50000, 50000, 1, 0, 21, 0, 0, 0, 0),
(2, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 18, 0, 0, 0, 0),
(3, 0, 0, 0, 0, 0, 'Main Street I', 4, 15, 150, 0, 1, 0, 21, 0, 0, 0, 0),
(4, 0, 0, 0, 0, 0, 'Main Street II', 4, 15, 150, 0, 1, 0, 16, 0, 0, 0, 0),
(5, 0, 0, 0, 0, 0, 'Main Street III', 4, 15, 150, 0, 1, 0, 16, 0, 0, 0, 0),
(6, 0, 0, 0, 0, 0, 'Main Street IV', 4, 45, 450, 0, 2, 0, 51, 0, 0, 0, 0),
(7, 0, 0, 0, 0, 0, 'Temple Hall', 4, 34, 340, 0, 2, 0, 45, 0, 0, 0, 0),
(8, 0, 0, 0, 0, 0, 'house #2', 1, 40, 50000, 50000, 0, 0, 42, 0, 0, 0, 0),
(9, 0, 0, 0, 0, 0, ' House #3', 1, 9, 35000, 35000, 1, 0, 11, 0, 0, 0, 0),
(10, 0, 0, 0, 0, 0, ' House #4', 1, 15, 35000, 35000, 1, 0, 16, 0, 0, 0, 0),
(11, 0, 0, 0, 0, 0, 'North Street I', 4, 30, 300, 0, 2, 0, 50, 0, 0, 0, 0),
(12, 0, 0, 0, 0, 0, 'Upper North Street I', 4, 15, 150, 0, 1, 0, 21, 0, 0, 0, 0),
(13, 0, 0, 0, 0, 0, 'Upper North Street II', 4, 12, 120, 0, 1, 0, 13, 0, 0, 0, 0),
(14, 0, 0, 0, 0, 0, 'House #5', 1, 30, 70000, 70000, 1, 0, 50, 0, 0, 0, 0),
(15, 0, 0, 0, 0, 0, 'House #6', 1, 48, 100000, 100000, 2, 0, 54, 0, 0, 0, 0),
(16, 0, 0, 0, 0, 0, 'House #7', 1, 91, 60000, 60000, 2, 0, 117, 0, 0, 0, 0),
(17, 0, 0, 0, 0, 0, 'House #8', 1, 12, 15000, 15000, 1, 0, 13, 0, 0, 0, 0),
(18, 0, 0, 0, 0, 0, 'House #9', 1, 60, 18000, 18000, 4, 0, 73, 0, 0, 0, 0),
(19, 0, 0, 0, 0, 0, 'North Street IV', 4, 76, 760, 0, 2, 0, 120, 0, 0, 0, 0),
(20, 0, 0, 0, 0, 0, ' House #11', 1, 145, 70000, 70000, 3, 0, 178, 0, 0, 0, 0),
(21, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0),
(22, 0, 0, 0, 0, 0, 'House #13', 1, 23, 40000, 40000, 1, 0, 27, 0, 0, 0, 0),
(23, 0, 0, 0, 0, 0, 'House #14', 1, 48, 30000, 30000, 2, 0, 55, 0, 0, 0, 0),
(24, 0, 0, 0, 0, 0, 'House #15', 1, 21, 40000, 40000, 0, 0, 24, 0, 0, 0, 0),
(25, 0, 0, 0, 0, 0, 'House #16', 1, 7, 70000, 70000, 1, 0, 10, 0, 0, 0, 0),
(26, 0, 0, 0, 0, 0, 'Beach Home Apartments, Flat 15', 3, 4, 385, 385, 1, 1, 15, 0, 0, 0, 0),
(27, 0, 0, 0, 0, 0, 'House #17', 1, 51, 510, 0, 1, 0, 58, 0, 0, 0, 0),
(28, 0, 0, 0, 0, 0, ' House #19', 1, 0, 120000, 120000, 1, 0, 1, 0, 0, 0, 0),
(29, 0, 0, 0, 0, 0, ' House #22', 1, 13, 80000, 80000, 0, 0, 139, 0, 0, 0, 0),
(30, 0, 0, 0, 0, 0, ' House #23', 1, 135, 80000, 80000, 1, 0, 170, 0, 0, 0, 0),
(31, 0, 0, 0, 0, 0, 'Sorcerer\'s Avenue 1c', 3, 15, 1255, 1255, 1, 2, 36, 0, 0, 0, 0),
(32, 0, 0, 0, 0, 0, ' House #31', 1, 65, 70000, 70000, 2, 0, 80, 0, 0, 0, 0),
(33, 0, 0, 0, 0, 0, 'Unnamed House #32', 1, 44, 80000, 80000, 0, 0, 48, 0, 0, 0, 0),
(34, 0, 0, 0, 0, 0, 'Unnamed House #33', 1, 30, 40000, 40000, 0, 0, 30, 0, 0, 0, 0),
(35, 0, 0, 0, 0, 0, 'Thais Clanhall', 3, 144, 8420, 8420, 12, 10, 381, 0, 0, 0, 0),
(37, 0, 0, 0, 0, 0, 'Upper Swamp Lane 2', 3, 56, 4740, 4740, 7, 4, 156, 0, 0, 0, 0),
(38, 0, 0, 0, 0, 0, 'Upper Swamp Lane 4', 3, 56, 4740, 4740, 7, 4, 143, 0, 0, 0, 0),
(39, 0, 0, 0, 0, 0, 'Unnamed House #39', 1, 44, 50000, 50000, 1, 0, 50, 0, 0, 0, 0),
(40, 0, 0, 0, 0, 0, 'Unnamed House #40', 1, 138, 120000, 120000, 1, 0, 197, 0, 0, 0, 0),
(41, 0, 0, 0, 0, 0, 'Main House I', 1, 20, 200, 0, 1, 0, 35, 0, 0, 0, 0),
(42, 0, 0, 0, 0, 0, 'Main house II', 1, 20, 200, 0, 1, 0, 30, 0, 0, 0, 0),
(43, 0, 0, 0, 0, 0, 'Main House III', 1, 20, 200, 0, 1, 0, 34, 0, 0, 0, 0),
(44, 0, 0, 0, 0, 0, 'Unnamed House #44', 1, 15, 150, 0, 1, 0, 18, 0, 0, 0, 0),
(45, 0, 0, 0, 0, 0, 'Unnamed House #45', 1, 15, 150, 0, 1, 0, 18, 0, 0, 0, 0),
(46, 0, 0, 0, 0, 0, 'Unnamed House #46', 1, 14, 140, 0, 1, 0, 16, 0, 0, 0, 0),
(47, 0, 0, 0, 0, 0, 'Unnamed House #47', 1, 14, 140, 0, 1, 0, 16, 0, 0, 0, 0),
(48, 0, 0, 0, 0, 0, 'Unnamed House #48', 1, 60, 600, 0, 4, 0, 79, 0, 0, 0, 0),
(49, 0, 0, 0, 0, 0, 'Unnamed House #49', 1, 127, 1270, 0, 1, 0, 183, 0, 0, 0, 0),
(50, 0, 0, 0, 0, 0, 'Unnamed House #50', 1, 35, 350, 0, 1, 0, 49, 0, 0, 0, 0),
(51, 0, 0, 0, 0, 0, 'Unnamed House #51', 1, 30, 300, 0, 0, 0, 45, 0, 0, 0, 0),
(52, 0, 0, 0, 0, 0, 'Unnamed House #52', 1, 116, 1160, 0, 1, 0, 189, 0, 0, 0, 0),
(53, 0, 0, 0, 0, 0, 'Unnamed House #53', 1, 55, 550, 0, 2, 0, 78, 0, 0, 0, 0),
(54, 0, 0, 0, 0, 0, 'Unnamed House #54', 1, 43, 430, 0, 1, 0, 70, 0, 0, 0, 0),
(55, 0, 0, 0, 0, 0, 'Alai Flats, Flat 18', 3, 15, 900, 900, 2, 1, 34, 0, 0, 0, 0),
(56, 0, 0, 0, 0, 0, 'Unnamed House #56', 1, 65, 650, 0, 1, 0, 84, 0, 0, 0, 0),
(57, 0, 0, 0, 0, 0, 'Unnamed House #57', 1, 36, 360, 0, 1, 0, 49, 0, 0, 0, 0),
(58, 0, 0, 0, 0, 0, 'Unnamed House #58', 1, 30, 300, 0, 0, 0, 30, 0, 0, 0, 0),
(59, 0, 0, 0, 0, 0, 'Unnamed House #59', 1, 36, 360, 0, 0, 0, 42, 0, 0, 0, 0),
(60, 0, 0, 0, 0, 0, 'Unnamed House #60', 1, 68, 680, 0, 1, 0, 96, 0, 0, 0, 0),
(61, 0, 0, 0, 0, 0, 'Unnamed House #61', 1, 63, 630, 0, 1, 0, 84, 0, 0, 0, 0),
(62, 0, 0, 0, 0, 0, 'Unnamed House #62', 1, 67, 670, 0, 2, 0, 94, 0, 0, 0, 0),
(63, 0, 0, 0, 0, 0, 'Unnamed House #63', 1, 18, 180, 0, 1, 0, 21, 0, 0, 0, 0),
(64, 0, 0, 0, 0, 0, 'Unnamed House #64', 1, 50, 500, 0, 1, 0, 78, 0, 0, 0, 0),
(65, 0, 0, 0, 0, 0, 'Unnamed House #65', 1, 40, 400, 0, 1, 0, 56, 0, 0, 0, 0),
(66, 0, 0, 0, 0, 0, 'Unnamed House #66', 1, 20, 200, 0, 1, 0, 30, 0, 0, 0, 0),
(67, 0, 0, 0, 0, 0, 'Unnamed House #67', 1, 45, 450, 0, 2, 0, 90, 0, 0, 0, 0),
(68, 0, 0, 0, 0, 0, 'Unnamed House #68', 1, 32, 320, 0, 0, 0, 45, 0, 0, 0, 0),
(69, 0, 0, 0, 0, 0, 'Unnamed House #69', 1, 44, 440, 0, 1, 0, 60, 0, 0, 0, 0),
(70, 0, 0, 0, 0, 0, 'Unnamed House #70', 1, 27, 270, 0, 1, 0, 40, 0, 0, 0, 0),
(71, 0, 0, 0, 0, 0, 'Unnamed House #71', 1, 21, 210, 0, 1, 0, 33, 0, 0, 0, 0),
(72, 0, 0, 0, 0, 0, 'Unnamed House #72', 1, 59, 590, 0, 1, 0, 82, 0, 0, 0, 0),
(73, 0, 0, 0, 0, 0, 'Unnamed House #73', 1, 40, 400, 0, 2, 0, 66, 0, 0, 0, 0),
(74, 0, 0, 0, 0, 0, 'Unnamed House #74', 1, 535, 5350, 0, 15, 0, 919, 0, 0, 0, 0),
(75, 0, 0, 0, 0, 0, 'Unnamed House #75', 1, 145, 1450, 0, 3, 0, 225, 0, 0, 0, 0),
(76, 0, 0, 0, 0, 0, 'Unnamed House #76', 1, 33, 330, 0, 2, 0, 72, 0, 0, 0, 0),
(77, 0, 0, 0, 0, 0, 'Unnamed House #77', 1, 69, 690, 0, 2, 0, 112, 0, 0, 0, 0),
(78, 0, 0, 0, 0, 0, 'Unnamed House #78', 1, 115, 1150, 0, 1, 0, 143, 0, 0, 0, 0),
(79, 0, 0, 0, 0, 0, 'Unnamed House #79', 1, 18, 180, 0, 1, 0, 42, 0, 0, 0, 0),
(80, 0, 0, 0, 0, 0, 'Unnamed House #80', 1, 23, 230, 0, 1, 0, 42, 0, 0, 0, 0),
(81, 0, 0, 0, 0, 0, 'Unnamed House #81', 1, 28, 280, 0, 1, 0, 56, 0, 0, 0, 0),
(82, 0, 0, 0, 0, 0, 'Unnamed House #82', 1, 45, 450, 0, 2, 0, 72, 0, 0, 0, 0),
(83, 0, 0, 0, 0, 0, 'Unnamed House #83', 1, 135, 1350, 0, 2, 0, 190, 0, 0, 0, 0),
(84, 0, 0, 0, 0, 0, 'Unnamed House #84', 1, 15, 150, 0, 1, 0, 24, 0, 0, 0, 0),
(85, 0, 0, 0, 0, 0, 'Unnamed House #85', 1, 28, 280, 0, 1, 0, 40, 0, 0, 0, 0),
(86, 0, 0, 0, 0, 0, 'Unnamed House #86', 1, 36, 360, 0, 1, 0, 50, 0, 0, 0, 0),
(87, 0, 0, 0, 0, 0, 'Unnamed House #87', 1, 30, 300, 0, 1, 0, 42, 0, 0, 0, 0),
(88, 0, 0, 0, 0, 0, 'Unnamed House #88', 1, 12, 120, 0, 1, 0, 30, 0, 0, 0, 0),
(89, 0, 0, 0, 0, 0, 'Unnamed House #89', 1, 100, 1000, 0, 2, 0, 143, 0, 0, 0, 0),
(90, 0, 0, 0, 0, 0, 'The City Wall 3a', 3, 15, 1045, 1045, 1, 2, 42, 0, 0, 0, 0),
(91, 0, 0, 0, 0, 0, 'The City Wall 3b', 3, 15, 1045, 1045, 1, 2, 35, 0, 0, 0, 0),
(92, 0, 0, 0, 0, 0, 'The City Wall 3c', 3, 15, 1045, 1045, 1, 2, 35, 0, 0, 0, 0),
(93, 0, 0, 0, 0, 0, 'The City Wall 3d', 3, 16, 1045, 1045, 1, 2, 43, 0, 0, 0, 0),
(94, 0, 0, 0, 0, 0, 'The City Wall 3e', 3, 15, 1045, 1045, 1, 2, 35, 0, 0, 0, 0),
(95, 0, 0, 0, 0, 0, 'The City Wall 3f', 3, 15, 1045, 1045, 1, 2, 35, 0, 0, 0, 0),
(96, 0, 0, 0, 0, 0, 'The City Wall 1a', 3, 21, 1270, 1270, 1, 2, 49, 0, 0, 0, 0),
(97, 0, 0, 0, 0, 0, 'The City Wall 1b', 3, 20, 1270, 1270, 1, 2, 49, 0, 0, 0, 0),
(98, 0, 0, 0, 0, 0, 'Mill Avenue 3', 3, 21, 1400, 1400, 1, 2, 49, 0, 0, 0, 0),
(99, 0, 0, 0, 0, 0, 'Mill Avenue 4', 3, 20, 1400, 1400, 1, 2, 49, 0, 0, 0, 0),
(100, 0, 0, 0, 0, 0, 'Mill Avenue 5', 3, 46, 3250, 3250, 4, 4, 104, 0, 0, 0, 0),
(101, 0, 0, 0, 0, 0, 'Mill Avenue 2 (Shop)', 3, 33, 2350, 2350, 4, 2, 80, 0, 0, 0, 0),
(102, 0, 0, 0, 0, 0, 'Mill Avenue 1 (Shop)', 3, 16, 1300, 1300, 3, 1, 54, 0, 0, 0, 0),
(103, 0, 0, 0, 0, 0, 'Castle of Greenshore', 3, 247, 18860, 18860, 14, 12, 546, 0, 0, 0, 0),
(104, 0, 0, 0, 0, 0, 'Greenshore Clanhall', 3, 128, 10800, 10800, 11, 10, 312, 0, 0, 0, 0),
(105, 0, 0, 0, 0, 0, 'Greenshore Village, Villa', 3, 124, 9540, 9540, 8, 4, 273, 0, 0, 0, 0),
(106, 0, 0, 0, 0, 0, 'Greenshore Village 1', 3, 30, 2420, 2420, 1, 3, 64, 0, 0, 0, 0),
(109, 0, 0, 0, 0, 0, 'Greenshore Village, Shop', 3, 20, 1800, 1800, 5, 1, 56, 0, 0, 0, 0),
(112, 0, 0, 0, 0, 0, 'Greenshore Village 7', 3, 17, 1260, 1260, 1, 1, 42, 0, 0, 0, 0),
(113, 0, 0, 0, 0, 0, 'The Tibianic', 3, 306, 34500, 34500, 9, 21, 592, 0, 0, 0, 0),
(114, 0, 0, 0, 0, 0, 'Halls of the Adventurers', 3, 233, 15380, 15380, 14, 18, 518, 0, 0, 0, 0),
(115, 0, 0, 0, 0, 0, 'Dark Mansion', 3, 279, 17845, 17845, 13, 17, 598, 0, 0, 0, 0),
(116, 0, 0, 0, 0, 0, 'Bloodhall', 3, 232, 15270, 15270, 15, 16, 566, 0, 0, 0, 0),
(117, 0, 0, 0, 0, 0, 'Dagger Alley 1', 4, 50, 2665, 2665, 2, 2, 124, 0, 0, 0, 0),
(120, 0, 0, 0, 0, 0, 'Blessed Shield Guildhall', 4, 121, 8090, 8090, 8, 9, 297, 0, 0, 0, 0),
(121, 0, 0, 0, 0, 0, 'Steel Home', 4, 213, 13845, 13845, 10, 13, 381, 0, 0, 0, 0),
(122, 0, 0, 0, 0, 0, 'Iron Alley 1', 4, 59, 3450, 3450, 2, 4, 114, 0, 0, 0, 0),
(123, 0, 0, 0, 0, 0, 'Iron Alley 2', 4, 59, 3450, 3450, 2, 4, 117, 0, 0, 0, 0),
(124, 0, 0, 0, 0, 0, 'Swamp Watch', 4, 165, 11090, 11090, 12, 12, 328, 0, 0, 0, 0),
(125, 0, 0, 0, 0, 0, 'Golden Axe Guildhall', 4, 167, 10485, 10485, 12, 10, 390, 0, 0, 0, 0),
(126, 0, 0, 0, 0, 0, 'Silver Street 1', 4, 52, 2565, 2565, 2, 1, 129, 0, 0, 0, 0),
(127, 0, 0, 0, 0, 0, 'Silver Street 2', 4, 39, 1980, 1980, 2, 1, 90, 0, 0, 0, 0),
(128, 0, 0, 0, 0, 0, 'Silver Street 3', 4, 39, 1980, 1980, 2, 1, 57, 0, 0, 0, 0),
(129, 0, 0, 0, 0, 0, 'Silver Street 4', 4, 62, 3295, 3295, 4, 2, 153, 0, 0, 0, 0),
(130, 0, 0, 0, 0, 0, 'Market Street 6', 4, 96, 5485, 5485, 5, 5, 216, 0, 0, 0, 0),
(131, 0, 0, 0, 0, 0, 'Loot Lane 1 (Shop)', 4, 81, 4565, 4565, 7, 3, 198, 0, 0, 0, 0),
(132, 0, 0, 0, 0, 0, 'Mystic Lane 2', 4, 57, 2980, 2980, 2, 2, 136, 0, 0, 0, 0),
(133, 0, 0, 0, 0, 0, 'Mystic Lane 1', 4, 51, 2945, 2945, 4, 3, 107, 0, 0, 0, 0),
(134, 0, 0, 0, 0, 0, 'Market Street 4 (Shop)', 4, 91, 5105, 5105, 7, 3, 208, 0, 0, 0, 0),
(135, 0, 0, 0, 0, 0, 'Market Street 5 (Shop)', 4, 116, 6375, 6375, 5, 4, 243, 0, 0, 0, 0),
(136, 0, 0, 0, 0, 0, 'Market Street 3', 4, 67, 3475, 3475, 3, 2, 147, 0, 0, 0, 0),
(137, 0, 0, 0, 0, 0, 'Market Street 2', 4, 93, 4925, 4925, 5, 3, 200, 0, 0, 0, 0),
(138, 0, 0, 0, 0, 0, 'Market Street 1', 4, 132, 6680, 6680, 5, 3, 258, 0, 0, 0, 0),
(139, 0, 0, 0, 0, 0, 'Old Lighthouse', 4, 72, 3610, 3610, 1, 2, 177, 0, 0, 0, 0),
(140, 0, 0, 0, 0, 0, 'Seagull Walk 1', 4, 100, 5095, 5095, 6, 2, 220, 0, 0, 0, 0),
(141, 0, 0, 0, 0, 0, 'Seagull Walk 2', 4, 46, 2765, 2765, 4, 3, 132, 0, 0, 0, 0),
(142, 0, 0, 0, 0, 0, 'Dream Street 4', 4, 63, 3765, 3765, 5, 4, 168, 0, 0, 0, 0),
(143, 0, 0, 0, 0, 0, 'Elm Street 2', 4, 50, 2665, 2665, 2, 2, 112, 0, 0, 0, 0),
(144, 0, 0, 0, 0, 0, 'Elm Street 4', 4, 49, 2520, 2520, 2, 2, 120, 0, 0, 0, 0),
(145, 0, 0, 0, 0, 0, 'Elm Street 1', 4, 51, 2710, 2710, 2, 2, 120, 0, 0, 0, 0),
(146, 0, 0, 0, 0, 0, 'Elm Street 3', 4, 52, 2855, 2855, 1, 3, 126, 0, 0, 0, 0),
(147, 0, 0, 0, 0, 0, 'Dream Street 3', 4, 51, 2710, 2710, 2, 2, 121, 0, 0, 0, 0),
(148, 0, 0, 0, 0, 0, 'Dream Street 2', 4, 63, 3340, 3340, 4, 2, 153, 0, 0, 0, 0),
(149, 0, 0, 0, 0, 0, 'Dream Street 1 (Shop)', 4, 77, 4330, 4330, 6, 2, 189, 0, 0, 0, 0),
(150, 0, 0, 0, 0, 0, 'Salvation Street 1 (Shop)', 4, 112, 6240, 6240, 7, 4, 249, 0, 0, 0, 0),
(151, 0, 0, 0, 0, 0, 'Lucky Lane 1 (Shop)', 4, 128, 6960, 6960, 6, 4, 270, 0, 0, 0, 0),
(152, 0, 0, 0, 0, 0, 'Salvation Street 2', 4, 75, 3790, 3790, 2, 2, 100, 0, 0, 0, 0),
(153, 0, 0, 0, 0, 0, 'Salvation Street 3', 4, 75, 3790, 3790, 2, 2, 108, 0, 0, 0, 0),
(154, 0, 0, 0, 0, 0, 'Valorous Venore', 4, 249, 14435, 14435, 15, 9, 508, 0, 0, 0, 0),
(155, 0, 0, 0, 0, 0, 'Paupers Palace, Flat 06', 4, 7, 450, 450, 1, 1, 20, 0, 0, 0, 0),
(156, 0, 0, 0, 0, 0, 'Paupers Palace, Flat 05', 4, 4, 315, 315, 1, 1, 15, 0, 0, 0, 0),
(157, 0, 0, 0, 0, 0, 'Paupers Palace, Flat 04', 4, 7, 450, 450, 1, 1, 25, 0, 0, 0, 0),
(158, 0, 0, 0, 0, 0, 'Paupers Palace, Flat 03', 4, 6, 405, 405, 1, 1, 20, 0, 0, 0, 0),
(159, 0, 0, 0, 0, 0, 'Paupers Palace, Flat 07', 4, 8, 685, 685, 1, 2, 24, 0, 0, 0, 0),
(160, 0, 0, 0, 0, 0, 'Paupers Palace, Flat 02', 4, 7, 450, 450, 1, 1, 24, 0, 0, 0, 0),
(161, 0, 0, 0, 0, 0, 'Paupers Palace, Flat 01', 4, 6, 405, 405, 1, 1, 24, 0, 0, 0, 0),
(162, 0, 0, 0, 0, 0, 'Paupers Palace, Flat 11', 4, 4, 315, 315, 1, 1, 15, 0, 0, 0, 0),
(163, 0, 0, 0, 0, 0, 'Paupers Palace, Flat 13', 4, 7, 450, 450, 1, 1, 20, 0, 0, 0, 0),
(164, 0, 0, 0, 0, 0, 'Paupers Palace, Flat 15', 4, 7, 450, 450, 1, 1, 20, 0, 0, 0, 0),
(165, 0, 0, 0, 0, 0, 'Paupers Palace, Flat 17', 4, 7, 450, 450, 1, 1, 20, 0, 0, 0, 0),
(166, 0, 0, 0, 0, 0, 'Paupers Palace, Flat 18', 4, 4, 315, 315, 1, 1, 20, 0, 0, 0, 0),
(167, 0, 0, 0, 0, 0, 'Paupers Palace, Flat 12', 4, 8, 685, 685, 1, 2, 25, 0, 0, 0, 0),
(168, 0, 0, 0, 0, 0, 'Paupers Palace, Flat 14', 4, 10, 585, 585, 1, 1, 25, 0, 0, 0, 0),
(169, 0, 0, 0, 0, 0, 'Paupers Palace, Flat 16', 4, 10, 585, 585, 1, 1, 30, 0, 0, 0, 0),
(170, 0, 0, 0, 0, 0, 'Paupers Palace, Flat 28', 4, 4, 315, 315, 1, 1, 15, 0, 0, 0, 0),
(171, 0, 0, 0, 0, 0, 'Paupers Palace, Flat 26', 4, 7, 450, 450, 1, 1, 20, 0, 0, 0, 0),
(172, 0, 0, 0, 0, 0, 'Paupers Palace, Flat 24', 4, 7, 450, 450, 1, 1, 20, 0, 0, 0, 0),
(173, 0, 0, 0, 0, 0, 'Paupers Palace, Flat 22', 4, 7, 450, 450, 1, 1, 20, 0, 0, 0, 0),
(174, 0, 0, 0, 0, 0, 'Paupers Palace, Flat 21', 4, 4, 315, 315, 1, 1, 20, 0, 0, 0, 0),
(175, 0, 0, 0, 0, 0, 'Paupers Palace, Flat 27', 4, 8, 585, 585, 1, 2, 25, 0, 0, 0, 0),
(176, 0, 0, 0, 0, 0, 'Paupers Palace, Flat 25', 4, 10, 585, 585, 1, 1, 25, 0, 0, 0, 0),
(177, 0, 0, 0, 0, 0, 'Paupers Palace, Flat 23', 4, 10, 585, 585, 1, 1, 28, 0, 0, 0, 0),
(178, 0, 0, 0, 0, 0, 'Paupers Palace, Flat 34', 4, 29, 1675, 1675, 2, 2, 65, 0, 0, 0, 0),
(179, 0, 0, 0, 0, 0, 'Paupers Palace, Flat 33', 4, 13, 765, 765, 2, 1, 30, 0, 0, 0, 0),
(180, 0, 0, 0, 0, 0, 'Paupers Palace, Flat 32', 4, 17, 1135, 1135, 2, 2, 50, 0, 0, 0, 0),
(181, 0, 0, 0, 0, 0, 'Paupers Palace, Flat 31', 4, 16, 855, 855, 1, 1, 40, 0, 0, 0, 0),
(182, 0, 0, 0, 0, 0, 'Park Lane 1a', 5, 20, 1220, 1220, 1, 2, 53, 0, 0, 0, 0),
(183, 0, 0, 0, 0, 0, 'Park Lane 3a', 5, 20, 1100, 1100, 1, 2, 48, 0, 0, 0, 0),
(184, 0, 0, 0, 0, 0, 'Park Lane 1b', 5, 25, 1380, 1380, 2, 2, 54, 0, 0, 0, 0),
(185, 0, 0, 0, 0, 0, 'Park Lane 3b', 5, 19, 1100, 1100, 1, 2, 48, 0, 0, 0, 0),
(186, 0, 0, 0, 0, 0, 'Park Lane 2', 5, 16, 980, 980, 2, 2, 42, 0, 0, 0, 0),
(187, 0, 0, 0, 0, 0, 'Park Lane 4', 5, 16, 980, 980, 2, 2, 42, 0, 0, 0, 0),
(188, 0, 0, 0, 0, 0, 'Theater Avenue 14 (Shop)', 5, 36, 2115, 2115, 3, 1, 83, 0, 0, 0, 0),
(189, 0, 0, 0, 0, 0, 'Magician\'s Alley 1', 5, 14, 1050, 1050, 1, 2, 35, 0, 0, 0, 0),
(190, 0, 0, 0, 0, 0, 'Theater Avenue 12', 5, 14, 955, 955, 1, 2, 28, 0, 0, 0, 0),
(191, 0, 0, 0, 0, 0, 'Theater Avenue 10', 5, 17, 1090, 1090, 1, 2, 45, 0, 0, 0, 0),
(192, 0, 0, 0, 0, 0, 'Magician\'s Alley 1b', 5, 8, 750, 750, 1, 2, 24, 0, 0, 0, 0),
(193, 0, 0, 0, 0, 0, 'Magician\'s Alley 1c', 5, 7, 500, 500, 1, 1, 20, 0, 0, 0, 0),
(194, 0, 0, 0, 0, 0, 'Magician\'s Alley 1a', 5, 7, 700, 700, 1, 2, 28, 0, 0, 0, 0),
(195, 0, 0, 0, 0, 0, 'Magician\'s Alley 1d', 5, 6, 450, 450, 1, 1, 24, 0, 0, 0, 0),
(197, 0, 0, 0, 0, 0, 'Carlin Clanhall', 5, 164, 11450, 11450, 13, 10, 378, 0, 0, 0, 0),
(198, 0, 0, 0, 0, 0, 'Magician\'s Alley 4', 5, 39, 2750, 2750, 1, 4, 96, 0, 0, 0, 0),
(199, 0, 0, 0, 0, 0, 'Magician\'s Alley 8', 5, 20, 1400, 1400, 1, 2, 36, 0, 0, 0, 0),
(201, 0, 0, 0, 0, 0, 'Lonely Sea Side Hostel', 5, 236, 12180, 12180, 11, 8, 376, 0, 0, 0, 0),
(202, 0, 0, 0, 0, 0, 'Suntower', 5, 192, 10080, 10080, 14, 9, 451, 0, 0, 0, 0),
(203, 0, 0, 0, 0, 0, 'Harbour Lane 3', 5, 76, 3560, 3560, 1, 3, 145, 0, 0, 0, 0),
(204, 0, 0, 0, 0, 0, 'Harbour Flats, Flat 11', 5, 10, 520, 520, 1, 1, 24, 0, 0, 0, 0),
(205, 0, 0, 0, 0, 0, 'Harbour Flats, Flat 13', 5, 10, 520, 520, 1, 1, 24, 0, 0, 0, 0),
(206, 0, 0, 0, 0, 0, 'Harbour Flats, Flat 15', 5, 6, 360, 360, 1, 1, 18, 0, 0, 0, 0),
(207, 0, 0, 0, 0, 0, 'Harbour Flats, Flat 17', 5, 6, 360, 360, 1, 1, 24, 0, 0, 0, 0),
(208, 0, 0, 0, 0, 0, 'Harbour Flats, Flat 12', 5, 7, 400, 400, 1, 1, 20, 0, 0, 0, 0),
(209, 0, 0, 0, 0, 0, 'Harbour Flats, Flat 14', 5, 7, 400, 400, 1, 1, 20, 0, 0, 0, 0),
(210, 0, 0, 0, 0, 0, 'Harbour Flats, Flat 16', 5, 7, 400, 400, 1, 1, 20, 0, 0, 0, 0),
(211, 0, 0, 0, 0, 0, 'Harbour Flats, Flat 18', 5, 7, 400, 400, 1, 1, 25, 0, 0, 0, 0),
(212, 0, 0, 0, 0, 0, 'Harbour Flats, Flat 21', 5, 13, 860, 860, 1, 2, 35, 0, 0, 0, 0),
(213, 0, 0, 0, 0, 0, 'Harbour Flats, Flat 22', 5, 16, 980, 980, 1, 2, 45, 0, 0, 0, 0),
(214, 0, 0, 0, 0, 0, 'Harbour Flats, Flat 23', 5, 7, 400, 400, 1, 1, 25, 0, 0, 0, 0),
(215, 0, 0, 0, 0, 0, 'Harbour Lane 2a (Shop)', 5, 12, 680, 680, 3, 0, 32, 0, 0, 0, 0),
(216, 0, 0, 0, 0, 0, 'Harbour Lane 2b (Shop)', 5, 12, 680, 680, 3, 0, 40, 0, 0, 0, 0),
(217, 0, 0, 0, 0, 0, 'Theater Avenue 6e', 5, 10, 820, 820, 1, 2, 31, 0, 0, 0, 0),
(218, 0, 0, 0, 0, 0, 'Theater Avenue 6c', 5, 2, 225, 225, 1, 1, 9, 0, 0, 0, 0),
(219, 0, 0, 0, 0, 0, 'Theater Avenue 6a', 5, 10, 820, 820, 1, 2, 35, 0, 0, 0, 0),
(220, 0, 0, 0, 0, 0, 'Theater Avenue 6f', 5, 10, 820, 820, 1, 2, 32, 0, 0, 0, 0),
(221, 0, 0, 0, 0, 0, 'Theater Avenue 6d', 5, 2, 225, 225, 1, 1, 11, 0, 0, 0, 0),
(222, 0, 0, 0, 0, 0, 'Theater Avenue 6b', 5, 10, 820, 820, 1, 2, 35, 0, 0, 0, 0),
(223, 0, 0, 0, 0, 0, 'East Lane 1a', 5, 47, 2260, 2260, 1, 2, 95, 0, 0, 0, 0),
(224, 0, 0, 0, 0, 0, 'East Lane 1b', 5, 34, 1700, 1700, 1, 2, 83, 0, 0, 0, 0),
(225, 0, 0, 0, 0, 0, 'East Lane 2', 5, 89, 4500, 4500, 2, 2, 176, 0, 0, 0, 0),
(226, 0, 0, 0, 0, 0, 'Moonkeep', 5, 227, 13020, 13020, 13, 16, 518, 0, 0, 0, 0),
(227, 0, 0, 0, 0, 0, 'Northern Street 7', 5, 33, 1700, 1700, 1, 2, 83, 0, 0, 0, 0),
(228, 0, 0, 0, 0, 0, 'Northern Street 5', 5, 40, 1980, 1980, 1, 2, 94, 0, 0, 0, 0),
(229, 0, 0, 0, 0, 0, 'Northern Street 3b', 5, 11, 780, 780, 1, 2, 36, 0, 0, 0, 0),
(230, 0, 0, 0, 0, 0, 'Northern Street 3a', 5, 10, 740, 740, 1, 2, 34, 0, 0, 0, 0),
(231, 0, 0, 0, 0, 0, 'Northern Street 1c', 5, 10, 720, 720, 1, 2, 35, 0, 0, 0, 0),
(232, 0, 0, 0, 0, 0, 'Northern Street 1b', 5, 15, 940, 940, 1, 2, 37, 0, 0, 0, 0),
(233, 0, 0, 0, 0, 0, 'Northern Street 1a', 5, 15, 940, 940, 1, 2, 42, 0, 0, 0, 0),
(235, 0, 0, 0, 0, 0, 'Theater Avenue 5d', 5, 7, 450, 450, 1, 1, 25, 0, 0, 0, 0),
(236, 0, 0, 0, 0, 0, 'Theater Avenue 5c', 5, 7, 450, 450, 1, 1, 20, 0, 0, 0, 0),
(237, 0, 0, 0, 0, 0, 'Theater Avenue 5b', 5, 7, 450, 450, 1, 1, 20, 0, 0, 0, 0),
(238, 0, 0, 0, 0, 0, 'Theater Avenue 5a', 5, 7, 450, 450, 1, 1, 25, 0, 0, 0, 0),
(239, 0, 0, 0, 0, 0, 'Theater Avenue 7, Flat 06', 5, 4, 315, 315, 1, 1, 20, 0, 0, 0, 0),
(240, 0, 0, 0, 0, 0, 'Theater Avenue 7, Flat 05', 5, 6, 405, 405, 1, 1, 20, 0, 0, 0, 0),
(241, 0, 0, 0, 0, 0, 'Theater Avenue 7, Flat 04', 5, 8, 495, 495, 1, 1, 20, 0, 0, 0, 0),
(242, 0, 0, 0, 0, 0, 'Theater Avenue 7, Flat 03', 5, 6, 450, 450, 1, 1, 20, 0, 0, 0, 0),
(243, 0, 0, 0, 0, 0, 'Theater Avenue 7, Flat 02', 5, 6, 450, 450, 1, 1, 15, 0, 0, 0, 0),
(244, 0, 0, 0, 0, 0, 'Theater Avenue 7, Flat 01', 5, 4, 315, 315, 1, 1, 12, 0, 0, 0, 0),
(245, 0, 0, 0, 0, 0, 'Theater Avenue 7, Flat 16', 5, 6, 405, 405, 1, 1, 20, 0, 0, 0, 0),
(246, 0, 0, 0, 0, 0, 'Theater Avenue 7, Flat 15', 5, 6, 405, 405, 1, 1, 20, 0, 0, 0, 0),
(247, 0, 0, 0, 0, 0, 'Theater Avenue 7, Flat 14', 5, 8, 495, 495, 1, 1, 20, 0, 0, 0, 0),
(248, 0, 0, 0, 0, 0, 'Theater Avenue 7, Flat 13', 5, 6, 405, 405, 1, 1, 20, 0, 0, 0, 0),
(249, 0, 0, 0, 0, 0, 'Theater Avenue 7, Flat 12', 5, 6, 405, 405, 1, 1, 20, 0, 0, 0, 0),
(250, 0, 0, 0, 0, 0, 'Theater Avenue 7, Flat 11', 5, 8, 495, 495, 1, 1, 28, 0, 0, 0, 0),
(251, 0, 0, 0, 0, 0, 'Theater Avenue 8b', 5, 20, 1370, 1370, 1, 2, 49, 0, 0, 0, 0),
(252, 0, 0, 0, 0, 0, 'Theater Avenue 8a', 5, 18, 1270, 1270, 1, 3, 49, 0, 0, 0, 0),
(253, 0, 0, 0, 0, 0, 'Harbour Lane 1 (Shop)', 5, 19, 1040, 1040, 3, 0, 54, 0, 0, 0, 0),
(254, 0, 0, 0, 0, 0, 'Magician\'s Alley 5a', 5, 4, 350, 350, 1, 1, 15, 0, 0, 0, 0),
(255, 0, 0, 0, 0, 0, 'Magician\'s Alley 5b', 5, 7, 500, 500, 1, 1, 20, 0, 0, 0, 0),
(256, 0, 0, 0, 0, 0, 'Magician\'s Alley 5e', 5, 7, 500, 500, 1, 1, 20, 0, 0, 0, 0),
(257, 0, 0, 0, 0, 0, 'Magician\'s Alley 5d', 5, 7, 500, 500, 1, 1, 20, 0, 0, 0, 0),
(258, 0, 0, 0, 0, 0, 'Magician\'s Alley 5c', 5, 15, 1150, 1150, 1, 2, 35, 0, 0, 0, 0),
(259, 0, 0, 0, 0, 0, 'Magician\'s Alley 5f', 5, 15, 1150, 1150, 1, 2, 42, 0, 0, 0, 0),
(260, 0, 0, 0, 0, 0, 'Nordic Stronghold', 5, 318, 18400, 18400, 21, 21, 751, 0, 0, 0, 0),
(261, 0, 0, 0, 0, 0, 'Northport Clanhall', 5, 122, 9810, 9810, 10, 10, 306, 0, 0, 0, 0),
(262, 0, 0, 0, 0, 0, 'Northport Village 1', 5, 20, 1475, 1475, 1, 2, 48, 0, 0, 0, 0),
(263, 0, 0, 0, 0, 0, 'Northport Village 2', 5, 19, 1475, 1475, 1, 2, 40, 0, 0, 0, 0),
(264, 0, 0, 0, 0, 0, 'Northport Village 3', 5, 91, 5435, 5435, 2, 2, 153, 0, 0, 0, 0),
(266, 0, 0, 0, 0, 0, 'Northport Village 4', 5, 41, 2630, 2630, 1, 2, 92, 0, 0, 0, 0),
(267, 0, 0, 0, 0, 0, 'Northport Village 5', 5, 25, 1805, 1805, 1, 2, 56, 0, 0, 0, 0),
(268, 0, 0, 0, 0, 0, 'Seawatch', 5, 346, 25010, 25010, 17, 19, 749, 0, 0, 0, 0),
(270, 0, 0, 0, 0, 0, 'Northport Village 6', 5, 31, 2135, 2135, 1, 2, 64, 0, 0, 0, 0),
(273, 0, 0, 0, 0, 0, 'Druids Retreat A', 5, 25, 1340, 1340, 1, 2, 60, 0, 0, 0, 0),
(274, 0, 0, 0, 0, 0, 'Druids Retreat D', 5, 21, 1180, 1180, 1, 2, 53, 0, 0, 0, 0),
(276, 0, 0, 0, 0, 0, 'Druids Retreat B', 5, 23, 1260, 1260, 1, 2, 54, 0, 0, 0, 0),
(277, 0, 0, 0, 0, 0, 'Druids Retreat C', 5, 16, 980, 980, 1, 2, 45, 0, 0, 0, 0),
(279, 0, 0, 0, 0, 0, 'House of Recreation', 5, 319, 22540, 22540, 15, 16, 711, 0, 0, 0, 0),
(280, 0, 0, 0, 0, 0, 'Underwood 1', 1, 26, 1495, 1495, 1, 2, 56, 0, 0, 0, 0),
(281, 0, 0, 0, 0, 0, 'Underwood 2', 1, 26, 1495, 1495, 1, 2, 56, 0, 0, 0, 0),
(282, 0, 0, 0, 0, 0, 'Underwood 5', 1, 19, 1370, 1370, 1, 3, 49, 0, 0, 0, 0),
(283, 0, 0, 0, 0, 0, 'Underwood 3', 1, 26, 1685, 1685, 1, 3, 60, 0, 0, 0, 0),
(284, 0, 0, 0, 0, 0, 'Underwood 10', 1, 10, 585, 585, 1, 1, 30, 0, 0, 0, 0),
(285, 0, 0, 0, 0, 0, 'Underwood 4', 1, 34, 2235, 2235, 1, 4, 72, 0, 0, 0, 0),
(286, 0, 0, 0, 0, 0, 'Underwood 6', 1, 24, 1595, 1595, 1, 3, 56, 0, 0, 0, 0),
(287, 0, 0, 0, 0, 0, 'Great Willow 1a', 1, 6, 500, 500, 1, 1, 25, 0, 0, 0, 0),
(288, 0, 0, 0, 0, 0, 'Great Willow 1b', 1, 9, 650, 650, 1, 1, 30, 0, 0, 0, 0),
(289, 0, 0, 0, 0, 0, 'Great Willow 1c', 1, 8, 650, 650, 1, 1, 24, 0, 0, 0, 0),
(290, 0, 0, 0, 0, 0, 'Underwood 8', 1, 12, 865, 865, 1, 2, 36, 0, 0, 0, 0),
(291, 0, 0, 0, 0, 0, 'Underwood 7', 1, 21, 1460, 1460, 1, 3, 53, 0, 0, 0, 0),
(292, 0, 0, 0, 0, 0, 'Underwood 9', 1, 10, 585, 585, 1, 1, 30, 0, 0, 0, 0),
(293, 0, 0, 0, 0, 0, 'Ab\'Dendriel Clanhall', 1, 255, 14850, 14850, 11, 10, 521, 0, 0, 0, 0),
(294, 0, 0, 0, 0, 0, 'Mangrove 4', 1, 12, 950, 950, 1, 2, 36, 0, 0, 0, 0),
(295, 0, 0, 0, 0, 0, 'Mangrove 3', 1, 16, 1150, 1150, 1, 2, 42, 0, 0, 0, 0),
(296, 0, 0, 0, 0, 0, 'Mangrove 2', 1, 20, 1350, 1350, 1, 2, 48, 0, 0, 0, 0),
(297, 0, 0, 0, 0, 0, 'Castle of the Winds', 1, 412, 23885, 23885, 23, 18, 863, 0, 0, 0, 0),
(298, 0, 0, 0, 0, 0, 'Mangrove 1', 1, 24, 1750, 1750, 1, 3, 56, 0, 0, 0, 0),
(299, 0, 0, 0, 0, 0, 'Shadow Towers', 1, 331, 21800, 21800, 16, 18, 731, 0, 0, 0, 0),
(300, 0, 0, 0, 0, 0, 'Treetop 1', 1, 10, 650, 650, 1, 1, 24, 0, 0, 0, 0),
(301, 0, 0, 0, 0, 0, 'Treetop 2', 1, 10, 650, 650, 1, 1, 30, 0, 0, 0, 0),
(302, 0, 0, 0, 0, 0, 'Treetop 3 (Shop)', 1, 20, 1250, 1250, 2, 1, 60, 0, 0, 0, 0),
(303, 0, 0, 0, 0, 0, 'Treetop 4 (Shop)', 1, 19, 1250, 1250, 2, 1, 48, 0, 0, 0, 0),
(304, 0, 0, 0, 0, 0, 'Treetop 5 (Shop)', 1, 18, 1350, 1350, 3, 1, 54, 0, 0, 0, 0),
(305, 0, 0, 0, 0, 0, 'Treetop 6', 1, 6, 450, 450, 1, 1, 24, 0, 0, 0, 0),
(306, 0, 0, 0, 0, 0, 'Treetop 7', 1, 13, 800, 800, 1, 1, 28, 0, 0, 0, 0),
(307, 0, 0, 0, 0, 0, 'Treetop 10', 1, 16, 1150, 1150, 1, 2, 42, 0, 0, 0, 0),
(308, 0, 0, 0, 0, 0, 'Treetop 9', 1, 16, 1150, 1150, 1, 2, 35, 0, 0, 0, 0),
(309, 0, 0, 0, 0, 0, 'Treetop 8', 1, 13, 800, 800, 1, 1, 35, 0, 0, 0, 0),
(310, 0, 0, 0, 0, 0, 'Great Willow 2a', 1, 10, 650, 650, 1, 1, 30, 0, 0, 0, 0),
(311, 0, 0, 0, 0, 0, 'Great Willow 2b', 1, 6, 450, 450, 1, 1, 24, 0, 0, 0, 0),
(312, 0, 0, 0, 0, 0, 'Great Willow 2c', 1, 10, 650, 650, 1, 1, 24, 0, 0, 0, 0),
(313, 0, 0, 0, 0, 0, 'Great Willow 2d', 1, 6, 450, 450, 1, 1, 18, 0, 0, 0, 0),
(314, 0, 0, 0, 0, 0, 'Great Willow 3a', 1, 10, 650, 650, 1, 1, 30, 0, 0, 0, 0),
(315, 0, 0, 0, 0, 0, 'Great Willow 3b', 1, 6, 450, 450, 1, 1, 24, 0, 0, 0, 0),
(316, 0, 0, 0, 0, 0, 'Great Willow 3c', 1, 10, 650, 650, 1, 1, 24, 0, 0, 0, 0),
(317, 0, 0, 0, 0, 0, 'Great Willow 3d', 1, 6, 450, 450, 1, 1, 18, 0, 0, 0, 0),
(318, 0, 0, 0, 0, 0, 'Great Willow 4a', 1, 12, 950, 950, 1, 2, 36, 0, 0, 0, 0),
(319, 0, 0, 0, 0, 0, 'Great Willow 4d', 1, 12, 750, 750, 1, 2, 28, 0, 0, 0, 0),
(320, 0, 0, 0, 0, 0, 'Great Willow 4c', 1, 12, 950, 950, 1, 2, 31, 0, 0, 0, 0),
(321, 0, 0, 0, 0, 0, 'Great Willow 4b', 1, 12, 950, 950, 1, 1, 36, 0, 0, 0, 0),
(322, 0, 0, 0, 0, 0, 'Treetop 11', 1, 11, 900, 900, 1, 2, 35, 0, 0, 0, 0),
(323, 0, 0, 0, 0, 0, 'Treetop 12 (Shop)', 1, 19, 1350, 1350, 3, 1, 55, 0, 0, 0, 0),
(324, 0, 0, 0, 0, 0, 'Coastwood 10', 1, 19, 1630, 1630, 1, 3, 49, 0, 0, 0, 0),
(325, 0, 0, 0, 0, 0, 'Coastwood 1', 1, 11, 980, 980, 1, 2, 28, 0, 0, 0, 0),
(326, 0, 0, 0, 0, 0, 'Coastwood 2', 1, 11, 980, 980, 1, 2, 35, 0, 0, 0, 0),
(327, 0, 0, 0, 0, 0, 'Coastwood 3', 1, 17, 1310, 1310, 1, 2, 37, 0, 0, 0, 0),
(328, 0, 0, 0, 0, 0, 'Coastwood 4', 1, 14, 1145, 1145, 1, 2, 42, 0, 0, 0, 0),
(330, 0, 0, 0, 0, 0, 'Coastwood 5', 1, 21, 1530, 1530, 1, 2, 49, 0, 0, 0, 0),
(331, 0, 0, 0, 0, 0, 'Coastwood 6 (Shop)', 1, 21, 1595, 1595, 3, 1, 52, 0, 0, 0, 0),
(333, 0, 0, 0, 0, 0, 'Coastwood 7', 1, 9, 660, 660, 1, 1, 29, 0, 0, 0, 0),
(334, 0, 0, 0, 0, 0, 'Coastwood 8', 1, 16, 1255, 1255, 1, 2, 42, 0, 0, 0, 0),
(335, 0, 0, 0, 0, 0, 'Coastwood 9', 1, 14, 935, 935, 1, 1, 36, 0, 0, 0, 0),
(336, 0, 0, 0, 0, 0, 'Treetop 13', 1, 21, 1400, 1400, 1, 2, 49, 0, 0, 0, 0),
(337, 0, 0, 0, 0, 0, 'Shadow Caves 1', 1, 7, 300, 300, 1, 1, 20, 0, 0, 0, 0),
(338, 0, 0, 0, 0, 0, 'Shadow Caves 3', 1, 7, 300, 300, 1, 1, 25, 0, 0, 0, 0),
(339, 0, 0, 0, 0, 0, 'Shadow Caves 2', 1, 7, 300, 300, 1, 1, 20, 0, 0, 0, 0),
(340, 0, 0, 0, 0, 0, 'Shadow Caves 4', 1, 7, 300, 300, 1, 1, 25, 0, 0, 0, 0),
(341, 0, 0, 0, 0, 0, 'Shadow Caves 11', 1, 7, 300, 300, 1, 1, 20, 0, 0, 0, 0),
(342, 0, 0, 0, 0, 0, 'Shadow Caves 13', 1, 7, 300, 300, 1, 1, 20, 0, 0, 0, 0),
(343, 0, 0, 0, 0, 0, 'Shadow Caves 15', 1, 7, 300, 300, 1, 1, 20, 0, 0, 0, 0),
(344, 0, 0, 0, 0, 0, 'Shadow Caves 17', 1, 7, 300, 300, 1, 1, 20, 0, 0, 0, 0),
(345, 0, 0, 0, 0, 0, 'Shadow Caves 12', 1, 7, 300, 300, 1, 1, 20, 0, 0, 0, 0),
(346, 0, 0, 0, 0, 0, 'Shadow Caves 14', 1, 7, 300, 300, 1, 1, 20, 0, 0, 0, 0),
(347, 0, 0, 0, 0, 0, 'Shadow Caves 16', 1, 7, 300, 300, 1, 1, 20, 0, 0, 0, 0),
(348, 0, 0, 0, 0, 0, 'Shadow Caves 18', 1, 7, 300, 300, 1, 1, 20, 0, 0, 0, 0),
(349, 0, 0, 0, 0, 0, 'Shadow Caves 21', 1, 7, 300, 300, 1, 1, 20, 0, 0, 0, 0),
(350, 0, 0, 0, 0, 0, 'Shadow Caves 23', 1, 7, 300, 300, 1, 1, 20, 0, 0, 0, 0),
(351, 0, 0, 0, 0, 0, 'Shadow Caves 25', 1, 7, 300, 300, 1, 1, 20, 0, 0, 0, 0),
(352, 0, 0, 0, 0, 0, 'Shadow Caves 27', 1, 7, 300, 300, 1, 1, 25, 0, 0, 0, 0),
(353, 0, 0, 0, 0, 0, 'Shadow Caves 22', 1, 7, 300, 300, 1, 1, 20, 0, 0, 0, 0),
(354, 0, 0, 0, 0, 0, 'Shadow Caves 24', 1, 7, 300, 300, 1, 1, 20, 0, 0, 0, 0),
(355, 0, 0, 0, 0, 0, 'Shadow Caves 26', 1, 7, 300, 300, 1, 1, 20, 0, 0, 0, 0),
(356, 0, 0, 0, 0, 0, 'Shadow Caves 28', 1, 7, 300, 300, 1, 1, 25, 0, 0, 0, 0),
(358, 0, 0, 0, 0, 0, 'The Market 1 (Shop)', 2, 10, 650, 650, 2, 0, 25, 0, 0, 0, 0),
(359, 0, 0, 0, 0, 0, 'The Market 2 (Shop)', 2, 18, 1100, 1100, 2, 0, 45, 0, 0, 0, 0),
(360, 0, 0, 0, 0, 0, 'The Market 3 (Shop)', 2, 25, 1450, 1450, 2, 0, 54, 0, 0, 0, 0),
(361, 0, 0, 0, 0, 0, 'The Market 4 (Shop)', 2, 30, 1800, 1800, 2, 0, 63, 0, 0, 0, 0),
(362, 0, 0, 0, 0, 0, 'Marble Guildhall', 2, 269, 16810, 16810, 18, 17, 593, 0, 0, 0, 0),
(363, 0, 0, 0, 0, 0, 'Lower Barracks 1', 2, 7, 300, 300, 1, 1, 25, 0, 0, 0, 0),
(364, 0, 0, 0, 0, 0, 'Lower Barracks 3', 2, 7, 300, 300, 1, 1, 25, 0, 0, 0, 0),
(365, 0, 0, 0, 0, 0, 'Lower Barracks 5', 2, 7, 300, 300, 1, 1, 25, 0, 0, 0, 0),
(366, 0, 0, 0, 0, 0, 'Lower Barracks 7', 2, 7, 300, 300, 1, 1, 25, 0, 0, 0, 0),
(367, 0, 0, 0, 0, 0, 'Lower Barracks 9', 2, 7, 300, 300, 1, 1, 25, 0, 0, 0, 0),
(368, 0, 0, 0, 0, 0, 'Lower Barracks 11', 2, 7, 300, 300, 1, 1, 25, 0, 0, 0, 0),
(369, 0, 0, 0, 0, 0, 'Lower Barracks 2', 2, 7, 300, 300, 1, 1, 25, 0, 0, 0, 0),
(370, 0, 0, 0, 0, 0, 'Lower Barracks 4', 2, 7, 300, 300, 1, 1, 25, 0, 0, 0, 0),
(371, 0, 0, 0, 0, 0, 'Lower Barracks 6', 2, 7, 300, 300, 1, 1, 25, 0, 0, 0, 0),
(372, 0, 0, 0, 0, 0, 'Lower Barracks 8', 2, 7, 300, 300, 1, 1, 25, 0, 0, 0, 0),
(373, 0, 0, 0, 0, 0, 'Lower Barracks 10', 2, 7, 300, 300, 1, 1, 25, 0, 0, 0, 0),
(374, 0, 0, 0, 0, 0, 'Lower Barracks 12', 2, 7, 300, 300, 1, 1, 25, 0, 0, 0, 0),
(375, 0, 0, 0, 0, 0, 'Lower Barracks 24', 2, 7, 300, 300, 1, 1, 25, 0, 0, 0, 0),
(376, 0, 0, 0, 0, 0, 'Lower Barracks 22', 2, 7, 300, 300, 1, 1, 25, 0, 0, 0, 0),
(377, 0, 0, 0, 0, 0, 'Lower Barracks 20', 2, 7, 300, 300, 1, 1, 25, 0, 0, 0, 0),
(378, 0, 0, 0, 0, 0, 'Lower Barracks 18', 2, 7, 300, 300, 1, 1, 25, 0, 0, 0, 0),
(379, 0, 0, 0, 0, 0, 'Lower Barracks 16', 2, 7, 300, 300, 1, 1, 25, 0, 0, 0, 0),
(380, 0, 0, 0, 0, 0, 'Lower Barracks 14', 2, 20, 300, 300, 2, 2, 42, 0, 0, 0, 0),
(381, 0, 0, 0, 0, 0, 'Lower Barracks 13', 2, 13, 300, 300, 2, 2, 35, 0, 0, 0, 0),
(382, 0, 0, 0, 0, 0, 'Lower Barracks 15', 2, 13, 300, 300, 2, 2, 35, 0, 0, 0, 0),
(383, 0, 0, 0, 0, 0, 'Lower Barracks 17', 2, 13, 300, 300, 2, 2, 35, 0, 0, 0, 0),
(384, 0, 0, 0, 0, 0, 'Lower Barracks 19', 2, 22, 300, 300, 2, 3, 46, 0, 0, 0, 0),
(385, 0, 0, 0, 0, 0, 'Lower Barracks 21', 2, 18, 300, 300, 2, 3, 42, 0, 0, 0, 0),
(386, 0, 0, 0, 0, 0, 'Lower Barracks 23', 2, 27, 300, 300, 2, 3, 51, 0, 0, 0, 0),
(387, 0, 0, 0, 0, 0, 'Iron Guildhall', 2, 317, 15560, 15560, 18, 22, 621, 0, 0, 0, 0),
(388, 0, 0, 0, 0, 0, 'Tunnel Gardens 12', 14, 89, 1060, 1060, 3, 4, 121, 0, 0, 0, 0),
(389, 0, 0, 0, 0, 0, 'Tunnel Gardens 11', 14, 41, 1060, 1060, 2, 4, 72, 0, 0, 0, 0),
(390, 0, 0, 0, 0, 0, 'Tunnel Gardens 8', 14, 30, 1360, 1360, 2, 4, 63, 0, 0, 0, 0),
(391, 0, 0, 0, 0, 0, 'Tunnel Gardens 7', 14, 46, 1360, 1360, 2, 6, 76, 0, 0, 0, 0),
(392, 0, 0, 0, 0, 0, 'Tunnel Gardens 6', 14, 50, 1360, 1360, 2, 5, 85, 0, 0, 0, 0),
(393, 0, 0, 0, 0, 0, 'Tunnel Gardens 5', 14, 28, 1360, 1360, 2, 3, 52, 0, 0, 0, 0),
(394, 0, 0, 0, 0, 0, 'Tunnel Gardens 1', 14, 28, 1820, 1820, 2, 4, 61, 0, 0, 0, 0),
(395, 0, 0, 0, 0, 0, 'Tunnel Gardens 3', 14, 47, 2000, 2000, 3, 5, 96, 0, 0, 0, 0),
(396, 0, 0, 0, 0, 0, 'Tunnel Gardens 4', 14, 27, 2000, 2000, 2, 4, 67, 0, 0, 0, 0),
(397, 0, 0, 0, 0, 0, 'Tunnel Gardens 2', 14, 56, 1820, 1820, 2, 4, 95, 0, 0, 0, 0),
(398, 0, 0, 0, 0, 0, 'Tunnel Gardens 10', 14, 20, 1000, 1000, 2, 4, 50, 0, 0, 0, 0),
(399, 0, 0, 0, 0, 0, 'Tunnel Gardens 9', 14, 9, 1000, 1000, 1, 2, 34, 0, 0, 0, 0),
(409, 0, 0, 0, 0, 0, 'Upper Barracks 4', 14, 85, 210, 210, 4, 8, 114, 0, 0, 0, 0),
(410, 0, 0, 0, 0, 0, 'Upper Barracks 3', 14, 24, 210, 210, 2, 3, 41, 0, 0, 0, 0),
(411, 0, 0, 0, 0, 0, 'Upper Barracks 2', 14, 27, 210, 210, 2, 4, 46, 0, 0, 0, 0),
(412, 0, 0, 0, 0, 0, 'Upper Barracks 1', 14, 69, 210, 210, 2, 4, 93, 0, 0, 0, 0),
(413, 0, 0, 0, 0, 0, 'Upper Barracks 5', 14, 368, 210, 210, 15, 21, 457, 0, 0, 0, 0),
(414, 0, 0, 0, 0, 0, 'Upper Barracks 6', 14, 29, 210, 210, 3, 3, 44, 0, 0, 0, 0),
(415, 0, 0, 0, 0, 0, 'Upper Barracks 7', 14, 19, 210, 210, 2, 3, 37, 0, 0, 0, 0),
(416, 0, 0, 0, 0, 0, 'Upper Barracks 11', 14, 115, 210, 210, 4, 5, 138, 0, 0, 0, 0),
(417, 0, 0, 0, 0, 0, 'Upper Barracks 10', 14, 26, 210, 210, 3, 2, 46, 0, 0, 0, 0),
(418, 0, 0, 0, 0, 0, 'Upper Barracks 9', 14, 26, 210, 210, 3, 2, 46, 0, 0, 0, 0),
(419, 0, 0, 0, 0, 0, 'Upper Barracks 8', 14, 33, 210, 210, 3, 2, 57, 0, 0, 0, 0),
(420, 0, 0, 0, 0, 0, 'Upper Barracks 12', 14, 27, 210, 210, 2, 2, 46, 0, 0, 0, 0),
(421, 0, 0, 0, 0, 0, 'Upper Barracks 13', 14, 30, 580, 580, 2, 4, 60, 0, 0, 0, 0),
(422, 0, 0, 0, 0, 0, 'Nobility Quarter 1', 2, 164, 1865, 1865, 2, 7, 206, 0, 0, 0, 0),
(423, 0, 0, 0, 0, 0, 'Nobility Quarter 2', 2, 153, 1865, 1865, 9, 18, 228, 0, 0, 0, 0),
(424, 0, 0, 0, 0, 0, 'Nobility Quarter 3', 2, 507, 1865, 1865, 6, 26, 608, 0, 0, 0, 0),
(425, 0, 0, 0, 0, 0, 'Nobility Quarter 8', 2, 36, 765, 765, 3, 4, 62, 0, 0, 0, 0),
(426, 0, 0, 0, 0, 0, 'Nobility Quarter 9', 2, 13, 765, 765, 1, 1, 36, 0, 0, 0, 0),
(427, 0, 0, 0, 0, 0, 'Nobility Quarter 7', 2, 13, 765, 765, 1, 1, 30, 0, 0, 0, 0),
(428, 0, 0, 0, 0, 0, 'Nobility Quarter 6', 2, 13, 765, 765, 1, 1, 36, 0, 0, 0, 0),
(429, 0, 0, 0, 0, 0, 'Nobility Quarter 4', 2, 13, 765, 765, 1, 1, 30, 0, 0, 0, 0),
(430, 0, 0, 0, 0, 0, 'Nobility Quarter 5', 2, 13, 765, 765, 1, 1, 36, 0, 0, 0, 0),
(435, 0, 0, 0, 0, 0, 'Castle Street 5', 9, 31, 1765, 1765, 1, 2, 61, 0, 0, 0, 0),
(436, 0, 0, 0, 0, 0, 'Castle Street 4', 9, 28, 1765, 1765, 1, 2, 64, 0, 0, 0, 0),
(437, 0, 0, 0, 0, 0, 'Castle Street 3', 9, 31, 1765, 1765, 1, 2, 64, 0, 0, 0, 0),
(438, 0, 0, 0, 0, 0, 'Castle Street 2', 9, 25, 1495, 1495, 1, 2, 56, 0, 0, 0, 0),
(439, 0, 0, 0, 0, 0, 'Castle Street 1', 9, 52, 2900, 2900, 1, 3, 112, 0, 0, 0, 0),
(440, 0, 0, 0, 0, 0, 'Edron Flats, Flat 08', 9, 7, 400, 400, 1, 1, 20, 0, 0, 0, 0),
(441, 0, 0, 0, 0, 0, 'Edron Flats, Flat 05', 9, 7, 400, 400, 1, 1, 20, 0, 0, 0, 0),
(442, 0, 0, 0, 0, 0, 'Edron Flats, Flat 04', 9, 7, 400, 400, 1, 1, 25, 0, 0, 0, 0),
(443, 0, 0, 0, 0, 0, 'Edron Flats, Flat 01', 9, 7, 400, 400, 1, 1, 25, 0, 0, 0, 0),
(444, 0, 0, 0, 0, 0, 'Edron Flats, Flat 07', 9, 7, 400, 400, 1, 1, 20, 0, 0, 0, 0),
(445, 0, 0, 0, 0, 0, 'Edron Flats, Flat 06', 9, 7, 400, 400, 1, 1, 20, 0, 0, 0, 0),
(446, 0, 0, 0, 0, 0, 'Edron Flats, Flat 03', 9, 7, 400, 400, 1, 1, 20, 0, 0, 0, 0),
(447, 0, 0, 0, 0, 0, 'Edron Flats, Flat 02', 9, 14, 860, 860, 1, 2, 40, 0, 0, 0, 0),
(448, 0, 0, 0, 0, 0, 'Edron Flats, Basement Flat 2', 9, 30, 1540, 1540, 1, 2, 54, 0, 0, 0, 0),
(449, 0, 0, 0, 0, 0, 'Edron Flats, Basement Flat 1', 9, 30, 1540, 1540, 1, 2, 63, 0, 0, 0, 0),
(450, 0, 0, 0, 0, 0, 'Edron Flats, Flat 18', 9, 7, 400, 400, 1, 1, 20, 0, 0, 0, 0),
(451, 0, 0, 0, 0, 0, 'Edron Flats, Flat 15', 9, 7, 400, 400, 1, 1, 20, 0, 0, 0, 0),
(452, 0, 0, 0, 0, 0, 'Edron Flats, Flat 14', 9, 7, 400, 400, 1, 1, 25, 0, 0, 0, 0),
(453, 0, 0, 0, 0, 0, 'Edron Flats, Flat 11', 9, 7, 400, 400, 1, 1, 25, 0, 0, 0, 0),
(454, 0, 0, 0, 0, 0, 'Edron Flats, Flat 17', 9, 7, 400, 400, 1, 1, 20, 0, 0, 0, 0),
(455, 0, 0, 0, 0, 0, 'Edron Flats, Flat 16', 9, 7, 400, 400, 1, 1, 20, 0, 0, 0, 0),
(456, 0, 0, 0, 0, 0, 'Edron Flats, Flat 13', 9, 7, 400, 400, 1, 1, 25, 0, 0, 0, 0),
(457, 0, 0, 0, 0, 0, 'Edron Flats, Flat 12', 9, 7, 400, 400, 1, 1, 25, 0, 0, 0, 0),
(458, 0, 0, 0, 0, 0, 'Edron Flats, Flat 28', 9, 7, 400, 400, 1, 1, 20, 0, 0, 0, 0),
(459, 0, 0, 0, 0, 0, 'Edron Flats, Flat 25', 9, 7, 400, 400, 1, 1, 20, 0, 0, 0, 0),
(460, 0, 0, 0, 0, 0, 'Edron Flats, Flat 24', 9, 7, 400, 400, 1, 1, 20, 0, 0, 0, 0),
(461, 0, 0, 0, 0, 0, 'Edron Flats, Flat 21', 9, 13, 860, 860, 1, 2, 40, 0, 0, 0, 0),
(462, 0, 0, 0, 0, 0, 'Edron Flats, Flat 27', 9, 7, 400, 400, 1, 1, 20, 0, 0, 0, 0),
(463, 0, 0, 0, 0, 0, 'Edron Flats, Flat 26', 9, 7, 400, 400, 1, 1, 20, 0, 0, 0, 0),
(464, 0, 0, 0, 0, 0, 'Edron Flats, Flat 23', 9, 7, 400, 400, 1, 1, 25, 0, 0, 0, 0),
(465, 0, 0, 0, 0, 0, 'Edron Flats, Flat 22', 9, 7, 400, 400, 1, 1, 25, 0, 0, 0, 0),
(466, 0, 0, 0, 0, 0, 'Central Circle 1', 9, 65, 3020, 3020, 3, 2, 120, 0, 0, 0, 0),
(467, 0, 0, 0, 0, 0, 'Central Circle 2', 9, 72, 3300, 3300, 3, 2, 120, 0, 0, 0, 0),
(468, 0, 0, 0, 0, 0, 'Central Circle 3', 9, 78, 4160, 4160, 5, 5, 147, 0, 0, 0, 0),
(469, 0, 0, 0, 0, 0, 'Central Circle 4', 9, 78, 4160, 4160, 5, 5, 147, 0, 0, 0, 0),
(470, 0, 0, 0, 0, 0, 'Central Circle 5', 9, 78, 4160, 4160, 5, 5, 153, 0, 0, 0, 0),
(471, 0, 0, 0, 0, 0, 'Central Circle 6 (Shop)', 9, 84, 3980, 3980, 6, 2, 168, 0, 0, 0, 0),
(472, 0, 0, 0, 0, 0, 'Central Circle 7 (Shop)', 9, 84, 3980, 3980, 6, 2, 168, 0, 0, 0, 0),
(473, 0, 0, 0, 0, 0, 'Central Circle 8 (Shop)', 9, 84, 3980, 3980, 6, 2, 192, 0, 0, 0, 0),
(474, 0, 0, 0, 0, 0, 'Wood Avenue 10a', 9, 25, 1540, 1540, 2, 2, 64, 0, 0, 0, 0),
(475, 0, 0, 0, 0, 0, 'Wood Avenue 9a', 9, 25, 1540, 1540, 2, 2, 56, 0, 0, 0, 0),
(476, 0, 0, 0, 0, 0, 'Wood Avenue 6a', 9, 22, 1450, 1450, 3, 2, 56, 0, 0, 0, 0),
(477, 0, 0, 0, 0, 0, 'Wood Avenue 6b', 9, 22, 1450, 1450, 3, 2, 56, 0, 0, 0, 0),
(478, 0, 0, 0, 0, 0, 'Wood Avenue 9b', 9, 24, 1495, 1495, 2, 2, 56, 0, 0, 0, 0),
(479, 0, 0, 0, 0, 0, 'Wood Avenue 10b', 9, 21, 1595, 1595, 3, 3, 64, 0, 0, 0, 0),
(480, 0, 0, 0, 0, 0, 'Wood Avenue 7', 9, 113, 5960, 5960, 5, 3, 216, 0, 0, 0, 0),
(481, 0, 0, 0, 0, 0, 'Wood Avenue 8', 9, 113, 5960, 5960, 5, 3, 179, 0, 0, 0, 0),
(482, 0, 0, 0, 0, 0, 'Wood Avenue 11', 9, 123, 7205, 7205, 7, 6, 264, 0, 0, 0, 0),
(483, 0, 0, 0, 0, 0, 'Sky Lane, Guild 1', 9, 340, 21145, 21145, 11, 23, 686, 0, 0, 0, 0),
(484, 0, 0, 0, 0, 0, 'Sky Lane, Guild 2', 9, 328, 19300, 19300, 12, 14, 676, 0, 0, 0, 0),
(485, 0, 0, 0, 0, 0, 'Sky Lane, Sea Tower', 9, 78, 4775, 4775, 3, 6, 196, 0, 0, 0, 0),
(486, 0, 0, 0, 0, 0, 'Sky Lane, Guild 3', 9, 292, 17315, 17315, 10, 18, 576, 0, 0, 0, 0),
(487, 0, 0, 0, 0, 0, 'Central Circle 9a', 9, 15, 940, 940, 1, 2, 42, 0, 0, 0, 0),
(488, 0, 0, 0, 0, 0, 'Central Circle 9b', 9, 15, 940, 940, 1, 2, 42, 0, 0, 0, 0),
(489, 0, 0, 0, 0, 0, 'Wood Avenue 5', 9, 31, 1765, 1765, 1, 2, 64, 0, 0, 0, 0),
(490, 0, 0, 0, 0, 0, 'Wood Avenue 4', 9, 31, 1765, 1765, 1, 2, 64, 0, 0, 0, 0),
(491, 0, 0, 0, 0, 0, 'Wood Avenue 3', 9, 31, 1765, 1765, 1, 2, 56, 0, 0, 0, 0),
(492, 0, 0, 0, 0, 0, 'Wood Avenue 2', 9, 31, 1765, 1765, 1, 2, 56, 0, 0, 0, 0),
(493, 0, 0, 0, 0, 0, 'Wood Avenue 1', 9, 31, 1765, 1765, 1, 2, 64, 0, 0, 0, 0),
(494, 0, 0, 0, 0, 0, 'Wood Avenue 4b', 9, 25, 1495, 1495, 1, 2, 56, 0, 0, 0, 0),
(495, 0, 0, 0, 0, 0, 'Wood Avenue 4a', 9, 25, 1495, 1495, 1, 2, 56, 0, 0, 0, 0),
(496, 0, 0, 0, 0, 0, 'Wood Avenue 4c', 9, 31, 1765, 1765, 1, 2, 57, 0, 0, 0, 0),
(497, 0, 0, 0, 0, 0, 'Castle Shop 1', 9, 31, 1890, 1890, 4, 1, 70, 0, 0, 0, 0),
(498, 0, 0, 0, 0, 0, 'Castle Shop 2', 9, 31, 1890, 1890, 4, 1, 70, 0, 0, 0, 0),
(499, 0, 0, 0, 0, 0, 'Castle Shop 3', 9, 32, 1890, 1890, 4, 1, 79, 0, 0, 0, 0),
(500, 0, 0, 0, 0, 0, 'Castle, Basement, Flat 01', 9, 10, 585, 585, 1, 1, 30, 0, 0, 0, 0),
(501, 0, 0, 0, 0, 0, 'Castle, Basement, Flat 05', 9, 10, 585, 585, 1, 1, 24, 0, 0, 0, 0),
(502, 0, 0, 0, 0, 0, 'Castle, Basement, Flat 06', 9, 10, 585, 585, 1, 1, 24, 0, 0, 0, 0),
(503, 0, 0, 0, 0, 0, 'Castle, Basement, Flat 09', 9, 10, 585, 585, 1, 1, 30, 0, 0, 0, 0),
(504, 0, 0, 0, 0, 0, 'Castle, Basement, Flat 02', 9, 10, 585, 585, 1, 1, 24, 0, 0, 0, 0),
(505, 0, 0, 0, 0, 0, 'Castle, Basement, Flat 03', 9, 10, 585, 585, 1, 1, 24, 0, 0, 0, 0),
(506, 0, 0, 0, 0, 0, 'Castle, Basement, Flat 04', 9, 10, 585, 585, 1, 1, 24, 0, 0, 0, 0),
(507, 0, 0, 0, 0, 0, 'Castle, Basement, Flat 07', 9, 10, 585, 585, 1, 1, 24, 0, 0, 0, 0),
(508, 0, 0, 0, 0, 0, 'Castle, Basement, Flat 08', 9, 10, 585, 585, 1, 1, 30, 0, 0, 0, 0),
(509, 0, 0, 0, 0, 0, 'Castle, 3rd Floor, Flat 07', 9, 13, 720, 720, 1, 1, 30, 0, 0, 0, 0),
(510, 0, 0, 0, 0, 0, 'Castle, 3rd Floor, Flat 04', 9, 10, 585, 585, 1, 1, 25, 0, 0, 0, 0),
(511, 0, 0, 0, 0, 0, 'Castle, 3rd Floor, Flat 03', 9, 10, 585, 585, 1, 1, 30, 0, 0, 0, 0),
(512, 0, 0, 0, 0, 0, 'Castle, 3rd Floor, Flat 06', 9, 16, 1045, 1045, 1, 2, 36, 0, 0, 0, 0),
(513, 0, 0, 0, 0, 0, 'Castle, 3rd Floor, Flat 05', 9, 14, 765, 765, 1, 1, 30, 0, 0, 0, 0),
(514, 0, 0, 0, 0, 0, 'Castle, 3rd Floor, Flat 02', 9, 14, 765, 765, 1, 1, 30, 0, 0, 0, 0),
(515, 0, 0, 0, 0, 0, 'Castle, 3rd Floor, Flat 01', 9, 10, 585, 585, 1, 1, 30, 0, 0, 0, 0),
(516, 0, 0, 0, 0, 0, 'Castle, 4th Floor, Flat 09', 9, 13, 720, 720, 1, 1, 28, 0, 0, 0, 0),
(517, 0, 0, 0, 0, 0, 'Castle, 4th Floor, Flat 08', 9, 18, 945, 945, 1, 1, 42, 0, 0, 0, 0),
(518, 0, 0, 0, 0, 0, 'Castle, 4th Floor, Flat 07', 9, 13, 720, 720, 1, 1, 30, 0, 0, 0, 0),
(519, 0, 0, 0, 0, 0, 'Castle, 4th Floor, Flat 06', 9, 18, 1045, 1045, 1, 1, 36, 0, 0, 0, 0),
(520, 0, 0, 0, 0, 0, 'Castle, 4th Floor, Flat 04', 9, 10, 585, 585, 1, 1, 25, 0, 0, 0, 0),
(521, 0, 0, 0, 0, 0, 'Castle, 4th Floor, Flat 05', 9, 14, 765, 765, 1, 1, 30, 0, 0, 0, 0),
(522, 0, 0, 0, 0, 0, 'Castle, 4th Floor, Flat 03', 9, 10, 585, 585, 1, 1, 30, 0, 0, 0, 0),
(523, 0, 0, 0, 0, 0, 'Castle, 4th Floor, Flat 02', 9, 14, 765, 765, 1, 1, 30, 0, 0, 0, 0),
(524, 0, 0, 0, 0, 0, 'Castle, 4th Floor, Flat 01', 9, 10, 585, 585, 1, 1, 30, 0, 0, 0, 0),
(526, 0, 0, 0, 0, 0, 'Stonehome Village 1', 9, 35, 1780, 1780, 2, 2, 77, 0, 0, 0, 0),
(527, 0, 0, 0, 0, 0, 'Stonehome Flats, Flat 05', 9, 7, 400, 400, 1, 1, 20, 0, 0, 0, 0),
(528, 0, 0, 0, 0, 0, 'Stonehome Flats, Flat 04', 9, 7, 400, 400, 1, 1, 25, 0, 0, 0, 0),
(529, 0, 0, 0, 0, 0, 'Stonehome Flats, Flat 01', 9, 7, 400, 400, 1, 1, 25, 0, 0, 0, 0),
(530, 0, 0, 0, 0, 0, 'Stonehome Flats, Flat 06', 9, 7, 400, 400, 1, 1, 20, 0, 0, 0, 0),
(531, 0, 0, 0, 0, 0, 'Stonehome Flats, Flat 03', 9, 7, 400, 400, 1, 1, 20, 0, 0, 0, 0),
(532, 0, 0, 0, 0, 0, 'Stonehome Flats, Flat 02', 9, 11, 740, 740, 1, 2, 35, 0, 0, 0, 0),
(533, 0, 0, 0, 0, 0, 'Stonehome Flats, Flat 15', 9, 7, 400, 400, 1, 1, 20, 0, 0, 0, 0),
(534, 0, 0, 0, 0, 0, 'Stonehome Flats, Flat 14', 9, 7, 400, 400, 1, 1, 20, 0, 0, 0, 0),
(535, 0, 0, 0, 0, 0, 'Stonehome Flats, Flat 11', 9, 11, 740, 740, 1, 2, 35, 0, 0, 0, 0),
(536, 0, 0, 0, 0, 0, 'Stonehome Flats, Flat 16', 9, 7, 400, 400, 1, 1, 20, 0, 0, 0, 0),
(537, 0, 0, 0, 0, 0, 'Stonehome Flats, Flat 13', 9, 7, 400, 400, 1, 1, 20, 0, 0, 0, 0),
(538, 0, 0, 0, 0, 0, 'Stonehome Flats, Flat 12', 9, 11, 740, 740, 1, 2, 35, 0, 0, 0, 0),
(540, 0, 0, 0, 0, 0, 'Stonehome Village 7', 9, 21, 1140, 1140, 1, 2, 49, 0, 0, 0, 0),
(541, 0, 0, 0, 0, 0, 'Stonehome Village 8', 9, 13, 680, 680, 1, 1, 36, 0, 0, 0, 0),
(542, 0, 0, 0, 0, 0, 'Stonehome Village 9', 9, 12, 680, 680, 1, 1, 36, 0, 0, 0, 0),
(543, 0, 0, 0, 0, 0, 'Stonehome Clanhall', 9, 147, 8580, 8580, 15, 10, 364, 0, 0, 0, 0),
(544, 0, 0, 0, 0, 0, 'Stonehome Village 6', 9, 22, 1300, 1300, 1, 2, 55, 0, 0, 0, 0),
(545, 0, 0, 0, 0, 0, 'Stonehome Village 5', 9, 20, 1140, 1140, 1, 2, 49, 0, 0, 0, 0),
(546, 0, 0, 0, 0, 0, 'Stonehome Village 2', 9, 12, 640, 640, 1, 1, 35, 0, 0, 0, 0),
(547, 0, 0, 0, 0, 0, 'Stonehome Village 3', 9, 13, 680, 680, 1, 1, 36, 0, 0, 0, 0),
(548, 0, 0, 0, 0, 0, 'Stonehome Village 4', 9, 15, 940, 940, 1, 2, 42, 0, 0, 0, 0),
(600, 0, 0, 0, 0, 0, 'Cormaya 2', 9, 64, 3710, 3710, 3, 3, 144, 0, 0, 0, 0),
(601, 0, 0, 0, 0, 0, 'Cormaya 1', 9, 20, 1270, 1270, 1, 2, 49, 0, 0, 0, 0),
(602, 0, 0, 0, 0, 0, 'Cormaya Flats, Flat 01', 9, 7, 450, 450, 1, 1, 20, 0, 0, 0, 0),
(603, 0, 0, 0, 0, 0, 'Cormaya Flats, Flat 02', 9, 7, 450, 450, 1, 1, 20, 0, 0, 0, 0),
(604, 0, 0, 0, 0, 0, 'Cormaya Flats, Flat 03', 9, 11, 820, 820, 1, 2, 34, 0, 0, 0, 0),
(605, 0, 0, 0, 0, 0, 'Cormaya Flats, Flat 06', 9, 7, 450, 450, 1, 1, 20, 0, 0, 0, 0),
(606, 0, 0, 0, 0, 0, 'Cormaya Flats, Flat 05', 9, 7, 450, 450, 1, 1, 20, 0, 0, 0, 0),
(607, 0, 0, 0, 0, 0, 'Cormaya Flats, Flat 04', 9, 11, 820, 820, 1, 2, 35, 0, 0, 0, 0),
(608, 0, 0, 0, 0, 0, 'Cormaya Flats, Flat 11', 9, 7, 450, 450, 1, 1, 20, 0, 0, 0, 0),
(609, 0, 0, 0, 0, 0, 'Cormaya Flats, Flat 12', 9, 7, 450, 450, 1, 1, 20, 0, 0, 0, 0),
(610, 0, 0, 0, 0, 0, 'Cormaya Flats, Flat 13', 9, 11, 820, 820, 1, 2, 34, 0, 0, 0, 0),
(611, 0, 0, 0, 0, 0, 'Cormaya Flats, Flat 16', 9, 7, 450, 450, 1, 1, 20, 0, 0, 0, 0),
(612, 0, 0, 0, 0, 0, 'Cormaya Flats, Flat 15', 9, 7, 450, 450, 1, 1, 16, 0, 0, 0, 0),
(613, 0, 0, 0, 0, 0, 'Cormaya Flats, Flat 14', 9, 11, 820, 820, 1, 2, 33, 0, 0, 0, 0),
(615, 0, 0, 0, 0, 0, 'Cormaya 3', 9, 37, 2035, 2035, 1, 2, 72, 0, 0, 0, 0),
(616, 0, 0, 0, 0, 0, 'Cormaya 4', 9, 30, 1720, 1720, 1, 2, 63, 0, 0, 0, 0),
(617, 0, 0, 0, 0, 0, 'Cormaya 6', 9, 45, 2395, 2395, 1, 2, 84, 0, 0, 0, 0),
(618, 0, 0, 0, 0, 0, 'Cormaya 7', 9, 45, 2395, 2395, 1, 2, 84, 0, 0, 0, 0),
(619, 0, 0, 0, 0, 0, 'Cormaya 8', 9, 51, 2395, 2395, 2, 2, 106, 0, 0, 0, 0),
(620, 0, 0, 0, 0, 0, 'Darashia 1, Flat 01', 7, 19, 1100, 1100, 1, 2, 48, 0, 0, 0, 0),
(621, 0, 0, 0, 0, 0, 'Darashia 1, Flat 02', 7, 21, 1000, 1000, 1, 1, 42, 0, 0, 0, 0),
(622, 0, 0, 0, 0, 0, 'Darashia 1, Flat 03', 7, 47, 2660, 2660, 3, 4, 96, 0, 0, 0, 0),
(623, 0, 0, 0, 0, 0, 'Darashia 1, Flat 04', 7, 21, 1000, 1000, 1, 1, 42, 0, 0, 0, 0),
(624, 0, 0, 0, 0, 0, 'Darashia 1, Flat 05', 7, 20, 1100, 1100, 1, 2, 48, 0, 0, 0, 0),
(625, 0, 0, 0, 0, 0, 'Darashia 1, Flat 11', 7, 19, 1100, 1100, 1, 2, 36, 0, 0, 0, 0),
(626, 0, 0, 0, 0, 0, 'Darashia 1, Flat 12', 7, 32, 1780, 1780, 2, 2, 72, 0, 0, 0, 0),
(627, 0, 0, 0, 0, 0, 'Darashia 1, Flat 13', 7, 35, 1780, 1780, 2, 2, 72, 0, 0, 0, 0),
(628, 0, 0, 0, 0, 0, 'Darashia 1, Flat 14', 7, 45, 2760, 2760, 3, 5, 108, 0, 0, 0, 0),
(629, 0, 0, 0, 0, 0, 'Darashia 2, Flat 03', 7, 25, 1160, 1160, 1, 1, 42, 0, 0, 0, 0),
(630, 0, 0, 0, 0, 0, 'Darashia 2, Flat 04', 7, 10, 520, 520, 1, 1, 24, 0, 0, 0, 0),
(631, 0, 0, 0, 0, 0, 'Darashia 2, Flat 05', 7, 23, 1260, 1260, 1, 2, 48, 0, 0, 0, 0),
(632, 0, 0, 0, 0, 0, 'Darashia 2, Flat 06', 7, 10, 520, 520, 1, 1, 24, 0, 0, 0, 0),
(633, 0, 0, 0, 0, 0, 'Darashia 2, Flat 07', 7, 21, 1000, 1000, 1, 1, 48, 0, 0, 0, 0),
(634, 0, 0, 0, 0, 0, 'Darashia 2, Flat 01', 7, 21, 1000, 1000, 1, 1, 48, 0, 0, 0, 0),
(635, 0, 0, 0, 0, 0, 'Darashia 2, Flat 02', 7, 21, 1000, 1000, 1, 1, 42, 0, 0, 0, 0),
(636, 0, 0, 0, 0, 0, 'Darashia 2, Flat 14', 7, 10, 520, 520, 1, 1, 24, 0, 0, 0, 0),
(637, 0, 0, 0, 0, 0, 'Darashia 2, Flat 13', 7, 25, 1160, 1160, 1, 1, 42, 0, 0, 0, 0),
(638, 0, 0, 0, 0, 0, 'Darashia 2, Flat 15', 7, 23, 1260, 1260, 1, 2, 47, 0, 0, 0, 0),
(639, 0, 0, 0, 0, 0, 'Darashia 2, Flat 16', 7, 14, 680, 680, 1, 1, 30, 0, 0, 0, 0),
(640, 0, 0, 0, 0, 0, 'Darashia 2, Flat 17', 7, 21, 1000, 1000, 1, 1, 48, 0, 0, 0, 0),
(641, 0, 0, 0, 0, 0, 'Darashia 2, Flat 18', 7, 14, 680, 680, 1, 1, 30, 0, 0, 0, 0),
(642, 0, 0, 0, 0, 0, 'Darashia 2, Flat 11', 7, 21, 1000, 1000, 1, 1, 42, 0, 0, 0, 0),
(643, 0, 0, 0, 0, 0, 'Darashia 2, Flat 12', 7, 10, 520, 520, 1, 1, 24, 0, 0, 0, 0),
(644, 0, 0, 0, 0, 0, 'Darashia, Western Guildhall', 7, 144, 10435, 10435, 16, 14, 376, 0, 0, 0, 0),
(645, 0, 0, 0, 0, 0, 'Darashia, Eastern Guildhall', 7, 188, 12660, 12660, 15, 16, 456, 0, 0, 0, 0),
(646, 0, 0, 0, 0, 0, 'Darashia, Villa', 7, 86, 5385, 5385, 11, 4, 233, 0, 0, 0, 0),
(647, 0, 0, 0, 0, 0, 'Darashia 6a', 7, 59, 3115, 3115, 3, 2, 117, 0, 0, 0, 0),
(648, 0, 0, 0, 0, 0, 'Darashia 6b', 7, 66, 3430, 3430, 2, 2, 139, 0, 0, 0, 0),
(649, 0, 0, 0, 0, 0, 'Darashia 5, Flat 05', 7, 21, 1000, 1000, 1, 1, 48, 0, 0, 0, 0),
(650, 0, 0, 0, 0, 0, 'Darashia 5, Flat 04', 7, 31, 1620, 1620, 2, 2, 66, 0, 0, 0, 0),
(651, 0, 0, 0, 0, 0, 'Darashia 5, Flat 03', 7, 22, 1000, 1000, 1, 1, 42, 0, 0, 0, 0),
(652, 0, 0, 0, 0, 0, 'Darashia 5, Flat 02', 7, 31, 1620, 1620, 2, 2, 60, 0, 0, 0, 0),
(653, 0, 0, 0, 0, 0, 'Darashia 5, Flat 01', 7, 21, 1000, 1000, 1, 1, 48, 0, 0, 0, 0),
(654, 0, 0, 0, 0, 0, 'Darashia 5, Flat 11', 7, 35, 1780, 1780, 2, 2, 67, 0, 0, 0, 0),
(655, 0, 0, 0, 0, 0, 'Darashia 5, Flat 12', 7, 31, 1620, 1620, 2, 2, 65, 0, 0, 0, 0),
(656, 0, 0, 0, 0, 0, 'Darashia 5, Flat 13', 7, 35, 1780, 1780, 2, 2, 78, 0, 0, 0, 0),
(657, 0, 0, 0, 0, 0, 'Darashia 5, Flat 14', 7, 31, 1620, 1620, 2, 2, 66, 0, 0, 0, 0),
(658, 0, 0, 0, 0, 0, 'Darashia 7, Flat 01', 7, 21, 1125, 1125, 1, 1, 42, 0, 0, 0, 0),
(659, 0, 0, 0, 0, 0, 'Darashia 7, Flat 02', 7, 18, 1125, 1125, 1, 1, 42, 0, 0, 0, 0),
(660, 0, 0, 0, 0, 0, 'Darashia 7, Flat 03', 7, 43, 2955, 2955, 3, 4, 108, 0, 0, 0, 0),
(661, 0, 0, 0, 0, 0, 'Darashia 7, Flat 04', 7, 21, 1125, 1125, 1, 1, 42, 0, 0, 0, 0),
(662, 0, 0, 0, 0, 0, 'Darashia 7, Flat 05', 7, 19, 1225, 1225, 1, 2, 40, 0, 0, 0, 0),
(663, 0, 0, 0, 0, 0, 'Darashia 7, Flat 11', 7, 21, 1125, 1125, 1, 1, 42, 0, 0, 0, 0),
(664, 0, 0, 0, 0, 0, 'Darashia 7, Flat 12', 7, 44, 2955, 2955, 3, 4, 93, 0, 0, 0, 0),
(665, 0, 0, 0, 0, 0, 'Darashia 7, Flat 13', 7, 30, 1125, 1125, 2, 3, 78, 0, 0, 0, 0),
(666, 0, 0, 0, 0, 0, 'Darashia 7, Flat 14', 7, 35, 2955, 2955, 2, 2, 72, 0, 0, 0, 0),
(667, 0, 0, 0, 0, 0, 'Darashia 4, Flat 01', 7, 21, 1000, 1000, 1, 1, 48, 0, 0, 0, 0),
(668, 0, 0, 0, 0, 0, 'Darashia 4, Flat 02', 7, 35, 1780, 1780, 2, 2, 66, 0, 0, 0, 0),
(669, 0, 0, 0, 0, 0, 'Darashia 4, Flat 03', 7, 21, 1000, 1000, 1, 1, 42, 0, 0, 0, 0),
(670, 0, 0, 0, 0, 0, 'Darashia 4, Flat 04', 7, 35, 1780, 1780, 2, 2, 72, 0, 0, 0, 0),
(671, 0, 0, 0, 0, 0, 'Darashia 4, Flat 05', 7, 20, 1100, 1100, 1, 2, 48, 0, 0, 0, 0),
(672, 0, 0, 0, 0, 0, 'Darashia 4, Flat 11', 7, 21, 1000, 1000, 1, 1, 42, 0, 0, 0, 0),
(673, 0, 0, 0, 0, 0, 'Darashia 4, Flat 12', 7, 49, 2560, 2560, 3, 3, 93, 0, 0, 0, 0),
(674, 0, 0, 0, 0, 0, 'Darashia 4, Flat 13', 7, 35, 1780, 1780, 2, 2, 78, 0, 0, 0, 0),
(675, 0, 0, 0, 0, 0, 'Darashia 4, Flat 14', 7, 35, 1780, 1780, 2, 2, 72, 0, 0, 0, 0),
(676, 0, 0, 0, 0, 0, 'Darashia 3, Flat 01', 7, 20, 1100, 1100, 1, 2, 43, 0, 0, 0, 0),
(677, 0, 0, 0, 0, 0, 'Darashia 3, Flat 02', 7, 31, 1620, 1620, 2, 2, 65, 0, 0, 0, 0),
(678, 0, 0, 0, 0, 0, 'Darashia 3, Flat 03', 7, 19, 1100, 1100, 1, 2, 42, 0, 0, 0, 0),
(679, 0, 0, 0, 0, 0, 'Darashia 3, Flat 04', 7, 31, 1620, 1620, 2, 2, 72, 0, 0, 0, 0),
(680, 0, 0, 0, 0, 0, 'Darashia 3, Flat 05', 7, 21, 1000, 1000, 1, 1, 40, 0, 0, 0, 0),
(681, 0, 0, 0, 0, 0, 'Darashia 3, Flat 11', 7, 18, 1000, 1000, 1, 1, 42, 0, 0, 0, 0),
(682, 0, 0, 0, 0, 0, 'Darashia 3, Flat 12', 7, 41, 2600, 2600, 3, 5, 90, 0, 0, 0, 0),
(683, 0, 0, 0, 0, 0, 'Darashia 3, Flat 13', 7, 20, 1100, 1100, 1, 2, 42, 0, 0, 0, 0),
(684, 0, 0, 0, 0, 0, 'Darashia 3, Flat 14', 7, 45, 2400, 2400, 3, 3, 102, 0, 0, 0, 0),
(685, 0, 0, 0, 0, 0, 'Darashia 8, Flat 01', 7, 47, 2485, 2485, 1, 2, 83, 0, 0, 0, 0),
(686, 0, 0, 0, 0, 0, 'Darashia 8, Flat 02', 7, 66, 3385, 3385, 2, 2, 113, 0, 0, 0, 0),
(687, 0, 0, 0, 0, 0, 'Darashia 8, Flat 03', 7, 88, 4700, 4700, 5, 3, 186, 0, 0, 0, 0),
(688, 0, 0, 0, 0, 0, 'Darashia 8, Flat 04', 7, 56, 2845, 2845, 1, 2, 96, 0, 0, 0, 0),
(689, 0, 0, 0, 0, 0, 'Darashia 8, Flat 05', 7, 52, 2665, 2665, 1, 2, 91, 0, 0, 0, 0),
(690, 0, 0, 0, 0, 0, 'Darashia 8, Flat 11', 7, 35, 1990, 1990, 2, 2, 67, 0, 0, 0, 0),
(691, 0, 0, 0, 0, 0, 'Darashia 8, Flat 12', 7, 28, 1810, 1810, 2, 2, 63, 0, 0, 0, 0),
(692, 0, 0, 0, 0, 0, 'Darashia 8, Flat 13', 7, 32, 1990, 1990, 2, 2, 77, 0, 0, 0, 0),
(693, 0, 0, 0, 0, 0, 'Darashia 8, Flat 14', 7, 31, 1810, 1810, 2, 2, 66, 0, 0, 0, 0),
(696, 0, 0, 0, 0, 0, 'Oskahl I f', 6, 17, 840, 840, 1, 1, 42, 0, 0, 0, 0),
(697, 0, 0, 0, 0, 0, 'Oskahl I g', 6, 20, 1140, 1140, 1, 2, 35, 0, 0, 0, 0),
(698, 0, 0, 0, 0, 0, 'Oskahl I h', 6, 29, 1760, 1760, 3, 3, 74, 0, 0, 0, 0),
(699, 0, 0, 0, 0, 0, 'Oskahl I i', 6, 18, 840, 840, 1, 1, 36, 0, 0, 0, 0),
(700, 0, 0, 0, 0, 0, 'Oskahl I j', 6, 13, 680, 680, 1, 1, 36, 0, 0, 0, 0);
INSERT INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`, `bid`, `highest_bidder`) VALUES
(701, 0, 0, 0, 0, 0, 'Oskahl I d', 6, 21, 1140, 1140, 1, 2, 36, 0, 0, 0, 0),
(702, 0, 0, 0, 0, 0, 'Oskahl I b', 6, 17, 840, 840, 1, 1, 30, 0, 0, 0, 0),
(703, 0, 0, 0, 0, 0, 'Oskahl I c', 6, 14, 680, 680, 1, 1, 30, 0, 0, 0, 0),
(704, 0, 0, 0, 0, 0, 'Oskahl I e', 6, 17, 840, 840, 1, 1, 42, 0, 0, 0, 0),
(705, 0, 0, 0, 0, 0, 'Oskahl I a', 6, 31, 1580, 1580, 1, 2, 64, 0, 0, 0, 0),
(706, 0, 0, 0, 0, 0, 'Chameken I', 6, 13, 850, 850, 1, 1, 36, 0, 0, 0, 0),
(707, 0, 0, 0, 0, 0, 'Charsirakh III', 6, 13, 680, 680, 1, 1, 36, 0, 0, 0, 0),
(708, 0, 0, 0, 0, 0, 'Murkhol I d', 6, 8, 440, 440, 1, 1, 21, 0, 0, 0, 0),
(709, 0, 0, 0, 0, 0, 'Murkhol I c', 6, 8, 440, 440, 1, 1, 27, 0, 0, 0, 0),
(710, 0, 0, 0, 0, 0, 'Murkhol I b', 6, 8, 440, 440, 1, 1, 24, 0, 0, 0, 0),
(711, 0, 0, 0, 0, 0, 'Murkhol I a', 6, 8, 440, 440, 1, 1, 21, 0, 0, 0, 0),
(712, 0, 0, 0, 0, 0, 'Chameken II', 6, 13, 850, 850, 1, 1, 36, 0, 0, 0, 0),
(713, 0, 0, 0, 0, 0, 'Thanah II g', 6, 25, 1650, 1650, 1, 2, 51, 0, 0, 0, 0),
(714, 0, 0, 0, 0, 0, 'Thanah II h', 6, 19, 1400, 1400, 2, 2, 55, 0, 0, 0, 0),
(715, 0, 0, 0, 0, 0, 'Thanah II f', 6, 42, 2850, 2850, 3, 3, 86, 0, 0, 0, 0),
(716, 0, 0, 0, 0, 0, 'Thanah II d', 6, 4, 350, 350, 1, 1, 16, 0, 0, 0, 0),
(717, 0, 0, 0, 0, 0, 'Thanah II e', 6, 4, 350, 350, 1, 1, 20, 0, 0, 0, 0),
(718, 0, 0, 0, 0, 0, 'Thanah II c', 6, 6, 450, 450, 1, 1, 20, 0, 0, 0, 0),
(719, 0, 0, 0, 0, 0, 'Thanah II b', 6, 6, 450, 450, 1, 1, 20, 0, 0, 0, 0),
(720, 0, 0, 0, 0, 0, 'Thanah II a', 6, 13, 850, 850, 1, 1, 36, 0, 0, 0, 0),
(721, 0, 0, 0, 0, 0, 'Charsirakh II', 6, 20, 1140, 1140, 1, 2, 49, 0, 0, 0, 0),
(722, 0, 0, 0, 0, 0, 'Charsirakh I b', 6, 31, 1580, 1580, 1, 2, 64, 0, 0, 0, 0),
(723, 0, 0, 0, 0, 0, 'Charsirakh I a', 6, 4, 280, 280, 1, 1, 20, 0, 0, 0, 0),
(724, 0, 0, 0, 0, 0, 'Harrah I', 6, 94, 5740, 5740, 6, 10, 232, 0, 0, 0, 0),
(725, 0, 0, 0, 0, 0, 'Othehothep I d', 6, 31, 2020, 2020, 3, 4, 84, 0, 0, 0, 0),
(726, 0, 0, 0, 0, 0, 'Othehothep I c', 6, 29, 1320, 1320, 2, 3, 60, 0, 0, 0, 0),
(727, 0, 0, 0, 0, 0, 'Othehothep I b', 6, 26, 1380, 1380, 2, 2, 64, 0, 0, 0, 0),
(728, 0, 0, 0, 0, 0, 'Othehothep I a', 6, 4, 280, 280, 1, 1, 20, 0, 0, 0, 0),
(729, 0, 0, 0, 0, 0, 'Othehothep II c', 6, 17, 840, 840, 1, 1, 30, 0, 0, 0, 0),
(730, 0, 0, 0, 0, 0, 'Othehothep II e', 6, 25, 1340, 1340, 1, 2, 48, 0, 0, 0, 0),
(731, 0, 0, 0, 0, 0, 'Othehothep II f', 6, 25, 1340, 1340, 1, 2, 56, 0, 0, 0, 0),
(732, 0, 0, 0, 0, 0, 'Othehothep II d', 6, 17, 840, 840, 1, 1, 35, 0, 0, 0, 0),
(733, 0, 0, 0, 0, 0, 'Othehothep II b', 6, 33, 1920, 1920, 3, 3, 81, 0, 0, 0, 0),
(734, 0, 0, 0, 0, 0, 'Othehothep II a', 6, 7, 400, 400, 1, 1, 25, 0, 0, 0, 0),
(735, 0, 0, 0, 0, 0, 'Mothrem I', 6, 21, 1140, 1140, 1, 2, 49, 0, 0, 0, 0),
(736, 0, 0, 0, 0, 0, 'Thanah I c', 6, 50, 3250, 3250, 4, 3, 98, 0, 0, 0, 0),
(737, 0, 0, 0, 0, 0, 'Thanah I d', 6, 39, 2900, 2900, 4, 4, 98, 0, 0, 0, 0),
(738, 0, 0, 0, 0, 0, 'Thanah I b', 6, 47, 3000, 3000, 3, 3, 100, 0, 0, 0, 0),
(739, 0, 0, 0, 0, 0, 'Thanah I a', 6, 13, 850, 850, 1, 1, 36, 0, 0, 0, 0),
(740, 0, 0, 0, 0, 0, 'Arakmehn I', 6, 21, 1320, 1320, 1, 3, 52, 0, 0, 0, 0),
(741, 0, 0, 0, 0, 0, 'Arakmehn II', 6, 21, 1040, 1040, 1, 1, 49, 0, 0, 0, 0),
(742, 0, 0, 0, 0, 0, 'Arakmehn III', 6, 20, 1140, 1140, 1, 2, 49, 0, 0, 0, 0),
(743, 0, 0, 0, 0, 0, 'Othehothep III c', 6, 16, 940, 940, 1, 2, 30, 0, 0, 0, 0),
(744, 0, 0, 0, 0, 0, 'Othehothep III e', 6, 17, 840, 840, 1, 1, 36, 0, 0, 0, 0),
(745, 0, 0, 0, 0, 0, 'Othehothep III d', 6, 22, 1040, 1040, 1, 1, 41, 0, 0, 0, 0),
(746, 0, 0, 0, 0, 0, 'Othehothep III f', 6, 13, 680, 680, 1, 1, 36, 0, 0, 0, 0),
(747, 0, 0, 0, 0, 0, 'Othehothep III b', 6, 23, 1340, 1340, 3, 2, 64, 0, 0, 0, 0),
(748, 0, 0, 0, 0, 0, 'Othehothep III a', 6, 4, 280, 280, 1, 1, 20, 0, 0, 0, 0),
(749, 0, 0, 0, 0, 0, 'Thrarhor I a (Shop)', 6, 11, 1050, 1050, 1, 1, 32, 0, 0, 0, 0),
(750, 0, 0, 0, 0, 0, 'Thrarhor I c (Shop)', 6, 10, 1050, 1050, 1, 1, 32, 0, 0, 0, 0),
(751, 0, 0, 0, 0, 0, 'Thrarhor I d (Shop)', 6, 10, 1050, 1050, 1, 1, 32, 0, 0, 0, 0),
(752, 0, 0, 0, 0, 0, 'Thrarhor I b (Shop)', 6, 10, 1050, 1050, 1, 1, 32, 0, 0, 0, 0),
(753, 0, 0, 0, 0, 0, 'Unklath I d', 6, 29, 1680, 1680, 1, 3, 49, 0, 0, 0, 0),
(754, 0, 0, 0, 0, 0, 'Unklath I e', 6, 32, 1580, 1580, 1, 2, 56, 0, 0, 0, 0),
(755, 0, 0, 0, 0, 0, 'Unklath I f', 6, 31, 1580, 1580, 1, 2, 56, 0, 0, 0, 0),
(756, 0, 0, 0, 0, 0, 'Unklath I g', 6, 34, 1480, 1480, 1, 1, 64, 0, 0, 0, 0),
(757, 0, 0, 0, 0, 0, 'Unklath I b', 6, 27, 1460, 1460, 2, 2, 55, 0, 0, 0, 0),
(758, 0, 0, 0, 0, 0, 'Unklath I c', 6, 27, 1460, 1460, 2, 2, 66, 0, 0, 0, 0),
(759, 0, 0, 0, 0, 0, 'Unklath I a', 6, 20, 1140, 1140, 1, 2, 49, 0, 0, 0, 0),
(760, 0, 0, 0, 0, 0, 'Arakmehn IV', 6, 22, 1220, 1220, 1, 2, 52, 0, 0, 0, 0),
(761, 0, 0, 0, 0, 0, 'Unklath II b', 6, 13, 680, 680, 1, 1, 25, 0, 0, 0, 0),
(762, 0, 0, 0, 0, 0, 'Unklath II c', 6, 14, 680, 680, 1, 1, 30, 0, 0, 0, 0),
(763, 0, 0, 0, 0, 0, 'Unklath II d', 6, 31, 1580, 1580, 1, 2, 66, 0, 0, 0, 0),
(764, 0, 0, 0, 0, 0, 'Unklath II a', 6, 22, 1040, 1040, 1, 1, 49, 0, 0, 0, 0),
(765, 0, 0, 0, 0, 0, 'Rathal I b', 6, 14, 680, 680, 1, 1, 25, 0, 0, 0, 0),
(766, 0, 0, 0, 0, 0, 'Rathal I d', 6, 12, 780, 780, 1, 2, 30, 0, 0, 0, 0),
(767, 0, 0, 0, 0, 0, 'Rathal I e', 6, 11, 780, 780, 1, 2, 36, 0, 0, 0, 0),
(768, 0, 0, 0, 0, 0, 'Rathal I c', 6, 14, 680, 680, 1, 1, 30, 0, 0, 0, 0),
(769, 0, 0, 0, 0, 0, 'Rathal I a', 6, 20, 1140, 1140, 1, 2, 49, 0, 0, 0, 0),
(770, 0, 0, 0, 0, 0, 'Rathal II b', 6, 13, 680, 680, 1, 1, 25, 0, 0, 0, 0),
(771, 0, 0, 0, 0, 0, 'Rathal II c', 6, 14, 680, 680, 1, 1, 30, 0, 0, 0, 0),
(772, 0, 0, 0, 0, 0, 'Rathal II d', 6, 27, 1460, 1460, 2, 2, 66, 0, 0, 0, 0),
(773, 0, 0, 0, 0, 0, 'Rathal II a', 6, 22, 1040, 1040, 1, 1, 49, 0, 0, 0, 0),
(774, 0, 0, 0, 0, 0, 'Esuph I', 6, 13, 680, 680, 1, 1, 36, 0, 0, 0, 0),
(775, 0, 0, 0, 0, 0, 'Esuph II b', 6, 25, 1380, 1380, 2, 2, 64, 0, 0, 0, 0),
(776, 0, 0, 0, 0, 0, 'Esuph II a', 6, 4, 280, 280, 1, 1, 20, 0, 0, 0, 0),
(777, 0, 0, 0, 0, 0, 'Esuph III b', 6, 23, 1340, 1340, 3, 2, 64, 0, 0, 0, 0),
(778, 0, 0, 0, 0, 0, 'Esuph III a', 6, 4, 280, 280, 1, 1, 20, 0, 0, 0, 0),
(779, 0, 0, 0, 0, 0, 'Esuph IV b', 6, 7, 400, 400, 1, 1, 16, 0, 0, 0, 0),
(780, 0, 0, 0, 0, 0, 'Esuph IV d', 6, 16, 800, 800, 2, 1, 45, 0, 0, 0, 0),
(781, 0, 0, 0, 0, 0, 'Esuph IV c', 6, 7, 400, 400, 1, 1, 20, 0, 0, 0, 0),
(782, 0, 0, 0, 0, 0, 'Esuph IV a', 6, 7, 400, 400, 1, 1, 25, 0, 0, 0, 0),
(784, 0, 0, 0, 0, 0, 'Botham II d', 6, 31, 1950, 1950, 1, 2, 49, 0, 0, 0, 0),
(785, 0, 0, 0, 0, 0, 'Botham II e', 6, 25, 1650, 1650, 1, 2, 49, 0, 0, 0, 0),
(786, 0, 0, 0, 0, 0, 'Botham II f', 6, 25, 1650, 1650, 1, 2, 49, 0, 0, 0, 0),
(787, 0, 0, 0, 0, 0, 'Botham II g', 6, 20, 1400, 1400, 1, 2, 49, 0, 0, 0, 0),
(788, 0, 0, 0, 0, 0, 'Botham II b', 6, 24, 1600, 1600, 2, 2, 50, 0, 0, 0, 0),
(789, 0, 0, 0, 0, 0, 'Botham II c', 6, 17, 1250, 1250, 2, 2, 50, 0, 0, 0, 0),
(790, 0, 0, 0, 0, 0, 'Botham II a', 6, 13, 850, 850, 1, 1, 36, 0, 0, 0, 0),
(791, 0, 0, 0, 0, 0, 'Uthemath II', 6, 76, 4460, 4460, 3, 8, 170, 0, 0, 0, 0),
(792, 0, 0, 0, 0, 0, 'Botham III f', 6, 35, 2350, 2350, 1, 3, 56, 0, 0, 0, 0),
(793, 0, 0, 0, 0, 0, 'Botham III g', 6, 25, 1650, 1650, 1, 2, 49, 0, 0, 0, 0),
(794, 0, 0, 0, 0, 0, 'Botham III h', 6, 61, 3750, 3750, 3, 3, 120, 0, 0, 0, 0),
(795, 0, 0, 0, 0, 0, 'Botham III b', 6, 12, 950, 950, 1, 2, 25, 0, 0, 0, 0),
(796, 0, 0, 0, 0, 0, 'Botham III c', 6, 13, 850, 850, 1, 1, 30, 0, 0, 0, 0),
(797, 0, 0, 0, 0, 0, 'Botham III d', 6, 13, 850, 850, 1, 1, 30, 0, 0, 0, 0),
(798, 0, 0, 0, 0, 0, 'Botham III e', 6, 13, 850, 850, 1, 1, 36, 0, 0, 0, 0),
(799, 0, 0, 0, 0, 0, 'Botham III a', 6, 20, 1400, 1400, 1, 2, 49, 0, 0, 0, 0),
(800, 0, 0, 0, 0, 0, 'Uthemath I d', 6, 17, 840, 840, 1, 1, 30, 0, 0, 0, 0),
(801, 0, 0, 0, 0, 0, 'Uthemath I e', 6, 16, 940, 940, 1, 2, 35, 0, 0, 0, 0),
(802, 0, 0, 0, 0, 0, 'Uthemath I f', 6, 44, 2440, 2440, 4, 3, 104, 0, 0, 0, 0),
(803, 0, 0, 0, 0, 0, 'Uthemath I b', 6, 15, 800, 800, 2, 1, 36, 0, 0, 0, 0),
(804, 0, 0, 0, 0, 0, 'Uthemath I a', 6, 7, 400, 400, 1, 1, 25, 0, 0, 0, 0),
(805, 0, 0, 0, 0, 0, 'Botham I c', 6, 25, 1700, 1700, 2, 2, 49, 0, 0, 0, 0),
(806, 0, 0, 0, 0, 0, 'Botham I e', 6, 25, 1650, 1650, 1, 2, 49, 0, 0, 0, 0),
(807, 0, 0, 0, 0, 0, 'Botham I d', 6, 48, 3050, 3050, 2, 3, 98, 0, 0, 0, 0),
(808, 0, 0, 0, 0, 0, 'Botham I b', 6, 46, 3000, 3000, 3, 3, 100, 0, 0, 0, 0),
(809, 0, 0, 0, 0, 0, 'Botham I a', 6, 15, 950, 950, 1, 1, 39, 0, 0, 0, 0),
(810, 0, 0, 0, 0, 0, 'Ramen Tah', 6, 83, 7650, 7650, 5, 16, 225, 0, 0, 0, 0),
(811, 0, 0, 0, 0, 0, 'Botham IV f', 6, 25, 1700, 1700, 2, 2, 49, 0, 0, 0, 0),
(812, 0, 0, 0, 0, 0, 'Botham IV h', 6, 33, 1850, 1850, 1, 1, 56, 0, 0, 0, 0),
(813, 0, 0, 0, 0, 0, 'Botham IV g', 6, 23, 1650, 1650, 3, 2, 56, 0, 0, 0, 0),
(814, 0, 0, 0, 0, 0, 'Botham IV i', 6, 23, 1800, 1800, 2, 3, 64, 0, 0, 0, 0),
(815, 0, 0, 0, 0, 0, 'Botham IV b', 6, 14, 850, 850, 1, 1, 25, 0, 0, 0, 0),
(816, 0, 0, 0, 0, 0, 'Botham IV d', 6, 13, 850, 850, 1, 1, 30, 0, 0, 0, 0),
(817, 0, 0, 0, 0, 0, 'Botham IV e', 6, 13, 850, 850, 1, 1, 36, 0, 0, 0, 0),
(818, 0, 0, 0, 0, 0, 'Botham IV c', 6, 13, 850, 850, 1, 1, 30, 0, 0, 0, 0),
(819, 0, 0, 0, 0, 0, 'Botham IV a', 6, 20, 1400, 1400, 1, 2, 49, 0, 0, 0, 0),
(820, 0, 0, 0, 0, 0, 'Cormaya 5', 9, 94, 5375, 5375, 2, 3, 182, 0, 0, 0, 0),
(822, 0, 0, 0, 0, 0, 'Cormaya 10.', 9, 71, 3800, 3800, 2, 3, 130, 0, 0, 0, 0),
(823, 0, 0, 0, 0, 0, 'Cormaya 11', 9, 34, 2035, 2035, 1, 2, 72, 0, 0, 0, 0),
(824, 0, 0, 0, 0, 0, 'Castle of the White Dragon', 9, 426, 25110, 25110, 16, 19, 897, 0, 0, 0, 0),
(825, 0, 0, 0, 0, 0, 'Fibula Clanhall', 3, 122, 11430, 11430, 12, 10, 305, 0, 0, 0, 0),
(826, 0, 0, 0, 0, 0, 'Fibula Village, Villa', 3, 194, 10590, 10590, 13, 7, 433, 0, 0, 0, 0),
(827, 0, 0, 0, 0, 0, 'Fibula Village, Bar', 3, 56, 5230, 5230, 3, 2, 127, 0, 0, 0, 0),
(828, 0, 0, 0, 0, 0, 'Fibula Village 5', 3, 20, 1790, 1790, 1, 2, 42, 0, 0, 0, 0),
(829, 0, 0, 0, 0, 0, 'Fibula Village 4', 3, 20, 1790, 1790, 1, 2, 48, 0, 0, 0, 0),
(831, 0, 0, 0, 0, 0, 'Fibula Village 3', 3, 41, 3810, 3810, 1, 4, 110, 0, 0, 0, 0),
(832, 0, 0, 0, 0, 0, 'Mercenary Tower', 3, 508, 41955, 41955, 18, 26, 999, 0, 0, 0, 0),
(833, 0, 0, 0, 0, 0, 'Fibula Village 2', 3, 10, 845, 845, 1, 1, 30, 0, 0, 0, 0),
(834, 0, 0, 0, 0, 0, 'Fibula Village 1', 3, 10, 845, 845, 1, 1, 30, 0, 0, 0, 0),
(835, 0, 0, 0, 0, 0, 'The Hideout', 1, 318, 20800, 20800, 14, 20, 634, 0, 0, 0, 0),
(836, 0, 0, 0, 0, 0, 'Uthemath I c', 6, 13, 900, 900, 2, 2, 45, 0, 0, 0, 0),
(837, 0, 0, 0, 0, 0, 'Central Plaza 1', 5, 8, 600, 600, 1, 0, 24, 0, 0, 0, 0),
(838, 0, 0, 0, 0, 0, 'Central Plaza 2', 5, 8, 600, 600, 1, 0, 24, 0, 0, 0, 0),
(839, 0, 0, 0, 0, 0, 'Central Plaza 3', 5, 8, 600, 600, 1, 0, 24, 0, 0, 0, 0),
(840, 0, 0, 0, 0, 0, 'Theater Avenue 11a', 5, 23, 1405, 1405, 1, 2, 54, 0, 0, 0, 0),
(841, 0, 0, 0, 0, 0, 'Theater Avenue 11b', 5, 10, 585, 585, 1, 1, 24, 0, 0, 0, 0),
(842, 0, 0, 0, 0, 0, 'Cormaya 9a', 9, 19, 1225, 1225, 1, 2, 48, 0, 0, 0, 0),
(843, 0, 0, 0, 0, 0, 'Cormaya 9b', 9, 46, 2620, 2620, 2, 2, 88, 0, 0, 0, 0),
(844, 0, 0, 0, 0, 0, 'Cormaya 9c', 9, 19, 1225, 1225, 1, 2, 48, 0, 0, 0, 0),
(845, 0, 0, 0, 0, 0, 'Cormaya 9d', 9, 46, 2620, 2620, 2, 2, 88, 0, 0, 0, 0),
(846, 0, 0, 0, 0, 0, 'Magic Academy, Flat 1', 9, 14, 1465, 1465, 2, 3, 55, 0, 0, 0, 0),
(847, 0, 0, 0, 0, 0, 'Magic Academy, Flat 2', 9, 20, 1530, 1530, 1, 2, 55, 0, 0, 0, 0),
(848, 0, 0, 0, 0, 0, 'Magic Academy, Flat 3', 9, 171, 1430, 1430, 12, 10, 348, 0, 0, 0, 0),
(849, 0, 0, 0, 0, 0, 'Magic Academy, Flat 4', 9, 22, 1530, 1530, 2, 3, 62, 0, 0, 0, 0),
(850, 0, 0, 0, 0, 0, 'Magic Academy, Flat 5', 9, 21, 1430, 1430, 2, 2, 62, 0, 0, 0, 0),
(851, 0, 0, 0, 0, 0, 'Magic Academy, Shop', 9, 22, 1595, 1595, 2, 2, 58, 0, 0, 0, 0),
(852, 0, 0, 0, 0, 0, 'Magic Academy, Guild', 9, 138, 12025, 12025, 8, 15, 423, 0, 0, 0, 0),
(853, 0, 0, 0, 0, 0, 'Fibula Village, Tower Flat', 3, 79, 5170, 5170, 2, 4, 183, 0, 0, 0, 0),
(854, 0, 0, 0, 0, 0, 'Greenshore Village 2', 3, 13, 780, 780, 2, 2, 37, 0, 0, 0, 0),
(855, 0, 0, 0, 0, 0, 'Greenshore Village 3', 3, 11, 780, 780, 2, 2, 30, 0, 0, 0, 0),
(856, 0, 0, 0, 0, 0, 'Greenshore Village 4', 3, 11, 780, 780, 2, 2, 30, 0, 0, 0, 0),
(857, 0, 0, 0, 0, 0, 'Greenshore Village 5', 3, 11, 780, 780, 2, 2, 30, 0, 0, 0, 0),
(858, 0, 0, 0, 0, 0, 'Greenshore Village 6', 3, 64, 4360, 4360, 4, 2, 133, 0, 0, 0, 0),
(859, 0, 0, 0, 0, 0, 'Harbour Street 4', 3, 19, 935, 935, 2, 1, 43, 0, 0, 0, 0),
(862, 0, 0, 0, 0, 0, 'Sorcerer\'s Avenue Labs 2a', 3, 6, 715, 715, 1, 1, 24, 0, 0, 0, 0),
(863, 0, 0, 0, 0, 0, 'Sorcerer\'s Avenue Labs 2b', 3, 6, 715, 715, 1, 1, 24, 0, 0, 0, 0),
(864, 0, 0, 0, 0, 0, 'Sorcerer\'s Avenue Labs 2c', 3, 6, 715, 715, 1, 1, 25, 0, 0, 0, 0),
(865, 0, 0, 0, 0, 0, 'Sorcerer\'s Avenue Labs 2d', 3, 6, 715, 715, 1, 1, 24, 0, 0, 0, 0),
(866, 0, 0, 0, 0, 0, 'Sorcerer\'s Avenue Labs 2e', 3, 6, 715, 715, 1, 1, 24, 0, 0, 0, 0),
(867, 0, 0, 0, 0, 0, 'Sorcerer\'s Avenue Labs 2f', 3, 6, 715, 715, 1, 1, 24, 0, 0, 0, 0),
(868, 0, 0, 0, 0, 0, 'Thais Hostel', 3, 62, 6980, 6980, 3, 24, 171, 0, 0, 0, 0),
(869, 0, 0, 0, 0, 0, 'Guildhall of the Red Rose', 3, 329, 27725, 27725, 8, 15, 598, 0, 0, 0, 0),
(871, 0, 0, 0, 0, 0, 'Market Street 7', 4, 41, 2305, 2305, 3, 2, 114, 0, 0, 0, 0),
(872, 0, 0, 0, 0, 0, 'Senja Village 10', 5, 27, 1485, 1485, 1, 1, 72, 0, 0, 0, 0),
(873, 0, 0, 0, 0, 0, 'Senja Village 11', 5, 47, 2620, 2620, 2, 2, 93, 0, 0, 0, 0),
(874, 0, 0, 0, 0, 0, 'Senja Village 1a', 5, 14, 765, 765, 1, 1, 36, 0, 0, 0, 0),
(875, 0, 0, 0, 0, 0, 'Senja Village 1b', 5, 25, 1630, 1630, 2, 2, 66, 0, 0, 0, 0),
(876, 0, 0, 0, 0, 0, 'Senja Village 2', 5, 13, 765, 765, 1, 1, 36, 0, 0, 0, 0),
(877, 0, 0, 0, 0, 0, 'Senja Village 3', 5, 31, 1765, 1765, 1, 2, 63, 0, 0, 0, 0),
(878, 0, 0, 0, 0, 0, 'Senja Village 4', 5, 13, 765, 765, 1, 1, 30, 0, 0, 0, 0),
(879, 0, 0, 0, 0, 0, 'Senja Village 5', 5, 19, 1225, 1225, 1, 2, 48, 0, 0, 0, 0),
(880, 0, 0, 0, 0, 0, 'Senja Village 6a', 5, 13, 765, 765, 1, 1, 30, 0, 0, 0, 0),
(881, 0, 0, 0, 0, 0, 'Senja Village 6b', 5, 13, 765, 765, 1, 1, 30, 0, 0, 0, 0),
(882, 0, 0, 0, 0, 0, 'Senja Village 7', 5, 11, 865, 865, 1, 2, 36, 0, 0, 0, 0),
(883, 0, 0, 0, 0, 0, 'Senja Village 8', 5, 26, 1675, 1675, 1, 2, 59, 0, 0, 0, 0),
(884, 0, 0, 0, 0, 0, 'Senja Village 9', 5, 49, 2575, 2575, 3, 2, 106, 0, 0, 0, 0),
(885, 0, 0, 0, 0, 0, 'Senja Clanhall', 5, 156, 10575, 10575, 15, 10, 396, 0, 0, 0, 0),
(886, 0, 0, 0, 0, 0, 'Administrator\'s House', 11, 46, 32200, 0, 1, 0, 124, 0, 0, 0, 0),
(889, 0, 0, 0, 0, 0, 'Granite Guildhall', 2, 283, 17845, 17845, 18, 17, 617, 0, 0, 0, 0),
(891, 0, 0, 0, 0, 0, 'Wolftower', 2, 307, 21550, 21550, 19, 23, 710, 0, 0, 0, 0),
(892, 0, 0, 0, 0, 0, 'Riverspring', 2, 268, 19450, 19450, 23, 19, 632, 0, 0, 0, 0),
(893, 0, 0, 0, 0, 0, 'Outlaw Castle', 2, 0, 8000, 8000, 0, 0, 80, 0, 0, 0, 0),
(894, 0, 0, 0, 0, 0, 'Hill Hideout', 2, 192, 13950, 13950, 8, 15, 399, 0, 0, 0, 0),
(895, 0, 0, 0, 0, 0, 'Outlaw Camp 1', 2, 0, 1660, 1660, 0, 0, 32, 0, 0, 0, 0),
(897, 0, 0, 0, 0, 0, 'Outlaw Camp 3', 2, 0, 740, 740, 0, 0, 11, 0, 0, 0, 0),
(909, 0, 0, 0, 0, 0, 'The Farms 1', 2, 33, 2510, 2510, 2, 3, 78, 0, 0, 0, 0),
(910, 0, 0, 0, 0, 0, 'The Farms 2', 2, 20, 1530, 1530, 1, 2, 49, 0, 0, 0, 0),
(911, 0, 0, 0, 0, 0, 'The Farms 3', 2, 20, 1530, 1530, 1, 2, 49, 0, 0, 0, 0),
(912, 0, 0, 0, 0, 0, 'The Farms 4', 2, 20, 1530, 1530, 1, 2, 49, 0, 0, 0, 0),
(913, 0, 0, 0, 0, 0, 'The Farms 5', 2, 21, 1530, 1530, 1, 2, 49, 0, 0, 0, 0),
(914, 0, 0, 0, 0, 0, 'The Farms 6, Fishing Hut', 2, 15, 1255, 1255, 1, 2, 42, 0, 0, 0, 0),
(915, 0, 0, 0, 0, 0, 'Harbour Hutch 1', 13, 68, 48300, 0, 1, 1, 126, 0, 0, 0, 0),
(916, 0, 0, 0, 0, 0, 'Harbour Hutch 2', 13, 68, 48300, 0, 1, 1, 126, 0, 0, 0, 0),
(917, 0, 0, 0, 0, 0, 'Vangloria\'s Northern Street, House 1', 13, 68, 49000, 0, 1, 2, 128, 0, 0, 0, 0),
(918, 0, 0, 0, 0, 0, 'Vangloria\'s Northern Street, House 2', 13, 68, 49000, 0, 1, 2, 128, 0, 0, 0, 0),
(919, 0, 0, 0, 0, 0, 'Vangloria Center, House 10', 13, 58, 41300, 0, 1, 1, 112, 0, 0, 0, 0),
(920, 0, 0, 0, 0, 0, 'Vangloria Center, House 9', 13, 58, 41300, 0, 1, 1, 112, 0, 0, 0, 0),
(921, 0, 0, 0, 0, 0, 'Vangloria Center, House 8', 13, 56, 40600, 0, 1, 2, 112, 0, 0, 0, 0),
(922, 0, 0, 0, 0, 0, 'Vangloria Center, House 7', 13, 52, 37100, 0, 2, 1, 112, 0, 0, 0, 0),
(923, 0, 0, 0, 0, 0, 'Vangloria Center, House 6', 13, 56, 40600, 0, 1, 2, 112, 0, 0, 0, 0),
(924, 0, 0, 0, 0, 0, 'Vangloria Center, House 3', 13, 56, 40600, 0, 1, 2, 112, 0, 0, 0, 0),
(925, 0, 0, 0, 0, 0, 'Vangloria Center, House 15', 13, 56, 40600, 0, 1, 2, 112, 0, 0, 0, 0),
(926, 0, 0, 0, 0, 0, 'Vangloria Center, House 16', 13, 51, 36400, 0, 2, 1, 112, 0, 0, 0, 0),
(927, 0, 0, 0, 0, 0, 'Vangloria Center, House 17', 13, 56, 40600, 0, 1, 2, 112, 0, 0, 0, 0),
(928, 0, 0, 0, 0, 0, 'Vangloria Center, House 18', 13, 56, 40600, 0, 1, 2, 112, 0, 0, 0, 0),
(929, 0, 0, 0, 0, 0, 'Vangloria\'s South Complex, Flat 1', 13, 28, 20300, 0, 1, 1, 49, 0, 0, 0, 0),
(930, 0, 0, 0, 0, 0, 'Vangloria\'s South Complex, Flat 2', 13, 28, 20300, 0, 1, 1, 49, 0, 0, 0, 0),
(931, 0, 0, 0, 0, 0, 'Vangloria\'s South Complex, Flat 3', 13, 28, 20300, 0, 1, 1, 49, 0, 0, 0, 0),
(932, 0, 0, 0, 0, 0, 'Vangloria\'s South Complex, Flat 4', 13, 28, 20300, 0, 1, 1, 49, 0, 0, 0, 0),
(933, 0, 0, 0, 0, 0, 'Vangloria\'s South Complex, Flat 5', 13, 28, 20300, 0, 1, 1, 49, 0, 0, 0, 0),
(934, 0, 0, 0, 0, 0, 'Vangloria\'s South Complex, Flat 6', 13, 28, 20300, 0, 1, 1, 49, 0, 0, 0, 0),
(935, 0, 0, 0, 0, 0, 'Vangloria\'s South Complex, Flat 7', 13, 28, 20300, 0, 1, 1, 49, 0, 0, 0, 0),
(936, 0, 0, 0, 0, 0, 'Vangloria\'s South Complex, Flat 8', 13, 28, 20300, 0, 1, 1, 49, 0, 0, 0, 0),
(937, 0, 0, 0, 0, 0, 'Vangloria Center, House 19', 13, 56, 40600, 0, 1, 2, 112, 0, 0, 0, 0),
(938, 0, 0, 0, 0, 0, 'Vangloria Center, House 20', 13, 56, 40600, 0, 1, 2, 112, 0, 0, 0, 0),
(939, 0, 0, 0, 0, 0, 'Vangloria Center, House 14', 13, 56, 40600, 0, 1, 2, 112, 0, 0, 0, 0),
(940, 0, 0, 0, 0, 0, 'Vangloria Center, House 11', 13, 56, 40600, 0, 1, 2, 112, 0, 0, 0, 0),
(941, 0, 0, 0, 0, 0, 'Vangloria Center, House 12', 13, 56, 40600, 0, 1, 2, 112, 0, 0, 0, 0),
(942, 0, 0, 0, 0, 0, 'Vangloria Center, House 13', 13, 56, 40600, 0, 1, 2, 112, 0, 0, 0, 0),
(943, 0, 0, 0, 0, 0, 'Lion\'s Pride, Flat 1', 13, 34, 24500, 0, 1, 1, 56, 0, 0, 0, 0),
(944, 0, 0, 0, 0, 0, 'Lion\'s Pride, Flat 2', 13, 34, 24500, 0, 1, 1, 56, 0, 0, 0, 0),
(945, 0, 0, 0, 0, 0, 'Lion\'s Pride, Flat 3', 13, 66, 48300, 0, 1, 3, 98, 0, 0, 0, 0),
(946, 0, 0, 0, 0, 0, 'Lion\'s Pride, Flat 5', 13, 66, 48300, 0, 1, 3, 98, 0, 0, 0, 0),
(947, 0, 0, 0, 0, 0, 'Lion\'s Pride, Flat 4', 13, 34, 24500, 0, 1, 1, 48, 0, 0, 0, 0),
(948, 0, 0, 0, 0, 0, 'Lion\'s Pride, Flat 8', 13, 34, 24500, 0, 1, 1, 48, 0, 0, 0, 0),
(949, 0, 0, 0, 0, 0, 'Lion\'s Pride, Flat 6', 13, 34, 24500, 0, 1, 1, 56, 0, 0, 0, 0),
(950, 0, 0, 0, 0, 0, 'Lion\'s Pride, Flat 7', 13, 34, 24500, 0, 1, 1, 56, 0, 0, 0, 0),
(951, 0, 0, 0, 0, 0, 'Southern Gate, House 1', 13, 68, 49000, 0, 1, 2, 84, 0, 0, 0, 0),
(952, 0, 0, 0, 0, 0, 'Southern Gate, House 2', 13, 68, 49000, 0, 1, 2, 96, 0, 0, 0, 0),
(953, 0, 0, 0, 0, 0, 'Southern Gate, House 3', 13, 68, 49000, 0, 1, 2, 96, 0, 0, 0, 0),
(954, 0, 0, 0, 0, 0, 'Southern Gate, House 4', 13, 70, 49700, 0, 1, 1, 128, 0, 0, 0, 0),
(955, 0, 0, 0, 0, 0, 'Southern Gate, House 5', 13, 83, 58800, 0, 1, 1, 152, 0, 0, 0, 0),
(956, 0, 0, 0, 0, 0, 'Southern Gate, House 6', 13, 68, 49000, 0, 1, 2, 128, 0, 0, 0, 0),
(957, 0, 0, 0, 0, 0, 'Southern Gate, House 8', 13, 67, 47600, 0, 1, 1, 128, 0, 0, 0, 0),
(958, 0, 0, 0, 0, 0, 'Southern Gate, House 7', 13, 68, 49000, 0, 1, 2, 128, 0, 0, 0, 0),
(959, 0, 0, 0, 0, 0, 'Vangloria Center, House 2', 13, 88, 62300, 0, 1, 1, 164, 0, 0, 0, 0),
(960, 0, 0, 0, 0, 0, 'Vangloria Center, House 4', 13, 28, 20300, 0, 1, 1, 56, 0, 0, 0, 0),
(961, 0, 0, 0, 0, 0, 'Vangloria Center, House 5', 13, 22, 16100, 0, 1, 1, 48, 0, 0, 0, 0),
(962, 0, 0, 0, 0, 0, 'Vangloria Center, House 1', 13, 38, 28000, 0, 1, 2, 72, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `house_auctions`
--

CREATE TABLE `house_auctions` (
  `house_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL,
  `bid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `limit` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `endtime` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `house_data`
--

CREATE TABLE `house_data` (
  `house_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `house_data`
--

INSERT INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
(41, 0, 0x96003c000701000000bd048001000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f75736520274d61696e20486f7573652049272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303020676f6c6420636f696e732e00),
(42, 0, 0x9b003c000701000000bd048001000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f75736520274d61696e20686f757365204949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303020676f6c6420636f696e732e00),
(43, 0, 0xa0003c000701000000bd048001000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f75736520274d61696e20486f75736520494949272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303020676f6c6420636f696e732e00),
(44, 0, 0xae003c000701000000bd048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233434272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031353020676f6c6420636f696e732e00),
(45, 0, 0xb2003c000701000000bd048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233435272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031353020676f6c6420636f696e732e00),
(46, 0, 0xb4003e000601000000ba048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233436272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343020676f6c6420636f696e732e00),
(47, 0, 0xb40040000601000000ba048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233437272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031343020676f6c6420636f696e732e00),
(48, 0, 0xbc0042000601000000bd048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233438272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303020676f6c6420636f696e732e00b30046000601000000be048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233438272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303020676f6c6420636f696e732e00ba0044000601000000c4048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233438272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303020676f6c6420636f696e732e00bc0045000601000000be048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233438272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036303020676f6c6420636f696e732e00),
(49, 0, 0xac00430007010000001f0a170000000000b5004c000701000000c7048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233439272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203132373020676f6c6420636f696e732e00),
(50, 0, 0xbd004f000701000000bd048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233530272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033353020676f6c6420636f696e732e00),
(52, 0, 0xc6002c0007010000001f0a170000000000c8002c0007010000001f0a170000000000ca002c0007010000001f0a170000000000cc002c0007010000001f0a170000000000ce002c0007010000001f0a170000000000c50037000701000000c7048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233532272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131363020676f6c6420636f696e732e00),
(53, 0, 0xbd0022000701000000bd048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233533272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035353020676f6c6420636f696e732e00bc0029000701000000bd048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233533272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035353020676f6c6420636f696e732e00),
(54, 0, 0xc2001c000701000000bc048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233534272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034333020676f6c6420636f696e732e00),
(56, 0, 0xb40020000701000000bd048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233536272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036353020676f6c6420636f696e732e00),
(57, 0, 0xb10024000701000000c7048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233537272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363020676f6c6420636f696e732e00),
(60, 0, 0x940020000701000000bc048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233630272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036383020676f6c6420636f696e732e00),
(61, 0, 0x8b001b0006010000001d0a1700000000008c0020000701000000bc048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233631272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036333020676f6c6420636f696e732e00),
(62, 0, 0xa4001e000601000000ba048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233632272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036373020676f6c6420636f696e732e00a60020000601000000ba048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233632272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036373020676f6c6420636f696e732e00),
(63, 0, 0xa50023000601000000bc048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233633272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383020676f6c6420636f696e732e00),
(64, 0, 0xb5001f000601000000bd048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233634272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035303020676f6c6420636f696e732e00),
(65, 0, 0xb10023000601000000ba048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233635272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303020676f6c6420636f696e732e00),
(66, 0, 0xb1002d000601000000ba048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233636272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303020676f6c6420636f696e732e00),
(67, 0, 0xad0035000701000000bd048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233637272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034353020676f6c6420636f696e732e00b00038000701000000bd048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233637272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034353020676f6c6420636f696e732e00),
(69, 0, 0x8b0045000701000000c7048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233639272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034343020676f6c6420636f696e732e00),
(70, 0, 0x82004a000701000000b9048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233730272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032373020676f6c6420636f696e732e00),
(71, 0, 0x8f0047000701000000c7048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233731272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032313020676f6c6420636f696e732e00),
(72, 0, 0x9c0046000701000000bd048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233732272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732035393020676f6c6420636f696e732e00a600470007010000001f0a170000000000),
(73, 0, 0x7d001d000701000000c4048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233733272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303020676f6c6420636f696e732e007c0020000701000000bc048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233733272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034303020676f6c6420636f696e732e00),
(74, 0, 0x5c001b0007010000001e0a1700000000005f001e000601000000c3048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203533353020676f6c6420636f696e732e005f001e000701000000b9048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203533353020676f6c6420636f696e732e0063001a000601000000c3048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203533353020676f6c6420636f696e732e00600019000701000000bc048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203533353020676f6c6420636f696e732e0062001a000701000000b9048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203533353020676f6c6420636f696e732e006b001a000601000000c3048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203533353020676f6c6420636f696e732e006c001a000701000000b9048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203533353020676f6c6420636f696e732e006f0019000701000000bc048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203533353020676f6c6420636f696e732e0062001f000701000000b9048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203533353020676f6c6420636f696e732e006f001e000601000000c3048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203533353020676f6c6420636f696e732e006f001e000701000000b9048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203533353020676f6c6420636f696e732e0073001b000701000000200a170000000000610022000601000000c5048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203533353020676f6c6420636f696e732e00610022000701000000bc048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203533353020676f6c6420636f696e732e006e0022000601000000c5048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203533353020676f6c6420636f696e732e006e0022000701000000bc048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203533353020676f6c6420636f696e732e00),
(75, 0, 0x68002f000701000000bc048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233735272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203134353020676f6c6420636f696e732e005f00300007010000001f0a1700000000005e0035000701000000b9048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233735272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203134353020676f6c6420636f696e732e00700035000701000000b9048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233735272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203134353020676f6c6420636f696e732e00),
(76, 0, 0x50002a0007010000001f0a17000000000052002b000701000000b9048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033333020676f6c6420636f696e732e005a002c000701000000b9048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033333020676f6c6420636f696e732e00),
(77, 0, 0x4d001d000701000000b9048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233737272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036393020676f6c6420636f696e732e004b00200007010000001d0a170000000000550021000701000000bc048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233737272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732036393020676f6c6420636f696e732e00),
(78, 0, 0x7b004e0007010000001f0a1700000000007c0052000701000000b9048001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233738272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203131353020676f6c6420636f696e732e00),
(79, 0, 0x840057000701000000b9048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233739272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031383020676f6c6420636f696e732e00),
(80, 0, 0x84005c000701000000b9048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233830272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032333020676f6c6420636f696e732e00),
(81, 0, 0x8b0060000701000000b9048001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233831272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383020676f6c6420636f696e732e008d0063000701000000130700),
(82, 0, 0x830079000601000000d80d8001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233832272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034353020676f6c6420636f696e732e00850079000701000000d80d8001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233832272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732034353020676f6c6420636f696e732e00),
(83, 0, 0x9b0067000601000000cf0d8001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233833272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203133353020676f6c6420636f696e732e009a006b000701000000cf0d8001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233833272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203133353020676f6c6420636f696e732e00),
(84, 0, 0xab0065000701000000cf0d8001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233834272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031353020676f6c6420636f696e732e00),
(85, 0, 0xb00060000701000000cf0d8001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233835272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032383020676f6c6420636f696e732e00),
(86, 0, 0xb90060000701000000cf0d8001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233836272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363020676f6c6420636f696e732e00),
(87, 0, 0xb50068000701000000cf0d8001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233837272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303020676f6c6420636f696e732e00),
(88, 0, 0xba0065000701000000d80d8001000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233838272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031323020676f6c6420636f696e732e00),
(89, 0, 0xb9006a000701000000cf0d8001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233839272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130303020676f6c6420636f696e732e00b2006e000701000000d80d8001000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233839272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203130303020676f6c6420636f696e732e00);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `house_lists`
--

CREATE TABLE `house_lists` (
  `house_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `listid` int(11) NOT NULL,
  `list` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `killers`
--

CREATE TABLE `killers` (
  `id` int(11) NOT NULL,
  `death_id` int(11) NOT NULL,
  `final_hit` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `unjustified` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `war` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `group_id` int(11) NOT NULL DEFAULT 1,
  `account_id` int(11) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `vocation` int(11) NOT NULL DEFAULT 0,
  `health` int(11) NOT NULL DEFAULT 150,
  `healthmax` int(11) NOT NULL DEFAULT 150,
  `experience` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `lookbody` int(11) NOT NULL DEFAULT 0,
  `lookfeet` int(11) NOT NULL DEFAULT 0,
  `lookhead` int(11) NOT NULL DEFAULT 0,
  `looklegs` int(11) NOT NULL DEFAULT 0,
  `looktype` int(11) NOT NULL DEFAULT 136,
  `lookaddons` int(11) NOT NULL DEFAULT 0,
  `lookmount` int(11) NOT NULL DEFAULT 0,
  `maglevel` int(11) NOT NULL DEFAULT 0,
  `mana` int(11) NOT NULL DEFAULT 0,
  `manamax` int(11) NOT NULL DEFAULT 0,
  `manaspent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `soul` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `town_id` int(11) NOT NULL DEFAULT 0,
  `posx` int(11) NOT NULL DEFAULT 0,
  `posy` int(11) NOT NULL DEFAULT 0,
  `posz` int(11) NOT NULL DEFAULT 0,
  `conditions` blob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT 0,
  `sex` int(11) NOT NULL DEFAULT 0,
  `lastlogin` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `lastip` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `save` tinyint(1) NOT NULL DEFAULT 1,
  `skull` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `skulltime` int(11) NOT NULL DEFAULT 0,
  `rank_id` int(11) NOT NULL DEFAULT 0,
  `guildnick` varchar(255) NOT NULL DEFAULT '',
  `lastlogout` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `blessings` tinyint(2) NOT NULL DEFAULT 0,
  `pvp_blessing` tinyint(1) NOT NULL DEFAULT 0,
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `redskulltime` int(11) NOT NULL DEFAULT 0,
  `redskull` int(11) NOT NULL DEFAULT 0,
  `stamina` bigint(20) UNSIGNED NOT NULL DEFAULT 151200000 COMMENT 'stored in miliseconds',
  `direction` int(11) NOT NULL DEFAULT 2,
  `loss_experience` int(11) NOT NULL DEFAULT 100,
  `loss_mana` int(11) NOT NULL DEFAULT 100,
  `loss_skills` int(11) NOT NULL DEFAULT 100,
  `loss_containers` int(11) NOT NULL DEFAULT 100,
  `loss_items` int(11) NOT NULL DEFAULT 10,
  `premend` int(11) NOT NULL DEFAULT 0 COMMENT 'NOT IN USE BY THE SERVER',
  `online` tinyint(1) NOT NULL DEFAULT 0,
  `marriage` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `promotion` int(11) NOT NULL DEFAULT 0,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `delete_date` int(11) NOT NULL,
  `oldname` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `offlinetraining_time` smallint(5) UNSIGNED NOT NULL DEFAULT 43200,
  `offlinetraining_skill` int(11) NOT NULL DEFAULT -1,
  `skill_fist` int(10) NOT NULL DEFAULT 10,
  `skill_club` int(10) NOT NULL DEFAULT 10,
  `skill_sword` int(10) NOT NULL DEFAULT 10,
  `skill_axe` int(10) NOT NULL DEFAULT 10,
  `skill_dist` int(10) NOT NULL DEFAULT 10,
  `skill_shielding` int(10) NOT NULL DEFAULT 10,
  `skill_fishing` int(10) NOT NULL DEFAULT 10,
  `comment` text NOT NULL,
  `create_ip` int(11) NOT NULL DEFAULT 0,
  `create_date` int(11) NOT NULL DEFAULT 0,
  `hide_char` int(11) NOT NULL DEFAULT 0,
  `signature` text NOT NULL,
  `exphist_lastexp` bigint(255) NOT NULL DEFAULT 0,
  `exphist1` bigint(255) NOT NULL DEFAULT 0,
  `exphist2` bigint(255) NOT NULL DEFAULT 0,
  `exphist3` bigint(255) NOT NULL DEFAULT 0,
  `exphist4` bigint(255) NOT NULL DEFAULT 0,
  `exphist5` bigint(255) NOT NULL DEFAULT 0,
  `exphist6` bigint(255) NOT NULL DEFAULT 0,
  `exphist7` bigint(255) NOT NULL DEFAULT 0,
  `onlinetimetoday` bigint(255) NOT NULL DEFAULT 0,
  `onlinetime1` bigint(255) NOT NULL DEFAULT 0,
  `onlinetime2` bigint(255) NOT NULL DEFAULT 0,
  `onlinetime3` bigint(255) NOT NULL DEFAULT 0,
  `onlinetime4` bigint(255) NOT NULL DEFAULT 0,
  `onlinetime5` bigint(255) NOT NULL DEFAULT 0,
  `onlinetime6` bigint(255) NOT NULL DEFAULT 0,
  `onlinetime7` bigint(255) NOT NULL DEFAULT 0,
  `onlinetimeall` bigint(255) NOT NULL DEFAULT 0,
  `cast` tinyint(4) NOT NULL DEFAULT 0,
  `castViewers` int(11) NOT NULL DEFAULT 0,
  `castDescription` varchar(255) NOT NULL,
  `castPassword` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `players`
--

INSERT INTO `players` (`id`, `name`, `world_id`, `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `lookmount`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `rank_id`, `guildnick`, `lastlogout`, `blessings`, `pvp_blessing`, `balance`, `redskulltime`, `redskull`, `stamina`, `direction`, `loss_experience`, `loss_mana`, `loss_skills`, `loss_containers`, `loss_items`, `premend`, `online`, `marriage`, `promotion`, `deleted`, `delete_date`, `oldname`, `description`, `offlinetraining_time`, `offlinetraining_skill`, `skill_fist`, `skill_club`, `skill_sword`, `skill_axe`, `skill_dist`, `skill_shielding`, `skill_fishing`, `comment`, `create_ip`, `create_date`, `hide_char`, `signature`, `exphist_lastexp`, `exphist1`, `exphist2`, `exphist3`, `exphist4`, `exphist5`, `exphist6`, `exphist7`, `onlinetimetoday`, `onlinetime1`, `onlinetime2`, `onlinetime3`, `onlinetime4`, `onlinetime5`, `onlinetime6`, `onlinetime7`, `onlinetimeall`, `cast`, `castViewers`, `castDescription`, `castPassword`) VALUES
(1, 'Rook Sample', 0, 0, 3, 1, 0, 160, 160, 0, 1, 1, 1, 1, 136, 0, 0, 0, 0, 0, 0, 1, 1, 160, 54, 7, 0x30, 420, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 10, 10, 10, 10, 10, 10, 10, '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0),
(2, 'Admin2', 0, 6, 2, 1, 0, 150, 150, 0, 1, 1, 1, 1, 128, 0, 0, 0, 0, 0, 0, 1, 11, 32080, 32160, 7, '', 420, 1, 1545877212, 16777343, 1, 0, 0, 6, '0', 1545877529, 0, 0, 0, 0, 0, 151200000, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 43200, -1, 10, 10, 10, 10, 10, 10, 10, '', 2130706433, 1545873587, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0),
(3, 'Admin1', 0, 6, 3, 130, 1, 650, 650, 34963300, 0, 0, 0, 0, 136, 0, 0, 0, 3000, 3000, 0, 1, 1, 160, 54, 7, '', 1200, 0, 1584633449, 2047387840, 1, 0, 0, 6, '0', 1545888790, 0, 0, 0, 0, 0, 151200000, 0, 100, 0, 100, 100, 7, 0, 0, 0, 0, 0, 0, '', '', 43200, -1, 10, 10, 10, 10, 10, 10, 10, '', 1422597795, 1545877627, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0),
(4, 'Sorcerer Sample', 0, 0, 3, 8, 1, 185, 185, 4200, 36, 72, 128, 0, 131, 0, 0, 0, 25, 25, 0, 1, 1, 160, 54, 7, '', 480, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 10, 10, 10, 10, 10, 10, 10, '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0),
(5, 'Knight Sample', 0, 0, 3, 8, 4, 185, 185, 4200, 36, 72, 128, 0, 131, 0, 0, 0, 25, 25, 0, 1, 1, 160, 54, 7, '', 480, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 10, 10, 10, 10, 10, 10, 10, '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0),
(6, 'Druid Sample', 0, 0, 3, 8, 2, 185, 185, 4200, 36, 72, 128, 0, 131, 0, 0, 0, 25, 25, 0, 1, 1, 160, 54, 7, '', 480, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 10, 10, 10, 10, 10, 10, 10, '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0),
(7, 'Palladin Sample', 0, 0, 3, 8, 3, 185, 185, 4200, 36, 72, 128, 0, 131, 0, 0, 0, 25, 25, 0, 1, 1, 160, 54, 7, '', 480, 0, 0, 0, 0, 0, 0, 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 10, 10, 10, 10, 10, 10, 10, '', 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', 0);

--
-- Wyzwalacze `players`
--
DELIMITER $$
CREATE TRIGGER `oncreate_players` AFTER INSERT ON `players` FOR EACH ROW BEGIN



	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 0, 10);



	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 1, 10);



	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 2, 10);



	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 3, 10);



	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 4, 10);



	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 5, 10);



	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 6, 10);



END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ondelete_players` BEFORE DELETE ON `players` FOR EACH ROW BEGIN



	DELETE FROM `bans` WHERE `type` IN (2, 5) AND `value` = OLD.`id`;



	UPDATE `houses` SET `owner` = 0 WHERE `owner` = OLD.`id`;



END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `players_online`
--

CREATE TABLE `players_online` (
  `player_id` int(11) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_achievement`
--

CREATE TABLE `player_achievement` (
  `id` int(11) NOT NULL,
  `player_id` int(11) DEFAULT NULL,
  `achievement` varchar(255) NOT NULL,
  `date` int(11) NOT NULL DEFAULT 0,
  `monster` varchar(40) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `modus` int(11) NOT NULL DEFAULT 0 COMMENT '1 - task 2- events',
  `grade` int(11) NOT NULL DEFAULT 0 COMMENT 'stars on web'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_deaths`
--

CREATE TABLE `player_deaths` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL,
  `level` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_depotitems`
--

CREATE TABLE `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range, eg. 0-100 is reserved for depot lockers and all above 100 will be normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `player_depotitems`
--

INSERT INTO `player_depotitems` (`player_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(3, 101, 0, 2589, 1, 0x80010007006465706f7469640200000000),
(3, 102, 3, 2589, 1, 0x80010007006465706f7469640203000000),
(3, 103, 101, 2594, 1, ''),
(3, 104, 102, 2594, 1, '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_items`
--

CREATE TABLE `player_items` (
  `player_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `sid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `player_items`
--

INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`, `attributes`) VALUES
(2, 3, 101, 1988, 1, ''),
(2, 4, 102, 2650, 1, ''),
(2, 5, 103, 2512, 1, ''),
(2, 6, 104, 2120, 1, ''),
(2, 8, 105, 2643, 1, ''),
(2, 101, 106, 2674, 1, 0x0f01),
(2, 101, 107, 2152, 3, 0x0f03),
(2, 101, 108, 2050, 1, ''),
(3, 3, 101, 1988, 1, ''),
(3, 4, 102, 2465, 1, ''),
(3, 5, 103, 2530, 1, ''),
(3, 7, 104, 2478, 1, ''),
(3, 10, 105, 2160, 98, 0x0f62),
(3, 101, 106, 2148, 40, 0x0f28),
(3, 101, 107, 2152, 98, 0x0f62),
(3, 101, 108, 2798, 100, 0x0f64),
(3, 101, 109, 2358, 1, ''),
(3, 101, 110, 2376, 1, ''),
(3, 101, 111, 2643, 1, ''),
(3, 101, 112, 2304, 94, 0x800100070063686172676573025e000000),
(3, 101, 113, 1988, 1, ''),
(3, 101, 114, 2674, 1, 0x0f01),
(3, 113, 115, 2520, 1, ''),
(3, 113, 116, 2554, 1, '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_killers`
--

CREATE TABLE `player_killers` (
  `kill_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_namelocks`
--

CREATE TABLE `player_namelocks` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `new_name` varchar(255) NOT NULL,
  `date` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_skills`
--

CREATE TABLE `player_skills` (
  `player_id` int(11) NOT NULL,
  `skillid` tinyint(2) NOT NULL DEFAULT 0,
  `value` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `player_skills`
--

INSERT INTO `player_skills` (`player_id`, `skillid`, `value`, `count`) VALUES
(1, 0, 10, 0),
(1, 1, 10, 0),
(1, 2, 10, 0),
(1, 3, 10, 0),
(1, 4, 10, 0),
(1, 5, 10, 0),
(1, 6, 10, 0),
(2, 0, 10, 0),
(2, 1, 10, 0),
(2, 2, 10, 0),
(2, 3, 10, 0),
(2, 4, 10, 0),
(2, 5, 10, 0),
(2, 6, 10, 0),
(3, 0, 10, 0),
(3, 1, 10, 0),
(3, 2, 10, 0),
(3, 3, 10, 0),
(3, 4, 10, 0),
(3, 5, 10, 0),
(3, 6, 10, 0),
(4, 0, 10, 0),
(4, 1, 10, 0),
(4, 2, 10, 0),
(4, 3, 10, 0),
(4, 4, 10, 0),
(4, 5, 10, 0),
(4, 6, 10, 0),
(5, 0, 10, 0),
(5, 1, 10, 0),
(5, 2, 10, 0),
(5, 3, 10, 0),
(5, 4, 10, 0),
(5, 5, 10, 0),
(5, 6, 10, 0),
(6, 0, 10, 0),
(6, 1, 10, 0),
(6, 2, 10, 0),
(6, 3, 10, 0),
(6, 4, 10, 0),
(6, 5, 10, 0),
(6, 6, 10, 0),
(7, 0, 10, 0),
(7, 1, 10, 0),
(7, 2, 10, 0),
(7, 3, 10, 0),
(7, 4, 10, 0),
(7, 5, 10, 0),
(7, 6, 10, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_spells`
--

CREATE TABLE `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_storage`
--

CREATE TABLE `player_storage` (
  `player_id` int(11) NOT NULL,
  `key` varchar(32) NOT NULL DEFAULT '0',
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `player_storage`
--

INSERT INTO `player_storage` (`player_id`, `key`, `value`) VALUES
(2, '133', '100'),
(2, '300', '2'),
(2, '30201', '1'),
(2, '5788', '0'),
(2, '78011', '-1'),
(3, '133', '110'),
(3, '134', '110'),
(3, '1345', '1'),
(3, '300', '1'),
(3, '30201', '1'),
(3, '5788', '0'),
(3, '6507', '0'),
(3, '78011', '-1');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `player_viplist`
--

CREATE TABLE `player_viplist` (
  `player_id` int(11) NOT NULL,
  `vip_id` int(11) NOT NULL,
  `description` varchar(128) NOT NULL,
  `icon` int(11) UNSIGNED NOT NULL,
  `notify` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `realtibia_paygol`
--

CREATE TABLE `realtibia_paygol` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `price` varchar(11) NOT NULL,
  `points` int(11) NOT NULL,
  `operator` varchar(50) NOT NULL,
  `message_id` int(50) NOT NULL,
  `sender` int(50) NOT NULL,
  `message` int(50) NOT NULL,
  `method` varchar(20) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `realtibia_paypal`
--

CREATE TABLE `realtibia_paypal` (
  `id` int(11) NOT NULL,
  `txn_id` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `accid` int(11) NOT NULL,
  `price` varchar(11) NOT NULL,
  `points` int(11) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `created` datetime NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `server_config`
--

CREATE TABLE `server_config` (
  `config` varchar(35) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `server_config`
--

INSERT INTO `server_config` (`config`, `value`) VALUES
('encryption', '2');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `server_motd`
--

CREATE TABLE `server_motd` (
  `id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `server_motd`
--

INSERT INTO `server_motd` (`id`, `world_id`, `text`) VALUES
(75, 0, 'Welcome to the Demonia 7.4!'),
(76, 0, 'Welcome to the Demonia 7.4!\n We feature Anti-bot client and Legendary 7.4 experience!'),
(77, 0, 'tests');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `server_record`
--

CREATE TABLE `server_record` (
  `record` int(11) NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `server_record`
--

INSERT INTO `server_record` (`record`, `world_id`, `timestamp`) VALUES
(1, 0, 1545877212);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `server_reports`
--

CREATE TABLE `server_reports` (
  `id` int(11) NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL DEFAULT 1,
  `posx` int(11) NOT NULL DEFAULT 0,
  `posy` int(11) NOT NULL DEFAULT 0,
  `posz` int(11) NOT NULL DEFAULT 0,
  `timestamp` bigint(20) NOT NULL DEFAULT 0,
  `report` text NOT NULL,
  `reads` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tiles`
--

CREATE TABLE `tiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `house_id` int(10) UNSIGNED NOT NULL,
  `x` int(5) UNSIGNED NOT NULL,
  `y` int(5) UNSIGNED NOT NULL,
  `z` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tile_items`
--

CREATE TABLE `tile_items` (
  `tile_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tile_store`
--

CREATE TABLE `tile_store` (
  `house_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `z_featured_article`
--

CREATE TABLE `z_featured_article` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `text` varchar(600) NOT NULL,
  `date` varchar(30) NOT NULL,
  `author` varchar(50) NOT NULL,
  `read_more` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `z_forum`
--

CREATE TABLE `z_forum` (
  `id` int(11) NOT NULL,
  `first_post` int(11) NOT NULL DEFAULT 0,
  `last_post` int(11) NOT NULL DEFAULT 0,
  `section` int(3) NOT NULL DEFAULT 0,
  `replies` int(20) NOT NULL DEFAULT 0,
  `views` int(20) NOT NULL DEFAULT 0,
  `author_aid` int(20) NOT NULL DEFAULT 0,
  `author_guid` int(20) NOT NULL DEFAULT 0,
  `post_text` text NOT NULL,
  `post_topic` varchar(255) NOT NULL,
  `post_smile` tinyint(1) NOT NULL DEFAULT 0,
  `post_date` int(20) NOT NULL DEFAULT 0,
  `last_edit_aid` int(20) NOT NULL DEFAULT 0,
  `edit_date` int(20) NOT NULL DEFAULT 0,
  `post_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `icon_id` tinyint(4) NOT NULL DEFAULT 1,
  `post_icon_id` tinyint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `z_golden_system`
--

CREATE TABLE `z_golden_system` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `z_network_box`
--

CREATE TABLE `z_network_box` (
  `id` int(11) NOT NULL,
  `network_name` varchar(10) NOT NULL,
  `network_link` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `z_news_tickers`
--

CREATE TABLE `z_news_tickers` (
  `date` int(11) NOT NULL DEFAULT 1,
  `author` int(11) NOT NULL,
  `image_id` int(3) NOT NULL DEFAULT 0,
  `text` text NOT NULL,
  `hide_ticker` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `z_ots_comunication`
--

CREATE TABLE `z_ots_comunication` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `z_polls`
--

CREATE TABLE `z_polls` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `end` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `answers` int(11) NOT NULL,
  `votes_all` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `z_polls_answers`
--

CREATE TABLE `z_polls_answers` (
  `poll_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `z_raidsystem`
--

CREATE TABLE `z_raidsystem` (
  `id` int(11) NOT NULL,
  `raid_name` varchar(255) NOT NULL,
  `started` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `z_shop_history_item`
--

CREATE TABLE `z_shop_history_item` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT 0,
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `offer_id` varchar(255) NOT NULL DEFAULT '',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT 0,
  `trans_real` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `z_shop_offer`
--

CREATE TABLE `z_shop_offer` (
  `id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `itemid1` int(11) NOT NULL DEFAULT 0,
  `count1` int(11) NOT NULL DEFAULT 0,
  `itemid2` int(11) NOT NULL DEFAULT 0,
  `count2` int(11) NOT NULL DEFAULT 0,
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `z_shop_offer`
--

INSERT INTO `z_shop_offer` (`id`, `points`, `itemid1`, `count1`, `itemid2`, `count2`, `offer_type`, `offer_description`, `offer_name`) VALUES
(2, 25, 5748, 0, 0, 0, 'item', ' Complete full Blue Djinn Quest with one click.', '1x blue cup'),
(3, 25, 5749, 0, 0, 0, 'item', ' Complete full Green Djinn Quest with one click.', '1x green cup'),
(4, 100, 2358, 0, 0, 0, 'item', ' Soft boots', '1x pair of soft boots'),
(5, 50, 5722, 0, 0, 0, 'item', ' Dice gambling casino', '1x die'),
(6, 1, 2798, 1, 0, 0, 'item', ' blood herb', '1x blood herb'),
(7, 5, 2798, 5, 0, 0, 'item', ' blood herb x5', '5x blood herb'),
(8, 100, 5546, 0, 0, 0, 'item', ' golden account for guild house ownership', '1x scroll of golden account'),
(9, 50, 5545, 0, 0, 0, 'item', ' bless scroll all blessings in 1 !', '1x scroll of instant blessing access'),
(10, 25, 5544, 0, 0, 0, 'item', ' sex change scroll', '1x sex change scroll'),
(11, 50, 5543, 0, 0, 0, 'item', ' rashid access', '1x scroll of rashid'),
(12, 100, 5541, 0, 0, 0, 'item', ' frag remover', '1x book of frag remover'),
(13, 50, 5540, 0, 0, 0, 'item', ' exp booster for 6 hours! 30%', '1x scroll of experience');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeksy dla tabeli `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD UNIQUE KEY `account_id_2` (`account_id`,`player_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `world_id` (`world_id`);

--
-- Indeksy dla tabeli `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`,`value`),
  ADD KEY `active` (`active`);

--
-- Indeksy dla tabeli `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country`),
  ADD KEY `points` (`points`);

--
-- Indeksy dla tabeli `environment_killers`
--
ALTER TABLE `environment_killers`
  ADD KEY `environment_killers_ibfk_1` (`kill_id`);

--
-- Indeksy dla tabeli `global_storage`
--
ALTER TABLE `global_storage`
  ADD UNIQUE KEY `key` (`key`,`world_id`);

--
-- Indeksy dla tabeli `guilds`
--
ALTER TABLE `guilds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`world_id`);

--
-- Indeksy dla tabeli `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD UNIQUE KEY `player_id` (`player_id`,`guild_id`),
  ADD KEY `guild_invites_ibfk_2` (`guild_id`);

--
-- Indeksy dla tabeli `guild_kills`
--
ALTER TABLE `guild_kills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild_kills_ibfk_1` (`guild_id`),
  ADD KEY `guild_kills_ibfk_2` (`war_id`),
  ADD KEY `guild_kills_ibfk_3` (`death_id`);

--
-- Indeksy dla tabeli `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `guild_membership_ibfk_2` (`guild_id`),
  ADD KEY `guild_membership_ibfk_3` (`rank_id`);

--
-- Indeksy dla tabeli `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild_ranks_ibfk_1` (`guild_id`);

--
-- Indeksy dla tabeli `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `guild_id` (`guild_id`),
  ADD KEY `enemy_id` (`enemy_id`);

--
-- Indeksy dla tabeli `houses`
--
ALTER TABLE `houses`
  ADD UNIQUE KEY `id` (`id`,`world_id`);

--
-- Indeksy dla tabeli `house_auctions`
--
ALTER TABLE `house_auctions`
  ADD UNIQUE KEY `house_id` (`house_id`,`world_id`),
  ADD KEY `house_auctions_ibfk_2` (`player_id`);

--
-- Indeksy dla tabeli `house_data`
--
ALTER TABLE `house_data`
  ADD UNIQUE KEY `house_id` (`house_id`,`world_id`);

--
-- Indeksy dla tabeli `house_lists`
--
ALTER TABLE `house_lists`
  ADD UNIQUE KEY `house_id` (`house_id`,`world_id`,`listid`);

--
-- Indeksy dla tabeli `killers`
--
ALTER TABLE `killers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `killers_ibfk_1` (`death_id`);

--
-- Indeksy dla tabeli `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`deleted`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `online` (`online`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `level` (`level`,`experience`);

--
-- Indeksy dla tabeli `players_online`
--
ALTER TABLE `players_online`
  ADD PRIMARY KEY (`player_id`);

--
-- Indeksy dla tabeli `player_achievement`
--
ALTER TABLE `player_achievement`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date` (`date`),
  ADD KEY `player_deaths_ibfk_1` (`player_id`);

--
-- Indeksy dla tabeli `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  ADD KEY `player_id` (`player_id`);

--
-- Indeksy dla tabeli `player_items`
--
ALTER TABLE `player_items`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  ADD KEY `player_id` (`player_id`);

--
-- Indeksy dla tabeli `player_killers`
--
ALTER TABLE `player_killers`
  ADD KEY `player_killers_ibfk_1` (`kill_id`),
  ADD KEY `player_killers_ibfk_2` (`player_id`);

--
-- Indeksy dla tabeli `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD KEY `player_id` (`player_id`);

--
-- Indeksy dla tabeli `player_skills`
--
ALTER TABLE `player_skills`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`skillid`),
  ADD KEY `player_id` (`player_id`);

--
-- Indeksy dla tabeli `player_spells`
--
ALTER TABLE `player_spells`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`name`),
  ADD KEY `player_id` (`player_id`);

--
-- Indeksy dla tabeli `player_storage`
--
ALTER TABLE `player_storage`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`key`),
  ADD KEY `player_id` (`player_id`);

--
-- Indeksy dla tabeli `player_viplist`
--
ALTER TABLE `player_viplist`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`vip_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `vip_id` (`vip_id`);

--
-- Indeksy dla tabeli `realtibia_paygol`
--
ALTER TABLE `realtibia_paygol`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `realtibia_paypal`
--
ALTER TABLE `realtibia_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `server_config`
--
ALTER TABLE `server_config`
  ADD UNIQUE KEY `config` (`config`);

--
-- Indeksy dla tabeli `server_motd`
--
ALTER TABLE `server_motd`
  ADD UNIQUE KEY `id` (`id`,`world_id`);

--
-- Indeksy dla tabeli `server_record`
--
ALTER TABLE `server_record`
  ADD UNIQUE KEY `record` (`record`,`world_id`,`timestamp`);

--
-- Indeksy dla tabeli `server_reports`
--
ALTER TABLE `server_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `world_id` (`world_id`),
  ADD KEY `reads` (`reads`),
  ADD KEY `server_reports_ibfk_1` (`player_id`);

--
-- Indeksy dla tabeli `tiles`
--
ALTER TABLE `tiles`
  ADD UNIQUE KEY `id` (`id`,`world_id`),
  ADD KEY `x` (`x`,`y`,`z`),
  ADD KEY `tiles_ibfk_1` (`house_id`,`world_id`);

--
-- Indeksy dla tabeli `tile_items`
--
ALTER TABLE `tile_items`
  ADD UNIQUE KEY `tile_id` (`tile_id`,`world_id`,`sid`),
  ADD KEY `sid` (`sid`);

--
-- Indeksy dla tabeli `tile_store`
--
ALTER TABLE `tile_store`
  ADD KEY `tile_store_ibfk_1` (`house_id`);

--
-- Indeksy dla tabeli `z_featured_article`
--
ALTER TABLE `z_featured_article`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `z_forum`
--
ALTER TABLE `z_forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section` (`section`);

--
-- Indeksy dla tabeli `z_golden_system`
--
ALTER TABLE `z_golden_system`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `z_network_box`
--
ALTER TABLE `z_network_box`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `z_polls`
--
ALTER TABLE `z_polls`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `z_raidsystem`
--
ALTER TABLE `z_raidsystem`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `z_shop_history_item`
--
ALTER TABLE `z_shop_history_item`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `guilds`
--
ALTER TABLE `guilds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `guild_kills`
--
ALTER TABLE `guild_kills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `guild_ranks`
--
ALTER TABLE `guild_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `guild_wars`
--
ALTER TABLE `guild_wars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `killers`
--
ALTER TABLE `killers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `player_achievement`
--
ALTER TABLE `player_achievement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `player_deaths`
--
ALTER TABLE `player_deaths`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `realtibia_paygol`
--
ALTER TABLE `realtibia_paygol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `realtibia_paypal`
--
ALTER TABLE `realtibia_paypal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `server_reports`
--
ALTER TABLE `server_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `z_featured_article`
--
ALTER TABLE `z_featured_article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `z_forum`
--
ALTER TABLE `z_forum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `z_golden_system`
--
ALTER TABLE `z_golden_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `z_network_box`
--
ALTER TABLE `z_network_box`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `z_polls`
--
ALTER TABLE `z_polls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `z_raidsystem`
--
ALTER TABLE `z_raidsystem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `z_shop_history_item`
--
ALTER TABLE `z_shop_history_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD CONSTRAINT `account_viplist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_viplist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `environment_killers`
--
ALTER TABLE `environment_killers`
  ADD CONSTRAINT `environment_killers_ibfk_1` FOREIGN KEY (`kill_id`) REFERENCES `killers` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `guild_kills`
--
ALTER TABLE `guild_kills`
  ADD CONSTRAINT `guild_kills_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_kills_ibfk_2` FOREIGN KEY (`war_id`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_kills_ibfk_3` FOREIGN KEY (`death_id`) REFERENCES `player_deaths` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD CONSTRAINT `guild_membership_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_ibfk_3` FOREIGN KEY (`rank_id`) REFERENCES `guild_ranks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD CONSTRAINT `guild_wars_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_wars_ibfk_2` FOREIGN KEY (`enemy_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `house_auctions`
--
ALTER TABLE `house_auctions`
  ADD CONSTRAINT `house_auctions_ibfk_1` FOREIGN KEY (`house_id`,`world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `house_auctions_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `house_data`
--
ALTER TABLE `house_data`
  ADD CONSTRAINT `house_data_ibfk_1` FOREIGN KEY (`house_id`,`world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `house_lists`
--
ALTER TABLE `house_lists`
  ADD CONSTRAINT `house_lists_ibfk_1` FOREIGN KEY (`house_id`,`world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `killers`
--
ALTER TABLE `killers`
  ADD CONSTRAINT `killers_ibfk_1` FOREIGN KEY (`death_id`) REFERENCES `player_deaths` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD CONSTRAINT `player_deaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD CONSTRAINT `player_depotitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `player_items`
--
ALTER TABLE `player_items`
  ADD CONSTRAINT `player_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `player_killers`
--
ALTER TABLE `player_killers`
  ADD CONSTRAINT `player_killers_ibfk_1` FOREIGN KEY (`kill_id`) REFERENCES `killers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_killers_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `player_skills`
--
ALTER TABLE `player_skills`
  ADD CONSTRAINT `player_skills_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `player_spells`
--
ALTER TABLE `player_spells`
  ADD CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `player_storage`
--
ALTER TABLE `player_storage`
  ADD CONSTRAINT `player_storage_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `player_viplist`
--
ALTER TABLE `player_viplist`
  ADD CONSTRAINT `player_viplist_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_viplist_ibfk_2` FOREIGN KEY (`vip_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `server_reports`
--
ALTER TABLE `server_reports`
  ADD CONSTRAINT `server_reports_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `tiles`
--
ALTER TABLE `tiles`
  ADD CONSTRAINT `tiles_ibfk_1` FOREIGN KEY (`house_id`,`world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `tile_items`
--
ALTER TABLE `tile_items`
  ADD CONSTRAINT `tile_items_ibfk_1` FOREIGN KEY (`tile_id`) REFERENCES `tiles` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `tile_store`
--
ALTER TABLE `tile_store`
  ADD CONSTRAINT `tile_store_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
