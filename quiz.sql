-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2016 at 11:18 AM
-- Server version: 10.1.8-MariaDB
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE IF NOT EXISTS `answer` (
  `id` int(10) unsigned NOT NULL,
  `id_question` int(10) unsigned NOT NULL,
  `content` varchar(2000) COLLATE utf8_bin NOT NULL,
  `result` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='id\r\nid_question\r\ncontent\r\nimage\r\nresult';

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`id`, `id_question`, `content`, `result`) VALUES
(7, 3, '!!&lt;form&gt;\n						&lt;div class=&quot;form-group&quot;&gt;\n							&lt;label for=&quot;name&quot; class=&quot;control-label&quot;&gt;&lt;d&gt;name&lt;/d&gt;:&lt;/label&gt;\n							&lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;name&quot; ng-model=&quot;modal.name&quot;&gt;\n						&lt;/div&gt;\n						&lt;div class=&quot;form-group&quot;&gt;\n							&lt;label for=&quot;detail&quot; class=&quot;control-label&quot;&gt;&lt;d&gt;detail&lt;/d&gt;:&lt;/label&gt;\n							&lt;input type=&quot;text&quot; class=&quot;form-control&quot; id=&quot;detail&quot; ng-model=&quot;modal.detail&quot;&gt;\n						&lt;/div&gt;\n					&lt;/form&gt;', 0),
(8, 3, '&lt;select class=&quot;form-control&quot; id=&quot;star&quot; ng-model=&quot;question.star&quot;&gt;\n	&lt;option value=&quot;1&quot; selected=&quot;selected&quot;&gt;1&lt;/option&gt;\n	&lt;option value=&quot;2&quot;&gt;2&lt;/option&gt;\n	&lt;option value=&quot;3&quot;&gt;3&lt;/option&gt;\n	&lt;option value=&quot;4&quot;&gt;4&lt;/option&gt;\n	&lt;option value=&quot;5&quot;&gt;5&lt;/option&gt;\n&lt;/select&gt;', 1),
(9, 5, '2', 1),
(10, 5, '3', 0),
(11, 5, '4', 0),
(12, 5, '2.5', 0),
(13, 6, 'int a = Math.abs(-5);', 0),
(14, 6, 'int b = Math.abs(5.0);', 1),
(15, 6, 'int c = Math.abs(5.5F);', 0),
(16, 6, 'int d = Math.abs(5L);', 0),
(17, 7, '1, 2 and 4', 1),
(18, 7, '2, 3 and 4', 0),
(19, 7, '1, 2 and 3', 0),
(20, 7, '3 and 4', 0),
(21, 8, 'java Myfile 222', 1),
(22, 8, 'java Myfile 1 2 2 3 4', 0),
(23, 8, 'java Myfile 1 3 2 2', 0),
(24, 8, 'java Myfile 0 1 2 3', 0),
(25, 9, 'option 1', 1),
(26, 9, 'option 2', 0),
(27, 9, 'option 3', 0),
(28, 9, 'option 4', 0),
(29, 10, 'option 1', 1),
(30, 10, 'option 2', 0),
(31, 10, 'option 3', 0),
(32, 10, 'option 4', 0),
(33, 11, 'option 1', 1),
(34, 11, 'option 2', 0),
(35, 11, 'option 3', 0),
(36, 11, 'option 4', 0),
(37, 12, 'option 1', 1),
(38, 12, 'option 2', 0),
(39, 12, 'option 3', 0),
(40, 12, 'option 4', 0),
(41, 13, 'option 1', 1),
(42, 13, 'option 2', 0),
(43, 13, 'option 3', 0),
(44, 13, 'option 4', 0),
(45, 14, 'option 1', 1),
(46, 14, 'option 2', 0),
(47, 14, 'option 3', 0),
(48, 14, 'option 4', 0),
(49, 15, 'option 1', 1),
(50, 15, 'option 2', 0),
(51, 15, 'option 3', 0),
(52, 15, 'option 4', 0),
(53, 16, 'option 1', 1),
(54, 16, 'option 2', 0),
(55, 16, 'option 3', 0),
(56, 16, 'option 4', 0),
(57, 17, 'option 1', 1),
(58, 17, 'option 2', 0),
(59, 17, 'option 3', 0),
(60, 17, 'option 4', 0),
(61, 18, 'option 1', 1),
(62, 18, 'option 2', 0),
(63, 18, 'option 3', 0),
(64, 18, 'option 4', 0),
(65, 19, 'option 1', 1),
(66, 19, 'option 2', 0),
(67, 19, 'option 3', 0),
(68, 19, 'option 4', 0),
(69, 20, 'option 1', 1),
(70, 20, 'option 2', 0),
(71, 20, 'option 3', 0),
(72, 20, 'option 4', 0),
(73, 21, 'option 1', 1),
(74, 21, 'option 2', 0),
(75, 21, 'option 3', 0),
(76, 21, 'option 4', 0),
(77, 22, 'option 1', 1),
(78, 22, 'option 2', 0),
(79, 22, 'option 3', 0),
(80, 22, 'option 4', 0),
(81, 23, 'option 1', 1),
(82, 23, 'option 2', 0),
(83, 23, 'option 3', 0),
(84, 23, 'option 4', 0),
(85, 24, 'option 1', 1),
(86, 24, 'option 2', 0),
(87, 24, 'option 3', 0),
(88, 24, 'option 4', 0),
(89, 25, 'option 1', 1),
(90, 25, 'option 2', 0),
(91, 25, 'option 3', 0),
(92, 25, 'option 4', 0),
(93, 26, 'option 1', 1),
(94, 26, 'option 2', 0),
(95, 26, 'option 3', 0),
(96, 26, 'option 4', 0),
(97, 27, 'option 1', 1),
(98, 27, 'option 2', 0),
(99, 27, 'option 3', 0),
(100, 27, 'option 4', 0),
(101, 28, 'option 1', 1),
(102, 28, 'option 2', 0),
(103, 28, 'option 3', 0),
(104, 28, 'option 4', 0),
(105, 29, 'option 1', 1),
(106, 29, 'option 2', 0),
(107, 29, 'option 3', 0),
(108, 29, 'option 4', 0);

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE IF NOT EXISTS `grade` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(200) COLLATE utf8_bin NOT NULL,
  `detail` varchar(200) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`id`, `name`, `detail`) VALUES
(1, 'Level 1', NULL),
(2, 'Level 2', NULL),
(3, 'Level 3', 'مەرحەلە 3');

-- --------------------------------------------------------

--
-- Table structure for table `lecture`
--

CREATE TABLE IF NOT EXISTS `lecture` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(200) COLLATE utf8_bin NOT NULL,
  `detail` varchar(200) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `lecture`
--

INSERT INTO `lecture` (`id`, `name`, `detail`) VALUES
(1, 'Java', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `perm`
--

CREATE TABLE IF NOT EXISTS `perm` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `perm` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '0000',
  `user` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '0000',
  `grade` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '0000',
  `lecture` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '0000',
  `question` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '0000',
  `quiz` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '0000',
  `answer` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '0000',
  `detail` varchar(200) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `perm`
--

INSERT INTO `perm` (`id`, `name`, `perm`, `user`, `grade`, `lecture`, `question`, `quiz`, `answer`, `detail`) VALUES
(1, 'Admin', '1111', '1101', '1111', '1111', '1111', '1111', '1111', ''),
(3, 'user', '0000', '0000', '0000', '0000', '1111', '1111', '0000', ''),
(4, 'master', '0000', '1000', '1000', '1110', '1111', '1000', '0000', 'for test'),
(5, 'fgsdgsd', '0000', '0000', '0000', '0000', '0000', '0000', '0000', NULL),
(6, 'dxgdsbxfbd', '0000', '0000', '0000', '0000', '0000', '0000', '0000', NULL),
(7, 'dgsdhsdh', '0000', '0000', '0000', '0000', '0000', '0000', '0000', NULL),
(9, 'fbfxgds', '0000', '0000', '0000', '0000', '0000', '0000', '0000', NULL),
(10, 'fbhfdhn', '0000', '0000', '0000', '0000', '0000', '0000', '0000', NULL),
(11, 'dxbdx', '0000', '0000', '0000', '0000', '0000', '0000', '0000', NULL),
(12, 'fdbdb', '0000', '0000', '0000', '0000', '0000', '0000', '0000', NULL),
(13, 'dvd', '0000', '0000', '0000', '0000', '0000', '0000', '0000', NULL),
(14, 'xzvzsx', '0000', '0000', '0000', '0000', '0000', '0000', '0000', NULL),
(15, 'zvzxvz', '0000', '0000', '0000', '0000', '0000', '0000', '0000', NULL),
(16, 'vzdfsdgsa', '0000', '0000', '0000', '0000', '0000', '0000', '0000', NULL),
(17, '2352', '0000', '0000', '0000', '0000', '0000', '0000', '0000', NULL),
(18, 'vdvd', '0000', '0000', '0000', '0000', '0000', '0000', '0000', NULL),
(19, 'xdvd', '0000', '0000', '0000', '0000', '0000', '0000', '0000', NULL),
(20, 'dvdv', '0000', '0000', '0000', '0000', '0000', '0000', '0000', NULL),
(21, 'dxvdxv', '0000', '0000', '0000', '0000', '0000', '0000', '0000', NULL),
(22, 'xdvdv', '0000', '0000', '0000', '0000', '0000', '0000', '0000', NULL),
(23, 'dxvdd', '0000', '0000', '0000', '0000', '0000', '0000', '0000', NULL),
(24, 'dzvszv', '0000', '0000', '0000', '0000', '0000', '0000', '0000', NULL),
(25, 'dvddv', '0000', '0000', '0000', '0000', '0000', '0000', '0000', NULL),
(26, 'vzsszv', '0000', '0000', '0000', '0000', '0000', '0000', '0000', NULL),
(27, 'dvszv', '0000', '0000', '0000', '0000', '0000', '0000', '0000', NULL),
(28, 'fhfhf', '0000', '0000', '0000', '0000', '0000', '0000', '0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `id` int(10) unsigned NOT NULL,
  `id_grade` int(10) unsigned NOT NULL,
  `id_lecture` int(10) unsigned NOT NULL,
  `right` int(10) unsigned NOT NULL DEFAULT '0',
  `wrong` int(10) unsigned NOT NULL DEFAULT '0',
  `star` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `difficulty` float unsigned NOT NULL DEFAULT '0',
  `content` varchar(2000) COLLATE utf8_bin NOT NULL,
  `image` varchar(300) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='id\r\nid_grade\r\nid_lecture\r\ndifficulty\r\ncontent\r\nimage';

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `id_grade`, `id_lecture`, `right`, `wrong`, `star`, `difficulty`, `content`, `image`) VALUES
(1, 1, 1, 0, 0, 0, 20, 'Given: \r\n\r\npublic class MyStuff {\r\nMyStuff(String n) { name = n; } \r\nString name;\r\npublic static void main(String[] args) {\r\nMyStuff m1 = new MyStuff("guitar");\r\nMyStuff m2 = new MyStuff("tv"); \r\nSystem.out.println(m2.equals(m1));\r\n}\r\npublic boolean equals(Object o) {\r\nMyStuff m = (MyStuff) o;\r\nif(m.name != null)\r\nreturn true;\r\nreturn false;\r\n}\r\n}\r\n\r\n\r\nWhat is the result? ', NULL),
(3, 1, 1, 0, 0, 1, 0, 'ss', ''),
(5, 1, 1, 0, 0, 3, 0, 'What is the value of &quot;d&quot; after this line of code has been executed?\n\ndouble d = Math.round ( 2.5 + Math.random() );', NULL),
(6, 1, 1, 4, 0, 4, 0, 'Which of the following would compile without error?', ''),
(7, 1, 1, 0, 0, 2, 0, 'Which of the following are valid calls to Math.max?\n\n1.Math.max(1,4)\n2.Math.max(2.3, 5)\n3.Math.max(1, 3, 5, 7)\n4.Math.max(-1.5, -2.8f)', ''),
(8, 1, 1, 0, 0, 4, 0, 'public class Myfile \n{ \n    public static void main (String[] args) \n    {\n        String biz = args[1]; \n        String baz = args[2]; \n        String rip = args[3]; \n        System.out.println(&quot;Arg is &quot; + rip); \n    } \n}', NULL),
(9, 1, 1, 0, 0, 1, 0, 'test question', NULL),
(10, 1, 1, 0, 0, 1, 0, 'test question', NULL),
(11, 1, 1, 0, 0, 1, 0, 'test question', NULL),
(12, 1, 1, 0, 0, 1, 0, 'test question', NULL),
(13, 1, 1, 0, 0, 1, 0, 'test question', NULL),
(14, 1, 1, 0, 0, 1, 0, 'test question', NULL),
(15, 1, 1, 0, 0, 1, 0, 'test question', NULL),
(16, 1, 1, 0, 0, 1, 0, 'test question', NULL),
(17, 1, 1, 0, 0, 1, 0, 'test question', '17.png'),
(18, 1, 1, 0, 0, 1, 0, 'test question', NULL),
(19, 1, 1, 0, 0, 1, 0, 'test question', NULL),
(20, 1, 1, 0, 0, 1, 0, 'test question', NULL),
(21, 1, 1, 0, 0, 1, 0, 'test question', NULL),
(22, 1, 1, 0, 0, 1, 0, 'test question', NULL),
(23, 1, 1, 0, 0, 1, 0, 'test question', NULL),
(24, 1, 1, 0, 0, 1, 0, 'test question', NULL),
(25, 1, 1, 0, 0, 1, 0, 'test question', NULL),
(26, 1, 1, 0, 0, 1, 0, 'test question', NULL),
(27, 1, 1, 0, 0, 1, 0, 'test question', NULL),
(28, 1, 1, 0, 0, 1, 0, 'test question', NULL),
(29, 1, 1, 0, 0, 1, 0, 'test question', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE IF NOT EXISTS `quiz` (
  `id` int(11) unsigned NOT NULL,
  `id_user` int(10) unsigned NOT NULL,
  `id_lecture` int(10) unsigned NOT NULL,
  `id_grade` int(10) unsigned NOT NULL,
  `result` float DEFAULT NULL,
  `duration` int(11) unsigned DEFAULT NULL,
  `start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end` timestamp NULL DEFAULT NULL,
  `detail` varchar(500) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='id\r\nid_user\r\nid_lecture\r\nid_grade\r\nresult\r\nduration\r\nstart\r\nend\r\ndetail\r\n';

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`id`, `id_user`, `id_lecture`, `id_grade`, `result`, `duration`, `start`, `end`, `detail`) VALUES
(1, 9, 1, 1, NULL, 60, '2016-01-06 05:48:27', NULL, NULL),
(2, 9, 1, 1, NULL, 60, '2016-01-06 05:59:27', NULL, NULL),
(3, 9, 1, 1, NULL, 60, '2016-01-06 06:00:05', NULL, NULL),
(4, 9, 1, 1, NULL, 60, '2016-01-06 06:00:23', NULL, NULL),
(5, 9, 1, 1, NULL, 60, '2016-01-06 06:00:58', NULL, NULL),
(6, 9, 1, 1, NULL, 60, '2016-01-06 06:01:10', NULL, NULL),
(7, 4, 1, 1, NULL, 60, '2016-01-06 06:01:19', NULL, NULL),
(8, 9, 1, 1, NULL, 60, '2016-01-06 06:09:53', NULL, NULL),
(9, 9, 1, 1, NULL, 60, '2016-01-06 06:11:40', NULL, NULL),
(10, 9, 1, 1, NULL, 60, '2016-01-06 06:16:08', NULL, NULL),
(11, 9, 1, 1, NULL, 60, '2016-01-06 06:18:33', NULL, NULL),
(12, 9, 1, 1, NULL, 60, '2016-01-06 06:19:03', NULL, NULL),
(13, 9, 1, 1, NULL, 60, '2016-01-06 06:21:27', NULL, NULL),
(14, 9, 1, 1, NULL, 60, '2016-01-06 06:22:06', NULL, NULL),
(15, 9, 1, 1, NULL, 60, '2016-01-06 06:22:37', NULL, NULL),
(16, 9, 1, 1, NULL, 60, '2016-01-14 05:00:49', NULL, NULL),
(17, 9, 1, 1, NULL, 60, '2016-01-16 11:23:27', NULL, NULL),
(18, 9, 1, 1, 30, 60, '2016-01-21 07:55:43', '2016-01-21 08:12:02', NULL),
(19, 9, 1, 1, 0, 60, '2016-01-21 08:24:00', '2016-01-21 08:29:31', NULL),
(20, 9, 1, 1, 5, 60, '2016-01-21 08:30:28', '2016-01-21 08:31:16', NULL),
(21, 9, 1, 1, 5, 60, '2016-01-21 08:36:31', '2016-01-21 08:54:00', NULL),
(22, 9, 1, 1, 10, 60, '2016-01-21 08:54:12', '2016-01-21 08:54:18', NULL),
(23, 9, 1, 1, NULL, 60, '2016-01-21 08:54:44', NULL, NULL),
(24, 9, 1, 1, 40, 60, '2016-02-04 07:29:09', '2016-02-04 07:29:35', NULL),
(25, 14, 1, 1, NULL, 60, '2016-02-22 08:12:38', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_extra`
--

CREATE TABLE IF NOT EXISTS `quiz_extra` (
  `id` int(11) unsigned NOT NULL,
  `id_quiz` int(11) unsigned NOT NULL,
  `id_question` int(10) unsigned NOT NULL,
  `selected` tinyint(1) unsigned DEFAULT NULL,
  `right_answer` tinyint(1) unsigned NOT NULL,
  `id_a1` int(10) unsigned DEFAULT NULL,
  `id_a2` int(10) unsigned DEFAULT NULL,
  `id_a3` int(10) unsigned DEFAULT NULL,
  `id_a4` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='id\r\nid_quiz\r\nid_question\r\nselected\r\nright_answer\r\nid_a1\r\nid_a2\r\nid_a3\r\nid_a4';

--
-- Dumping data for table `quiz_extra`
--

INSERT INTO `quiz_extra` (`id`, `id_quiz`, `id_question`, `selected`, `right_answer`, `id_a1`, `id_a2`, `id_a3`, `id_a4`) VALUES
(1, 10, 6, NULL, 1, 14, 16, 15, 13),
(2, 10, 5, NULL, 3, 11, 12, 9, 10),
(3, 10, 26, NULL, 4, 95, 96, 94, 93),
(4, 10, 28, NULL, 4, 104, 103, 102, 101),
(5, 10, 18, NULL, 2, 63, 61, 62, 64),
(6, 10, 12, NULL, 2, 40, 37, 39, 38),
(7, 10, 15, NULL, 1, 49, 50, 52, 51),
(8, 10, 16, NULL, 4, 55, 56, 54, 53),
(9, 10, 14, NULL, 3, 47, 46, 45, 48),
(10, 10, 19, NULL, 1, 65, 66, 67, 68),
(11, 10, 29, NULL, 2, 108, 105, 107, 106),
(12, 11, 5, NULL, 2, 10, 9, 11, 12),
(13, 11, 24, NULL, 2, 87, 85, 86, 88),
(14, 11, 18, NULL, 3, 63, 64, 61, 62),
(15, 11, 10, NULL, 4, 32, 31, 30, 29),
(16, 11, 21, NULL, 1, 73, 76, 74, 75),
(17, 11, 8, NULL, 3, 24, 22, 21, 23),
(18, 11, 22, NULL, 2, 80, 77, 79, 78),
(19, 11, 16, NULL, 1, 53, 55, 56, 54),
(20, 11, 29, NULL, 2, 106, 105, 108, 107),
(21, 11, 19, NULL, 3, 66, 67, 65, 68),
(22, 11, 17, NULL, 4, 59, 58, 60, 57),
(23, 11, 7, NULL, 1, 17, 19, 18, 20),
(24, 11, 13, NULL, 4, 43, 42, 44, 41),
(25, 11, 20, NULL, 4, 70, 72, 71, 69),
(26, 11, 12, NULL, 2, 38, 37, 39, 40),
(27, 11, 26, NULL, 4, 94, 95, 96, 93),
(28, 11, 9, NULL, 2, 27, 25, 28, 26),
(29, 11, 14, NULL, 1, 45, 48, 46, 47),
(30, 11, 15, NULL, 3, 50, 51, 49, 52),
(31, 11, 27, NULL, 1, 97, 99, 98, 100),
(32, 12, 22, NULL, 1, 77, 79, 80, 78),
(33, 12, 3, NULL, 2, 7, 8, 0, 0),
(34, 12, 7, NULL, 1, 17, 18, 19, 20),
(35, 12, 8, NULL, 1, 21, 23, 22, 24),
(36, 12, 25, NULL, 3, 90, 92, 89, 91),
(37, 12, 26, NULL, 3, 94, 96, 93, 95),
(38, 12, 12, NULL, 3, 38, 39, 37, 40),
(39, 12, 13, NULL, 4, 44, 42, 43, 41),
(40, 12, 17, NULL, 1, 57, 59, 60, 58),
(41, 12, 10, NULL, 4, 31, 30, 32, 29),
(42, 12, 9, NULL, 4, 27, 28, 26, 25),
(43, 12, 21, NULL, 3, 74, 76, 73, 75),
(44, 12, 27, NULL, 1, 97, 99, 100, 98),
(45, 12, 14, NULL, 2, 46, 45, 48, 47),
(46, 12, 16, NULL, 1, 53, 54, 55, 56),
(47, 12, 5, NULL, 3, 10, 12, 9, 11),
(48, 12, 11, NULL, 2, 35, 33, 34, 36),
(49, 12, 20, NULL, 1, 69, 70, 71, 72),
(50, 12, 18, NULL, 1, 61, 64, 63, 62),
(51, 12, 23, NULL, 2, 84, 81, 83, 82),
(52, 13, 1, NULL, 0, 0, 0, 0, 0),
(53, 13, 19, NULL, 2, 66, 65, 68, 67),
(54, 13, 24, NULL, 2, 87, 85, 88, 86),
(55, 13, 9, NULL, 3, 27, 26, 25, 28),
(56, 13, 10, NULL, 1, 29, 31, 30, 32),
(57, 13, 25, NULL, 4, 91, 92, 90, 89),
(58, 13, 21, NULL, 4, 75, 76, 74, 73),
(59, 13, 28, NULL, 4, 104, 103, 102, 101),
(60, 13, 12, NULL, 2, 38, 37, 40, 39),
(61, 13, 27, NULL, 2, 98, 97, 99, 100),
(62, 13, 16, NULL, 1, 53, 55, 54, 56),
(63, 13, 29, NULL, 4, 107, 106, 108, 105),
(64, 13, 5, NULL, 1, 9, 12, 10, 11),
(65, 13, 20, NULL, 1, 69, 72, 71, 70),
(66, 13, 23, NULL, 1, 81, 83, 82, 84),
(67, 13, 8, NULL, 2, 22, 21, 24, 23),
(68, 13, 11, NULL, 1, 33, 35, 34, 36),
(69, 13, 6, NULL, 4, 13, 16, 15, 14),
(70, 13, 18, NULL, 1, 61, 64, 63, 62),
(71, 13, 15, NULL, 1, 49, 50, 52, 51),
(72, 14, 22, NULL, 3, 79, 78, 77, 80),
(73, 14, 21, NULL, 3, 76, 75, 73, 74),
(74, 14, 23, NULL, 2, 84, 81, 82, 83),
(75, 14, 6, NULL, 4, 16, 15, 13, 14),
(76, 14, 24, NULL, 1, 85, 87, 88, 86),
(77, 14, 1, NULL, 0, 0, 0, 0, 0),
(78, 14, 11, NULL, 1, 33, 35, 34, 36),
(79, 14, 3, NULL, 1, 8, 7, 0, 0),
(80, 14, 14, NULL, 2, 47, 45, 46, 48),
(81, 14, 15, NULL, 1, 49, 52, 50, 51),
(82, 14, 13, NULL, 4, 44, 42, 43, 41),
(83, 14, 25, NULL, 3, 90, 91, 89, 92),
(84, 14, 20, NULL, 2, 70, 69, 72, 71),
(85, 14, 27, NULL, 4, 100, 99, 98, 97),
(86, 14, 26, NULL, 1, 93, 94, 95, 96),
(87, 14, 17, NULL, 4, 59, 60, 58, 57),
(88, 14, 19, NULL, 3, 68, 67, 65, 66),
(89, 14, 29, NULL, 2, 107, 105, 106, 108),
(90, 14, 16, NULL, 2, 54, 53, 56, 55),
(91, 14, 10, NULL, 4, 32, 31, 30, 29),
(92, 15, 3, NULL, 2, 7, 8, 0, 0),
(93, 15, 16, NULL, 1, 53, 56, 54, 55),
(94, 15, 14, NULL, 4, 47, 46, 48, 45),
(95, 15, 23, NULL, 3, 84, 82, 81, 83),
(96, 15, 22, NULL, 2, 80, 77, 79, 78),
(97, 15, 15, NULL, 2, 52, 49, 51, 50),
(98, 15, 24, NULL, 2, 88, 85, 87, 86),
(99, 15, 29, NULL, 4, 107, 108, 106, 105),
(100, 15, 11, NULL, 3, 35, 36, 33, 34),
(101, 15, 10, NULL, 3, 31, 32, 29, 30),
(102, 15, 8, NULL, 1, 21, 22, 23, 24),
(103, 15, 12, NULL, 3, 38, 39, 37, 40),
(104, 15, 9, NULL, 1, 25, 26, 27, 28),
(105, 15, 5, NULL, 2, 11, 9, 10, 12),
(106, 15, 7, NULL, 3, 19, 20, 17, 18),
(107, 15, 21, NULL, 2, 75, 73, 74, 76),
(108, 15, 17, NULL, 4, 60, 58, 59, 57),
(109, 15, 20, NULL, 2, 70, 69, 72, 71),
(110, 15, 27, NULL, 1, 97, 100, 99, 98),
(111, 15, 13, NULL, 2, 44, 41, 42, 43),
(112, 16, 17, 4, 4, 60, 59, 58, 57),
(113, 16, 23, 3, 1, 81, 83, 82, 84),
(114, 16, 8, 4, 3, 22, 23, 21, 24),
(115, 16, 1, NULL, 0, 0, 0, 0, 0),
(116, 16, 19, 2, 4, 67, 66, 68, 65),
(117, 16, 25, NULL, 1, 89, 91, 92, 90),
(118, 16, 18, NULL, 1, 61, 64, 62, 63),
(119, 16, 22, NULL, 3, 80, 79, 77, 78),
(120, 16, 16, NULL, 4, 54, 55, 56, 53),
(121, 16, 20, NULL, 2, 71, 69, 72, 70),
(122, 16, 24, NULL, 4, 88, 87, 86, 85),
(123, 16, 21, NULL, 3, 75, 74, 73, 76),
(124, 16, 12, NULL, 3, 38, 39, 37, 40),
(125, 16, 15, NULL, 4, 50, 51, 52, 49),
(126, 16, 9, NULL, 4, 28, 27, 26, 25),
(127, 16, 3, 1, 2, 7, 8, 0, 0),
(128, 16, 7, 2, 2, 18, 17, 20, 19),
(129, 16, 27, NULL, 3, 98, 100, 97, 99),
(130, 16, 5, NULL, 1, 9, 10, 11, 12),
(131, 16, 10, 1, 1, 29, 32, 30, 31),
(132, 17, 22, 2, 2, 80, 77, 78, 79),
(133, 17, 12, 1, 4, 38, 39, 40, 37),
(134, 17, 29, NULL, 1, 105, 107, 108, 106),
(135, 17, 6, 3, 4, 13, 16, 15, 14),
(136, 17, 5, NULL, 4, 12, 11, 10, 9),
(137, 17, 17, 4, 4, 58, 59, 60, 57),
(138, 17, 9, NULL, 2, 27, 25, 28, 26),
(139, 17, 28, NULL, 2, 102, 101, 103, 104),
(140, 17, 27, NULL, 1, 97, 100, 99, 98),
(141, 17, 23, NULL, 2, 83, 81, 84, 82),
(142, 17, 24, NULL, 2, 86, 85, 87, 88),
(143, 17, 14, NULL, 1, 45, 48, 46, 47),
(144, 17, 26, NULL, 2, 96, 93, 95, 94),
(145, 17, 3, NULL, 2, 7, 8, 0, 0),
(146, 17, 11, NULL, 2, 34, 33, 36, 35),
(147, 17, 20, NULL, 1, 69, 71, 70, 72),
(148, 17, 19, NULL, 1, 65, 67, 68, 66),
(149, 17, 8, NULL, 1, 21, 22, 23, 24),
(150, 17, 13, NULL, 4, 43, 42, 44, 41),
(151, 17, 1, 2, 0, 0, 0, 0, 0),
(152, 18, 27, 1, 1, 97, 100, 98, 99),
(153, 18, 1, 2, 0, 0, 0, 0, 0),
(154, 18, 29, NULL, 3, 107, 108, 105, 106),
(155, 18, 10, 2, 4, 32, 31, 30, 29),
(156, 18, 17, 3, 4, 60, 59, 58, 57),
(157, 18, 12, NULL, 2, 38, 37, 39, 40),
(158, 18, 13, 3, 2, 43, 41, 44, 42),
(159, 18, 21, NULL, 4, 74, 76, 75, 73),
(160, 18, 11, 4, 1, 33, 35, 34, 36),
(161, 18, 20, NULL, 4, 71, 72, 70, 69),
(162, 18, 25, NULL, 3, 91, 90, 89, 92),
(163, 18, 26, 1, 1, 93, 94, 95, 96),
(164, 18, 14, 2, 2, 46, 45, 47, 48),
(165, 18, 22, 2, 2, 78, 77, 80, 79),
(166, 18, 7, NULL, 1, 17, 18, 20, 19),
(167, 18, 5, NULL, 3, 12, 10, 9, 11),
(168, 18, 24, 4, 4, 87, 86, 88, 85),
(169, 18, 28, 3, 3, 104, 102, 101, 103),
(170, 18, 6, 3, 1, 14, 13, 15, 16),
(171, 18, 3, 4, 1, 8, 7, 0, 0),
(172, 19, 3, 2, 2, 7, 8, 0, 0),
(173, 19, 1, NULL, 0, 0, 0, 0, 0),
(174, 19, 11, 1, 1, 33, 36, 34, 35),
(175, 19, 17, 1, 1, 57, 59, 60, 58),
(176, 19, 16, 4, 4, 56, 55, 54, 53),
(177, 19, 18, 1, 1, 61, 62, 63, 64),
(178, 19, 8, 3, 1, 21, 23, 24, 22),
(179, 19, 15, 1, 1, 49, 51, 50, 52),
(180, 19, 21, 3, 3, 76, 75, 73, 74),
(181, 19, 14, 1, 1, 45, 47, 46, 48),
(182, 19, 12, 1, 1, 37, 38, 40, 39),
(183, 19, 28, 1, 1, 101, 102, 103, 104),
(184, 19, 29, 2, 2, 106, 105, 108, 107),
(185, 19, 7, 2, 2, 20, 17, 19, 18),
(186, 19, 22, 1, 1, 77, 80, 79, 78),
(187, 19, 24, 3, 3, 87, 88, 85, 86),
(188, 19, 13, 2, 2, 44, 41, 42, 43),
(189, 19, 19, 1, 1, 65, 66, 68, 67),
(190, 19, 23, 4, 4, 83, 82, 84, 81),
(191, 19, 25, 1, 1, 89, 92, 91, 90),
(192, 20, 12, NULL, 1, 37, 38, 40, 39),
(193, 20, 7, NULL, 4, 19, 20, 18, 17),
(194, 20, 10, NULL, 3, 31, 32, 29, 30),
(195, 20, 27, NULL, 1, 97, 99, 100, 98),
(196, 20, 22, NULL, 3, 79, 80, 77, 78),
(197, 20, 1, NULL, 0, 0, 0, 0, 0),
(198, 20, 23, NULL, 4, 84, 82, 83, 81),
(199, 20, 25, NULL, 1, 89, 91, 90, 92),
(200, 20, 14, NULL, 1, 45, 46, 48, 47),
(201, 20, 11, NULL, 2, 35, 33, 34, 36),
(202, 20, 18, NULL, 2, 62, 61, 64, 63),
(203, 20, 8, NULL, 2, 24, 21, 23, 22),
(204, 20, 26, NULL, 2, 94, 93, 96, 95),
(205, 20, 6, NULL, 1, 14, 16, 13, 15),
(206, 20, 9, NULL, 4, 26, 28, 27, 25),
(207, 20, 13, NULL, 4, 42, 43, 44, 41),
(208, 20, 21, NULL, 3, 76, 75, 73, 74),
(209, 20, 19, NULL, 4, 67, 66, 68, 65),
(210, 20, 5, NULL, 1, 9, 12, 10, 11),
(211, 20, 24, 4, 4, 87, 86, 88, 85),
(212, 21, 24, 3, 3, 87, 86, 85, 88),
(213, 21, 6, NULL, 4, 16, 15, 13, 14),
(214, 21, 18, NULL, 4, 63, 64, 62, 61),
(215, 21, 26, NULL, 3, 94, 96, 93, 95),
(216, 21, 7, NULL, 4, 19, 20, 18, 17),
(217, 21, 17, NULL, 3, 60, 58, 57, 59),
(218, 21, 25, NULL, 1, 89, 91, 92, 90),
(219, 21, 12, NULL, 3, 39, 40, 37, 38),
(220, 21, 5, NULL, 4, 11, 10, 12, 9),
(221, 21, 9, NULL, 1, 25, 28, 27, 26),
(222, 21, 1, NULL, 0, 0, 0, 0, 0),
(223, 21, 11, NULL, 1, 33, 34, 35, 36),
(224, 21, 20, NULL, 2, 72, 69, 71, 70),
(225, 21, 28, NULL, 3, 102, 103, 101, 104),
(226, 21, 15, NULL, 4, 51, 52, 50, 49),
(227, 21, 23, NULL, 3, 82, 84, 81, 83),
(228, 21, 21, NULL, 3, 76, 74, 73, 75),
(229, 21, 22, NULL, 2, 78, 77, 79, 80),
(230, 21, 29, NULL, 3, 108, 107, 105, 106),
(231, 21, 13, NULL, 2, 42, 41, 43, 44),
(232, 22, 14, 3, 3, 48, 47, 45, 46),
(233, 22, 16, 3, 3, 54, 56, 53, 55),
(234, 22, 9, NULL, 2, 27, 25, 26, 28),
(235, 22, 28, NULL, 4, 102, 104, 103, 101),
(236, 22, 20, NULL, 1, 69, 71, 72, 70),
(237, 22, 19, NULL, 1, 65, 68, 66, 67),
(238, 22, 13, NULL, 2, 42, 41, 43, 44),
(239, 22, 3, NULL, 1, 8, 7, 0, 0),
(240, 22, 8, NULL, 2, 22, 21, 23, 24),
(241, 22, 26, NULL, 2, 94, 93, 96, 95),
(242, 22, 6, NULL, 2, 15, 14, 16, 13),
(243, 22, 18, NULL, 1, 61, 64, 62, 63),
(244, 22, 5, NULL, 4, 10, 11, 12, 9),
(245, 22, 27, NULL, 4, 99, 100, 98, 97),
(246, 22, 25, NULL, 3, 90, 91, 89, 92),
(247, 22, 7, NULL, 3, 20, 18, 17, 19),
(248, 22, 21, NULL, 1, 73, 74, 75, 76),
(249, 22, 17, NULL, 3, 58, 59, 57, 60),
(250, 22, 29, NULL, 4, 107, 106, 108, 105),
(251, 22, 24, NULL, 2, 87, 85, 86, 88),
(252, 23, 16, NULL, 2, 54, 53, 55, 56),
(253, 23, 19, NULL, 2, 66, 65, 67, 68),
(254, 23, 1, NULL, 0, 0, 0, 0, 0),
(255, 23, 24, NULL, 4, 88, 86, 87, 85),
(256, 23, 13, NULL, 1, 41, 43, 42, 44),
(257, 23, 17, NULL, 3, 59, 58, 57, 60),
(258, 23, 21, NULL, 3, 74, 75, 73, 76),
(259, 23, 12, NULL, 3, 38, 40, 37, 39),
(260, 23, 23, NULL, 4, 84, 83, 82, 81),
(261, 23, 9, NULL, 1, 25, 28, 26, 27),
(262, 23, 18, NULL, 2, 64, 61, 63, 62),
(263, 23, 28, NULL, 2, 103, 101, 102, 104),
(264, 23, 7, NULL, 2, 18, 17, 20, 19),
(265, 23, 29, NULL, 3, 108, 107, 105, 106),
(266, 23, 11, NULL, 4, 34, 35, 36, 33),
(267, 23, 20, NULL, 3, 72, 71, 69, 70),
(268, 23, 26, NULL, 3, 94, 96, 93, 95),
(269, 23, 10, NULL, 2, 32, 29, 31, 30),
(270, 23, 8, NULL, 1, 21, 24, 22, 23),
(271, 23, 6, NULL, 1, 14, 15, 16, 13),
(272, 24, 7, 2, 3, 18, 20, 17, 19),
(273, 24, 29, NULL, 2, 107, 105, 106, 108),
(274, 24, 9, NULL, 1, 25, 27, 28, 26),
(275, 24, 22, 2, 3, 78, 80, 77, 79),
(276, 24, 25, 3, 3, 92, 90, 89, 91),
(277, 24, 15, NULL, 4, 52, 51, 50, 49),
(278, 24, 27, 3, 3, 98, 100, 97, 99),
(279, 24, 3, 1, 2, 7, 8, 0, 0),
(280, 24, 23, 2, 2, 84, 81, 82, 83),
(281, 24, 14, 3, 3, 48, 46, 45, 47),
(282, 24, 6, NULL, 4, 15, 13, 16, 14),
(283, 24, 18, 1, 1, 61, 64, 62, 63),
(284, 24, 20, 1, 1, 69, 72, 70, 71),
(285, 24, 12, NULL, 4, 39, 40, 38, 37),
(286, 24, 19, 4, 4, 67, 66, 68, 65),
(287, 24, 13, NULL, 3, 43, 44, 41, 42),
(288, 24, 1, 2, 0, 0, 0, 0, 0),
(289, 24, 24, NULL, 3, 88, 87, 85, 86),
(290, 24, 5, NULL, 1, 9, 12, 11, 10),
(291, 24, 16, 3, 3, 54, 55, 53, 56),
(292, 25, 13, NULL, 4, 42, 43, 44, 41),
(293, 25, 11, NULL, 1, 33, 34, 36, 35),
(294, 25, 6, NULL, 1, 14, 13, 15, 16),
(295, 25, 15, NULL, 4, 52, 50, 51, 49),
(296, 25, 9, NULL, 2, 26, 25, 28, 27),
(297, 25, 3, NULL, 2, 7, 8, 0, 0),
(298, 25, 23, NULL, 2, 84, 81, 83, 82),
(299, 25, 20, NULL, 1, 69, 71, 70, 72),
(300, 25, 16, NULL, 3, 55, 56, 53, 54),
(301, 25, 1, NULL, 0, 0, 0, 0, 0),
(302, 25, 5, NULL, 1, 9, 12, 10, 11),
(303, 25, 26, NULL, 3, 95, 96, 93, 94),
(304, 25, 25, NULL, 4, 91, 92, 90, 89),
(305, 25, 17, NULL, 4, 59, 58, 60, 57),
(306, 25, 19, NULL, 1, 65, 67, 66, 68),
(307, 25, 14, NULL, 2, 46, 45, 47, 48),
(308, 25, 29, NULL, 1, 105, 108, 107, 106),
(309, 25, 24, NULL, 1, 85, 88, 86, 87),
(310, 25, 10, NULL, 2, 30, 29, 31, 32),
(311, 25, 21, NULL, 1, 73, 75, 76, 74);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(200) COLLATE utf8_bin NOT NULL,
  `username` varchar(200) COLLATE utf8_bin NOT NULL,
  `password` varchar(200) COLLATE utf8_bin NOT NULL,
  `id_perm` int(11) unsigned NOT NULL,
  `phone` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `detail` text COLLATE utf8_bin,
  `email` varchar(200) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `password`, `id_perm`, `phone`, `detail`, `email`) VALUES
(1, 'test', 'u5', '$2y$10$ggooBm3lTtFbZg3BbgDLNewbbUpmSzcMPH5b6MoJJK3p9bjdFEPa6', 1, '', '', 'fsddg'),
(4, 'dsh', 'n2', '1', 3, NULL, NULL, 'sabina.diako@gmail.com'),
(7, 'dsh', 'n25', '1', 20, NULL, NULL, 'sabina2.diako@gmail.com'),
(9, 'dsh', 'n27', '$2y$10$lNaDI0joVYYH1IJUocHqC.4yzhhILGyuPEhy5cIMcbDR6hG0Q8Y6.', 1, '66464', NULL, 'sabina.diako7@gmail.com'),
(10, 'test11', 't1', '1', 1, NULL, NULL, 'aa@rr.com'),
(11, 'fsa', 'n12', '$2y$10$r0jyMKGobMILvZzw9VHOZetPRjTDjhPQrk1FlL0mjPxRhZyo0DFP2', 1, NULL, NULL, 'sfsa'),
(12, 'zss', 'sfa', '$2y$10$yl8bTQjbOvwBN.bCCX4UJObS4/dR1KEahc6VSj.RqWmgDBm8yK1a2', 17, NULL, NULL, 'xzvzsv'),
(13, 'dsh', 'n2aa', '$2y$10$EQqTDOWNBLVWnlQe7y4k4OFQEvAcvxlNqonoeq8wBcx9ixGbowxE6', 3, NULL, NULL, 'sabina.diakoa@gmail.com'),
(14, 'k', 'k', '$2y$10$o1SLy2salnXSLXG3131VWOM.0vpBaoFitYwEW1GDam/I5PxRyN1Y6', 3, NULL, NULL, 'k@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_answer_question` (`id_question`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `lecture`
--
ALTER TABLE `lecture`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `perm`
--
ALTER TABLE `perm`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_question_grade` (`id_grade`),
  ADD KEY `FK_question_lecture` (`id_lecture`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_quiz_user` (`id_user`),
  ADD KEY `FK_quiz_lecture` (`id_lecture`),
  ADD KEY `FK_quiz_grade` (`id_grade`);

--
-- Indexes for table `quiz_extra`
--
ALTER TABLE `quiz_extra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_quiz_extra_quiz` (`id_quiz`),
  ADD KEY `FK_quiz_extra_question` (`id_question`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `FK_user_perm` (`id_perm`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=109;
--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `lecture`
--
ALTER TABLE `lecture`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `perm`
--
ALTER TABLE `perm`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `quiz_extra`
--
ALTER TABLE `quiz_extra`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=312;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `FK_answer_question` FOREIGN KEY (`id_question`) REFERENCES `question` (`id`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `FK_question_grade` FOREIGN KEY (`id_grade`) REFERENCES `grade` (`id`),
  ADD CONSTRAINT `FK_question_lecture` FOREIGN KEY (`id_lecture`) REFERENCES `lecture` (`id`);

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `FK_quiz_grade` FOREIGN KEY (`id_grade`) REFERENCES `grade` (`id`),
  ADD CONSTRAINT `FK_quiz_lecture` FOREIGN KEY (`id_lecture`) REFERENCES `lecture` (`id`),
  ADD CONSTRAINT `FK_quiz_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Constraints for table `quiz_extra`
--
ALTER TABLE `quiz_extra`
  ADD CONSTRAINT `FK_quiz_extra_question` FOREIGN KEY (`id_question`) REFERENCES `question` (`id`),
  ADD CONSTRAINT `FK_quiz_extra_quiz` FOREIGN KEY (`id_quiz`) REFERENCES `quiz` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_user_perm` FOREIGN KEY (`id_perm`) REFERENCES `perm` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
