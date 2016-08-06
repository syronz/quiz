-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 07, 2016 at 12:41 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.6

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

CREATE TABLE `answer` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_question` int(10) UNSIGNED NOT NULL,
  `content` varchar(2000) COLLATE utf8_bin NOT NULL,
  `result` tinyint(1) UNSIGNED ZEROFILL NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='id\r\nid_question\r\ncontent\r\nimage\r\nresult';

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`id`, `id_question`, `content`, `result`) VALUES
(117, 33, '7', 0),
(118, 33, '18', 0),
(119, 33, '124', 1),
(120, 33, '16', 0),
(121, 34, '258', 0),
(122, 34, '78', 1),
(123, 34, '15', 0),
(124, 34, '60', 0),
(125, 35, 'var obj = new Object(); or var obj = {};', 1),
(126, 35, 'var obj = Object();', 0),
(127, 35, 'obj = new Class;', 0),
(128, 35, 'object = new function(){return class;}', 0),
(129, 36, 'reverse()', 0),
(130, 36, 'shift()', 1),
(131, 36, 'slice()', 0),
(132, 36, 'some()', 0),
(133, 37, 'string x = &quot;Hello&quot;;', 0),
(134, 37, 'var  x = &quot;Hello&quot;;', 1),
(135, 37, 'text x = &quot;Hello&quot;;', 0),
(136, 37, 'Strings x = &quot;Hello&quot;;', 0),
(137, 38, 'int x = 4;', 0),
(138, 38, 'var x &gt; 3;', 0),
(139, 38, 'var x = 4;', 1),
(140, 38, 'int x &gt; 3;', 0),
(141, 39, '4', 1),
(142, 39, '5', 0),
(143, 39, 'ERROR', 0),
(144, 39, '44', 0),
(145, 40, '7', 0),
(146, 40, '3', 0),
(147, 40, '4', 0),
(148, 40, '1', 1),
(149, 41, '==', 0),
(150, 41, '!=', 0),
(151, 41, '*=', 1),
(152, 41, '&lt;=', 0),
(153, 42, 'case', 1),
(154, 42, 'condition', 0),
(155, 42, 'if', 0),
(156, 42, 'else', 0),
(157, 43, 'var', 0),
(158, 43, 'func', 0),
(159, 43, 'function', 1),
(160, 43, 'new Object()', 0),
(161, 44, 'for(var i = 0; i &lt; 5; i++)', 1),
(162, 44, 'for(var i = 0, i &lt; 5)', 0),
(163, 44, 'for(i &lt; 5){\ni++;\n}', 0),
(164, 44, 'for(var i = 0, i++, i &lt; 5)', 0),
(165, 45, 'break', 1),
(166, 45, 'exit', 0),
(167, 45, 'continue', 0),
(168, 45, 'forward', 0),
(169, 46, '&#039;I&#039;m awesome&#039;', 0),
(170, 46, '&quot;I&#039;m awesome&quot;', 1),
(172, 46, 'I + &#039;m awesome&#039;', 0),
(173, 46, 'None of these', 0),
(174, 47, 'document.getElementsByID()', 0),
(175, 47, 'document.getElementsById()', 0),
(176, 47, 'document.GetElementByID()', 0),
(177, 47, 'document.getElementById()', 1),
(178, 48, 'example.length', 1),
(179, 48, 'example.count', 0),
(180, 48, 'example.len', 0),
(181, 48, 'example.number', 0),
(182, 49, 'example.toLowerCase()', 1),
(183, 49, 'example.lowerCase()', 0),
(184, 49, 'example.toLower()', 0),
(185, 49, 'example.lower()', 0),
(186, 50, 'var example = (&#039;aa&#039;, &#039;bb&#039;);', 0),
(187, 50, 'var example = array(&#039;aa&#039;, &#039;bb&#039;);', 0),
(188, 50, 'var example = [&#039;aa&#039;, &#039;bb&#039;];', 1),
(189, 50, 'var example = new (&#039;aa&#039;, &#039;bb&#039;);', 0),
(190, 51, 'Math.round(x);', 1),
(191, 51, 'Math.ceil(x);', 0),
(192, 51, 'Math.floor(x)', 0),
(193, 51, 'x.floor()', 0),
(194, 52, '&lt;javascript&gt;', 0),
(195, 52, '&lt;script&gt;', 1),
(196, 52, '&lt;source&gt;', 0),
(197, 52, '&lt;js&gt;&lt;/js&gt;', 0),
(198, 53, '&lt; script href = &ldquo;formValidation.js&rdquo;&gt;', 0),
(199, 53, '&lt; script source = &ldquo;formValidation.js&rdquo;&gt;', 0),
(200, 53, '&lt; script name = &ldquo;formValidation.js&rdquo;&gt;', 0),
(201, 53, '&lt; script src = &ldquo;formValidation.js&rdquo;&gt;', 1);

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8_bin NOT NULL,
  `detail` varchar(200) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`id`, `name`, `detail`) VALUES
(1, 'Level 1', NULL),
(2, 'Level 2', NULL),
(3, 'Level 3', '');

-- --------------------------------------------------------

--
-- Table structure for table `lecture`
--

CREATE TABLE `lecture` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8_bin NOT NULL,
  `detail` varchar(200) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `lecture`
--

INSERT INTO `lecture` (`id`, `name`, `detail`) VALUES
(1, 'Javascript', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `perm`
--

CREATE TABLE `perm` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `perm` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '0000',
  `user` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '0000',
  `grade` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '0000',
  `lecture` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '0000',
  `question` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '0000',
  `quiz` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '0000',
  `answer` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '0000',
  `detail` varchar(200) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `perm`
--

INSERT INTO `perm` (`id`, `name`, `perm`, `user`, `grade`, `lecture`, `question`, `quiz`, `answer`, `detail`) VALUES
(1, 'Admin', '1111', '1101', '1111', '1111', '1111', '1111', '1111', ''),
(3, 'user', '0000', '0000', '0000', '0000', '1000', '1111', '0000', '');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_grade` int(10) UNSIGNED NOT NULL,
  `id_lecture` int(10) UNSIGNED NOT NULL,
  `right` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `wrong` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `star` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `difficulty` float UNSIGNED NOT NULL DEFAULT '0',
  `content` varchar(2000) COLLATE utf8_bin NOT NULL,
  `image` varchar(300) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='id\r\nid_grade\r\nid_lecture\r\ndifficulty\r\ncontent\r\nimage';

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `id_grade`, `id_lecture`, `right`, `wrong`, `star`, `difficulty`, `content`, `image`) VALUES
(33, 1, 1, 0, 0, 3, 0, 'What does &quot;1&quot;+2+4 evaluate to?', NULL),
(34, 1, 1, 0, 0, 5, 0, 'What does  2+5+&quot;8&quot;  evaluate to?', NULL),
(35, 1, 1, 0, 0, 1, 0, 'How do you create a new object in JavaScript?', NULL),
(36, 1, 1, 0, 0, 4, 0, 'Which of the following function of Array object removes the first element from an array and returns that element?', NULL),
(37, 1, 1, 0, 0, 1, 0, 'How do you create a variable x that is equal to the string &quot;Hello&quot;?', NULL),
(38, 1, 1, 0, 0, 1, 0, 'How do you create a variable x that is equal to the integer 4?', NULL),
(39, 1, 1, 0, 0, 2, 0, 'If the variable x is already defined and equals 4. Now, if the statement is &quot;console.log(x++);&quot;, what would be displayed in the console?', NULL),
(40, 1, 1, 0, 0, 4, 0, 'If x equals 7, and the only other statement is x = x % 3, what would be the new value of x?', NULL),
(41, 1, 1, 0, 0, 2, 0, 'Which of the following is not a comparison operator used in an if statement?', NULL),
(42, 1, 1, 0, 0, 1, 0, 'What is the keyword inside of a switch statement to create a condition?', NULL),
(43, 1, 1, 0, 0, 1, 0, 'What is the keyword to define a function in JavaScript?', NULL),
(44, 1, 1, 0, 0, 2, 0, 'Which of the following is an acceptable declaration of a for loop?', ''),
(45, 1, 1, 0, 0, 2, 0, 'What statement can you use to completely exit a loop and continue on through your code?', ''),
(46, 1, 1, 0, 0, 5, 0, 'In the string variable &#039;I&#039;m awesome&#039;, would throw an error. Which of the following is a correct way to correct this problem?', NULL),
(47, 1, 1, 0, 0, 4, 0, 'What is a correct way to get an HTML element by its id?', ''),
(48, 1, 1, 0, 0, 3, 0, 'How would you get the number of characters in the string variable example?', ''),
(49, 1, 1, 0, 0, 2, 0, 'In JavaScript, how to you convert a string to lower case?', ''),
(50, 1, 1, 0, 0, 2, 0, 'How do you create an array in JavaScript?', ''),
(51, 1, 1, 0, 0, 3, 0, 'How would you round up a number with a decimal to the nearest integer?', ''),
(52, 1, 1, 0, 0, 2, 0, 'Internal JavaScript code is encased in what tag?', ''),
(53, 1, 1, 0, 0, 2, 0, 'Which of the following syntax is correct to refer an external script called &ldquo;formValidation.js&rdquo;?', '');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `id_lecture` int(10) UNSIGNED NOT NULL,
  `id_grade` int(10) UNSIGNED NOT NULL,
  `result` float DEFAULT NULL,
  `duration` int(11) UNSIGNED DEFAULT NULL,
  `start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end` timestamp NULL DEFAULT NULL,
  `detail` varchar(500) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='id\r\nid_user\r\nid_lecture\r\nid_grade\r\nresult\r\nduration\r\nstart\r\nend\r\ndetail\r\n';

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`id`, `id_user`, `id_lecture`, `id_grade`, `result`, `duration`, `start`, `end`, `detail`) VALUES
(33, 15, 1, 1, 95, 60, '2016-08-06 22:10:00', '2016-08-06 22:14:05', NULL),
(34, 20, 1, 1, 5, 60, '2016-08-06 22:21:42', '2016-08-06 22:21:50', NULL),
(35, 20, 1, 1, 0, 60, '2016-08-06 22:22:42', '2016-08-06 22:22:51', NULL),
(36, 21, 1, 1, 10, 60, '2016-08-06 22:25:44', '2016-08-06 22:26:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_extra`
--

CREATE TABLE `quiz_extra` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_quiz` int(11) UNSIGNED NOT NULL,
  `id_question` int(10) UNSIGNED NOT NULL,
  `selected` tinyint(1) UNSIGNED DEFAULT NULL,
  `right_answer` tinyint(1) UNSIGNED NOT NULL,
  `id_a1` int(10) UNSIGNED DEFAULT NULL,
  `id_a2` int(10) UNSIGNED DEFAULT NULL,
  `id_a3` int(10) UNSIGNED DEFAULT NULL,
  `id_a4` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='id\r\nid_quiz\r\nid_question\r\nselected\r\nright_answer\r\nid_a1\r\nid_a2\r\nid_a3\r\nid_a4';

--
-- Dumping data for table `quiz_extra`
--

INSERT INTO `quiz_extra` (`id`, `id_quiz`, `id_question`, `selected`, `right_answer`, `id_a1`, `id_a2`, `id_a3`, `id_a4`) VALUES
(398, 33, 47, 1, 1, 177, 174, 176, 175),
(399, 33, 50, 3, 3, 186, 189, 188, 187),
(400, 33, 37, 1, 1, 134, 136, 135, 133),
(401, 33, 52, 3, 3, 194, 197, 195, 196),
(402, 33, 48, 1, 1, 178, 179, 180, 181),
(403, 33, 43, 4, 4, 160, 158, 157, 159),
(404, 33, 41, 4, 4, 152, 150, 149, 151),
(405, 33, 40, 4, 4, 146, 145, 147, 148),
(406, 33, 49, 1, 1, 182, 185, 183, 184),
(407, 33, 36, 2, 2, 131, 130, 129, 132),
(408, 33, 33, 3, 3, 118, 117, 119, 120),
(409, 33, 46, 2, 2, 169, 170, 173, 172),
(410, 33, 42, 4, 4, 156, 155, 154, 153),
(411, 33, 38, 1, 1, 139, 137, 138, 140),
(412, 33, 34, 4, 4, 123, 124, 121, 122),
(413, 33, 35, 1, 1, 125, 126, 127, 128),
(414, 33, 51, 4, 4, 191, 192, 193, 190),
(415, 33, 44, 1, 4, 164, 163, 162, 161),
(416, 33, 45, 3, 3, 167, 166, 165, 168),
(417, 33, 39, 4, 4, 143, 144, 142, 141),
(418, 34, 35, 1, 3, 127, 128, 125, 126),
(419, 34, 37, NULL, 1, 134, 135, 136, 133),
(420, 34, 47, NULL, 2, 176, 177, 174, 175),
(421, 34, 51, 1, 2, 191, 190, 192, 193),
(422, 34, 33, NULL, 4, 120, 117, 118, 119),
(423, 34, 38, NULL, 4, 138, 137, 140, 139),
(424, 34, 50, 1, 1, 188, 187, 189, 186),
(425, 34, 41, NULL, 1, 151, 152, 150, 149),
(426, 34, 46, NULL, 3, 169, 173, 170, 172),
(427, 34, 48, NULL, 3, 179, 181, 178, 180),
(428, 34, 39, NULL, 4, 142, 144, 143, 141),
(429, 34, 44, NULL, 2, 163, 161, 164, 162),
(430, 34, 49, NULL, 1, 182, 185, 183, 184),
(431, 34, 34, NULL, 2, 123, 122, 124, 121),
(432, 34, 45, NULL, 2, 166, 165, 168, 167),
(433, 34, 36, NULL, 4, 129, 131, 132, 130),
(434, 34, 52, NULL, 3, 196, 194, 195, 197),
(435, 34, 53, NULL, 3, 200, 198, 201, 199),
(436, 34, 43, NULL, 3, 158, 160, 159, 157),
(437, 34, 40, NULL, 1, 148, 147, 145, 146),
(438, 35, 41, 2, 3, 150, 152, 151, 149),
(439, 35, 47, NULL, 4, 174, 176, 175, 177),
(440, 35, 53, 4, 1, 201, 199, 198, 200),
(441, 35, 49, NULL, 4, 185, 183, 184, 182),
(442, 35, 38, NULL, 1, 139, 138, 140, 137),
(443, 35, 46, 3, 4, 169, 173, 172, 170),
(444, 35, 40, NULL, 2, 145, 148, 147, 146),
(445, 35, 51, NULL, 4, 191, 193, 192, 190),
(446, 35, 50, 2, 1, 188, 189, 187, 186),
(447, 35, 43, NULL, 1, 159, 157, 160, 158),
(448, 35, 45, NULL, 1, 165, 166, 167, 168),
(449, 35, 34, 2, 4, 121, 124, 123, 122),
(450, 35, 37, NULL, 3, 136, 133, 134, 135),
(451, 35, 39, NULL, 4, 143, 142, 144, 141),
(452, 35, 52, NULL, 4, 194, 196, 197, 195),
(453, 35, 33, NULL, 4, 118, 117, 120, 119),
(454, 35, 35, NULL, 2, 128, 125, 126, 127),
(455, 35, 44, NULL, 3, 164, 162, 161, 163),
(456, 35, 42, NULL, 1, 153, 156, 154, 155),
(457, 35, 36, NULL, 4, 131, 129, 132, 130),
(458, 36, 36, 1, 3, 132, 129, 130, 131),
(459, 36, 50, 2, 2, 189, 188, 186, 187),
(460, 36, 42, 2, 1, 153, 154, 156, 155),
(461, 36, 47, 1, 1, 177, 176, 174, 175),
(462, 36, 34, NULL, 2, 121, 122, 123, 124),
(463, 36, 40, 3, 4, 146, 147, 145, 148),
(464, 36, 45, NULL, 4, 168, 167, 166, 165),
(465, 36, 48, 4, 1, 178, 179, 180, 181),
(466, 36, 33, NULL, 1, 119, 118, 117, 120),
(467, 36, 53, 4, 3, 199, 198, 201, 200),
(468, 36, 43, NULL, 3, 157, 160, 159, 158),
(469, 36, 37, NULL, 2, 133, 134, 135, 136),
(470, 36, 44, NULL, 2, 163, 161, 162, 164),
(471, 36, 51, 2, 1, 190, 193, 191, 192),
(472, 36, 52, NULL, 4, 197, 196, 194, 195),
(473, 36, 35, NULL, 2, 127, 125, 128, 126),
(474, 36, 39, NULL, 4, 142, 144, 143, 141),
(475, 36, 41, NULL, 3, 150, 152, 151, 149),
(476, 36, 46, NULL, 1, 170, 169, 172, 173),
(477, 36, 38, NULL, 2, 138, 139, 140, 137);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8_bin NOT NULL,
  `username` varchar(200) COLLATE utf8_bin NOT NULL,
  `password` varchar(200) COLLATE utf8_bin NOT NULL,
  `id_perm` int(11) UNSIGNED NOT NULL,
  `phone` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `detail` text COLLATE utf8_bin,
  `email` varchar(200) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `password`, `id_perm`, `phone`, `detail`, `email`) VALUES
(15, 'dsh', 'q', '$2y$10$paa./b1z63YwgE7JB5AiPON5SzAw1efsB8CuiaIaE2vSc/MrsQGjS', 1, NULL, NULL, 'sabina.q@gmail.com'),
(18, 'Diako', 'syronz', '$2y$10$LzaF9JXZr4CsUCu3agjz4.FN.Q2tXLyEfzLRqpcy6dN8hwNcHuNYe', 3, NULL, NULL, 'sabina.diako@gmail.com'),
(20, 'Accessories', 'a', '$2y$10$VOQof7w0AMH2Dc1ki77KWOgaAzkA/l7KtXUWnyGMf.DGAFHUvwsVK', 3, NULL, NULL, 'a@b.com'),
(21, 'test', 'test', '$2y$10$5tBR5ePSM9cA98V3kZEAe.X3iTgMrSFvtGyH/HHHKKKjYUHqgqEwy', 3, NULL, NULL, 'test@gmail.com');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;
--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `lecture`
--
ALTER TABLE `lecture`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `perm`
--
ALTER TABLE `perm`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `quiz_extra`
--
ALTER TABLE `quiz_extra`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=478;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
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
