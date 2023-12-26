-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 04, 2023 at 05:57 PM
-- Server version: 5.6.51
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `typing`
--

-- --------------------------------------------------------

--
-- Table structure for table `compition`
--

DROP TABLE IF EXISTS `compition`;
CREATE TABLE IF NOT EXISTS `compition` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` int(100) NOT NULL,
  `comption_id` int(100) NOT NULL,
  `total_charachter` varchar(100) NOT NULL,
  `correct_character` varchar(100) NOT NULL,
  `wrong_character` varchar(100) NOT NULL,
  `finsh_time` varchar(100) NOT NULL,
  `acuracy` varchar(100) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `request_status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `compition`
--

INSERT INTO `compition` (`id`, `user_id`, `comption_id`, `total_charachter`, `correct_character`, `wrong_character`, `finsh_time`, `acuracy`, `status`, `request_status`) VALUES
(1, 15, 5, '', '', '', '', '', 0, ''),
(2, 16, 5, '', '', '', '', '', 0, ''),
(3, 16, 5, '', '', '', '', '', 0, ''),
(4, 15, 4, '', '', '', '', '', 0, ''),
(5, 16, 4, '', '', '', '', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`message_id`, `name`, `email`, `message`) VALUES
(1, 'frman', 'talha@haddock.com', 'asdfhifheiurfhp98rh3');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) NOT NULL,
  `gmail` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_no` varchar(255) NOT NULL,
  `facebook` varchar(100) NOT NULL,
  `tawiter` varchar(100) NOT NULL,
  `instagram` varchar(100) NOT NULL,
  `github` varchar(100) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `logo`, `gmail`, `address`, `phone_no`, `facebook`, `tawiter`, `instagram`, `github`) VALUES
(1, 'Typing Master', 'admin@gmail.com', 'Sahiwal ', '+92(02938234011)', 'ti-facebook', 'ti-twitter', 'ti-instagram', 'ti-github');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
CREATE TABLE IF NOT EXISTS `test` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `test_title` varchar(255) NOT NULL,
  `test_paragraph` text NOT NULL,
  `total_time` varchar(255) NOT NULL COMMENT 'time in seconds',
  `test_type` varchar(255) NOT NULL COMMENT '1 for test / 2 for compition',
  `date_added` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `test_title`, `test_paragraph`, `total_time`, `test_type`, `date_added`) VALUES
(3, 'Test no 3', 'All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.', '4', 'test', '14-02-23'),
(4, 'Compition 1', 'All the Lorem Ipsum generat', '4', 'compition', '14-02-23'),
(5, 'Compition 2', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry', '4', 'compition', '');

-- --------------------------------------------------------

--
-- Table structure for table `test_results`
--

DROP TABLE IF EXISTS `test_results`;
CREATE TABLE IF NOT EXISTS `test_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `totalWords` int(11) NOT NULL,
  `typedWords` int(11) NOT NULL,
  `wrongWords` int(11) NOT NULL,
  `timeTaken` varchar(255) NOT NULL,
  `accuracy` varchar(255) NOT NULL,
  `wpm` longtext NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `test_results`
--

INSERT INTO `test_results` (`id`, `totalWords`, `typedWords`, `wrongWords`, `timeTaken`, `accuracy`, `wpm`) VALUES
(1, 4, 4, 2, '6', '50', '[60,0,0,20,30,24]'),
(2, 23, 24, 23, '9', '4', '[0,0,0,0,0,0,0,0,0]'),
(3, 23, 24, 10, '22', '58', '[60,120,90,40,60,48,40,60,45,47,48,55,55,51,47,44,49,46,40,44,42,40]'),
(4, 4, 4, 0, '11', '100', '[0,0,30,60,30,36,40,9,15,20,24]'),
(5, 23, 24, 9, '22', '63', '[60,120,60,40,60,60,50,43,45,40,36,33,35,42,43,44,41,39,40,41,42,40]'),
(6, 23, 24, 7, '21', '71', '[60,120,120,80,90,84,90,86,83,67,66,65,55,65,60,60,56,56,57,51,48]'),
(7, 4, 4, 4, '4', '0', '[60,0,0,20]'),
(8, 4, 4, 1, '9', '75', '[0,0,30,20,15,24,20,26,23]'),
(9, 4, 4, 1, '5', '75', '[60,120,90,80,45]'),
(10, 23, 24, 22, '8', '8', '[120,60,30,20,15,12,10,9]'),
(11, 127, 127, 124, '25', '2', '[60,60,60,40,30,24,30,34,30,27,24,22,20,18,17,12,11,11,13,9,9,11,8,10,10]'),
(12, 23, 2, 1, '60', '50', '[0,0,30,20,15,12,10,9,8,7,6,5,5,5,4,4,4,4,3,3,3,3,3,3,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]'),
(13, 23, 4, 1, '60', '75', '[60,120,60,40,30,24,20,17,23,20,18,16,15,14,13,12,11,11,10,9,9,9,8,8,8,7,7,7,6,6,6,6,6,5,5,5,5,5,5,5,5,4,4,4,4,4,4,4,4,4,4,4,3,3,3,3,3,3,3,3]'),
(14, 127, 11, 2, '60', '82', '[120,180,120,100,105,108,100,86,75,67,60,55,50,46,43,40,38,35,33,32,30,29,27,26,25,24,23,22,21,21,20,19,19,18,18,17,17,16,16,15,15,15,14,14,14,13,13,13,13,12,12,12,12,11,11,11,11,11,10,10]'),
(15, 127, 127, 111, '33', '13', '[60,0,60,80,90,96,90,94,83,73,66,60,55,51,47,44,41,39,37,35,33,31,30,31,33,36,35,36,34,33,32,31,30]'),
(16, 4, 4, 2, '5', '50', '[60,120,60,60,30]'),
(17, 127, 127, 117, '14', '8', '[60,180,150,120,120,120,110,94,83,73,66,60,55,660,330,220,165,120,100,94,83,67,66,55,50,51]'),
(18, 106, 9, 2, '60', '78', '[0,60,60,40,60,72,80,69,60,53,48,44,40,37,34,32,30,28,27,25,24,23,22,21,20,19,18,18,17,17,16,15,15,15,14,14,13,13,13,12,12,12,11,11,11,11,10,10,10,10,10,9,9,9,9,9,9,8,8,8]'),
(19, 106, 10, 6, '60', '40', '[60,60,30,20,15,12,10,9,8,7,6,5,5,5,4,4,4,4,3,3,3,6,8,10,10,10,9,9,9,8,8,8,8,7,7,7,7,6,6,6,6,6,6,6,5,5,5,5,5,5,5,5,5,5,4,4,4,4,4,4]'),
(20, 106, 3, 1, '60', '67', '[0,60,30,20,30,24,20,17,15,13,12,11,10,9,9,8,8,7,7,6,6,6,5,5,5,5,5,4,4,4,4,4,4,4,4,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,2,2,2,2,2,2,2,2,2,2]'),
(21, 106, 4, 0, '50', '100', '[0,0,0,0,15,36,40,34,30,27,24,240,120,80,60,48,40,34,30,27,24,22,20,18,17,16,15,14,13,13,12,11,11,10,10,10,9,9,9,8,8,8,8,7,7,7,7,6,6,6,6,6,6,6,5,5,5,5,5,5]'),
(22, 4, 4, 1, '4', '75', '[60,60,60,60]'),
(23, 4, 4, 0, '6', '100', '[60,120,30,20,45,48]'),
(24, 106, 8, 2, '52', '75', '[120,60,30,40,60,72,60,51,8,60,60,40,60,48,60,51,38,33,30,27,25,23,21,20,19,18,17,16,15,14,14,13,13,12,12,11,11,10,10,10,9,9,9,9,8,8,8,8,8,7,7,7,7,7,7,6,6,6,6,6]'),
(25, 106, 0, 0, '56', '0', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]'),
(26, 106, 0, 0, '60', '0', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]'),
(27, 106, 0, 0, '59', '0', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]'),
(28, 106, 0, 0, '56', '0', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]'),
(29, 106, 9, 9, '49', '0', '[0,0,0,0,0,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]'),
(30, 106, 0, 0, '60', '0', '[120,240,180,160,135,108,100,94,90,93,90,87,90,83,77,72,68,64,60,57,54,51,49,47,45,43,42,40,39,37,36,35,34,33,32,31,30,29,28,28,27,26,26,25,25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]'),
(31, 4, 4, 1, '3', '75', '[60,120,90]'),
(32, 106, 6, 1, '60', '83', '[60,180,150,100,75,60,50,43,38,33,30,27,25,23,21,20,19,18,17,16,15,14,14,13,13,12,12,11,11,10,10,10,9,9,9,9,8,8,8,8,8,7,7,7,7,7,7,6,6,6,6,6,6,6,6,5,5,5,5,5]'),
(33, 23, 24, 17, '19', '29', '[60,120,90,40,45,48,40,51,38,33,30,27,25,23,21,20,23,21,20]'),
(34, 4, 4, 4, '3', '0', '[0,0,0]'),
(35, 23, 24, 23, '4', '4', '[0,0,0,0]'),
(36, 4, 4, 4, '2', '0', '[0,0]'),
(37, 127, 127, 121, '20', '5', '[0,60,120,100,90,72,70,60,45,47,36,38,30,32,30,24,26,21,20,22]'),
(38, 4, 4, 4, '4', '0', '[0,0,0,0]'),
(39, 23, 12, 4, '60', '67', '[60,60,30,20,15,12,10,17,15,27,24,16,20,28,26,24,26,25,27,25,21,20,19,18,18,17,16,16,15,14,14,14,13,13,12,12,12,11,11,11,11,10,10,10,10,9,9,9,9,9,8,8,8,8,8,8,8,7,7,7]'),
(40, 127, 127, 123, '30', '3', '[60,120,60,40,15,24,20,17,8,13,6,5,10,14,17,16,23,14,17,16,15,11,11,13,13,12,12,11,9,8]'),
(41, 127, 20, 1, '60', '95', '[0,0,0,20,30,48,50,60,60,67,66,71,75,69,73,76,71,67,63,60,57,54,52,50,48,46,44,42,41,39,38,37,36,35,34,33,32,31,30,29,29,28,27,27,26,25,25,24,24,23,23,22,22,22,21,21,20,20,20,19]'),
(42, 106, 106, 98, '23', '8', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]'),
(43, 109, 109, 100, '20', '8', '[60,60,60,60,60,72,80,77,68,67,60,55,45,42,39,36,38,32,33,28]'),
(44, 109, 109, 108, '20', '1', '[0,0,0,0,0,0,10,9,8,7,6,5,5,5,4,4,4,4,3,3]'),
(45, 106, 106, 106, '15', '0', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]'),
(46, 109, 109, 109, '14', '0', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0]'),
(47, 135, 137, 136, '20', '1', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]'),
(48, 135, 135, 135, '20', '0', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]'),
(49, 106, 4, 1, '60', '75', '[60,120,90,60,45,36,30,26,23,20,18,16,15,14,13,12,11,11,10,9,9,9,8,8,8,7,7,7,6,6,6,6,6,5,5,5,5,5,5,5,5,4,4,4,4,4,4,4,4,4,4,4,3,3,3,3,3,3,3,3]'),
(50, 23, 24, 21, '5', '13', '[120,120,90,60,30,24,20,17,15,180,60,40,30]'),
(51, 23, 24, 6, '25', '75', '[0,0,0,0,15,36,30,26,23,33,36,33,30,32,34,32,30,32,33,38,39,40,41,44,43]'),
(52, 23, 15, 4, '60', '73', '[60,60,30,20,15,12,40,34,38,40,42,38,35,32,30,28,30,28,33,32,30,31,30,31,33,34,35,33,32,21,14,14,13,15,16,17,17,16,17,17,18,19,20,21,20,20,20,19,19,20,19,13,8,8,8,9,11,11,10,11]'),
(53, 106, 0, 0, '60', '0', '[60,180,180,160,150,132,120,103,98,87,78,71,65,65,21,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]'),
(54, 109, 60, 5, '60', '92', '[60,120,90,80,90,84,90,94,98,93,96,93,90,92,86,84,86,85,83,85,87,86,87,86,88,89,90,89,88,85,82,83,84,84,85,86,80,79,79,77,75,73,71,70,68,68,65,65,64,62,61,60,59,58,58,58,59,58,57,56]'),
(55, 109, 1, 1, '60', '0', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]'),
(56, 109, 9, 5, '60', '44', '[60,120,90,60,60,48,40,26,23,20,18,16,15,14,13,12,11,11,10,9,9,9,8,8,8,7,7,7,6,6,6,6,6,5,5,5,5,5,5,5,5,4,4,4,4,4,4,4,4,4,4,4,3,3,3,3,3,3,3,3]'),
(57, 127, 14, 11, '15', '21', '[60,60,60,40,30,24,20,17,15,13,12,11,10,9,9]'),
(58, 135, 28, 12, '30', '57', '[60,60,90,60,75,60,50,43,45,40,36,33,30,28,30,28,23,21,23,22,27,26,30,29,33,31,35,33,34,33]'),
(59, 135, 28, 12, '30', '57', '[60,60,90,60,75,60,50,43,45,40,36,33,30,28,30,28,23,21,23,22,27,26,30,29,33,31,35,33,34,33]'),
(60, 109, 86, 24, '60', '72', '[120,240,120,140,135,132,130,129,113,100,90,82,75,69,69,64,64,60,60,57,54,57,57,60,63,65,62,60,56,54,56,58,58,60,60,57,60,62,63,65,66,67,66,67,68,68,69,70,70,71,71,71,69,68,67,67,64,63,64,63]'),
(61, 4, 4, 1, '11', '75', '[0,60,30,20,15,24,20,17,23,20,18]');

-- --------------------------------------------------------

--
-- Table structure for table `typing_lessons`
--

DROP TABLE IF EXISTS `typing_lessons`;
CREATE TABLE IF NOT EXISTS `typing_lessons` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `practiceParagraph` longtext NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `typing_lessons`
--

INSERT INTO `typing_lessons` (`id`, `title`, `type`, `practiceParagraph`) VALUES
(1, 'HomeRowLeft', 1, 'as sa as sa as sa as sa as sa df fd df fd df fd df fd df fd as sa as sa as sa as sa as sa df fd df fd df fd df fd df fd as sa as sa as sa as sa as sa df fd df fd df fd df fd df fd  aaa ssss dddd ffff asdf asdf fdsa fdsa aaa ssss dddd ffff asdf asdf fdsa fdsa aaa ssss dddd ffff asdf asdf fdsa fdsa aaa ssss dddd ffff asdf asdf fdsa fdsa aaa ssss dddd ffff asdf asdf fdsa fdsa aaa ssss dddd ffff asdf asdf fdsa '),
(2, 'HomeRowRight', 1, 'jk kj jk kj jk kj jk kj jk kj jk kj jk kj jk kj jk kj jk kj jk kj jk kj jk kj l; ;l l; ;l l; ;l l; ;l l; ;l l; ;l l; ;l l; ;l l; ;l l; ;l l; ;l jkl; ;lkj jkl; ;lkj jkl; ;lkj jkl; ;lkj jkl; ;lkj jkl; ;lkj jkl; ;lkj jkl; ;lkj jk kj jk kj jk kj jk kj jk kj jk kj jk kj jk kj jk kj jk kj jk kj jk kj jk kj l; ;l l; ;l l; ;l l; ;l l; ;l l; ;l l; ;l l; ;l l; ;l l; ;l l; ;l jkl; ;lkj jkl; ;lkj jkl; ;lkj jkl; ;lkj jkl; ;lkj jkl; ;lkj jkl; ;lkj jkl; ;lkj'),
(3, 'TopRowLeft', 2, 'qw wq qw wq qw wq qw wq qw wq qw wq qw wq qw wq qw wq qw wq qw wq qw wq qw wq qw wq we ew we ew we ew we ew we ew we ew we ew we ew we ew we ew we ew we ew we ew we ew er re er re er re er re er re er re er re er re er re er re er re er re er re er re qwert trewq qwert trewq qwert trewq qwert trewq qwert trewq qwert trewq qwert trewq qwert trewq qwert trewq qwert trewq qwert trewq qwert trewq qwert trewq'),
(4, 'TopRowRight', 2, 'yu uy yu uy yu uy yu uy yu uy yu uy yu uy yu uy yu uy yu uy yu uy yu uy yu uy yu ui iu ui iu ui iu ui iu ui iu ui iu ui iu ui iu ui iu ui iu ui iu ui iu ui iu ui io oi io oi io oi io oi io oi io oi io oi io oi io oi io oi io oi io oi io oi io op po op po op po op po op po op po op po op po op po op po op po op po op po op yuiop poiuy yuiop poiuy yuiop poiuy yuiop poiuy yuiop poiuy yuiop poiuy yuiop poiuy yuiop poiuy yuiop poiuy yuiop poiuy yuiop poiuy yuiop poiuy yuiop poiuy yuiop poiuy  ');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gmail` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL COMMENT '1 for admin / 2 for user',
  `image` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `gmail`, `password`, `type`, `image`) VALUES
(1, 'Talha', 'Rasheed', 'talha@haddock.com', '81dc9bdb52d04dc20036dbd8313ed055', 'user', ''),
(2, 'admin', 'admin', 'admin@gmail.com', '3b712de48137572f3849aabd5666a4e3', 'admin', ''),
(3, 'Hammad', 'Hayat', 'hammadhayat682@gmail.com', 'hammad1234', 'user', ''),
(5, 'faqia', 'abbas', 'faqia@gmail.com', 'abcd1234', 'user', ''),
(16, 'Hiraa', 'ch', 'hira@gmail.com', '4297f44b13955235245b2497399d7a93', 'user', ''),
(15, 'asd', 'asd', 'asd@gmail.com', '4297f44b13955235245b2497399d7a93', 'user', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_test`
--

DROP TABLE IF EXISTS `user_test`;
CREATE TABLE IF NOT EXISTS `user_test` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) NOT NULL,
  `test_id` int(255) NOT NULL,
  `total_character` int(255) NOT NULL,
  `correct_character` int(255) NOT NULL,
  `wrong_character` int(255) NOT NULL,
  `start_time` varchar(255) NOT NULL,
  `finsh_time` varchar(255) NOT NULL,
  `acuracy` varchar(255) NOT NULL,
  `status` varchar(100) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_test`
--

INSERT INTO `user_test` (`id`, `user_id`, `test_id`, `total_character`, `correct_character`, `wrong_character`, `start_time`, `finsh_time`, `acuracy`, `status`) VALUES
(1, 1, 1, 29, 29, 5, '', '10', '90', 'Excellent'),
(2, 1, 2, 28, 28, 2, '', '14', '92.85714285714286', 'Excellent'),
(3, 1, 2, 28, 28, 28, '', '54', '0', 'Poor'),
(4, 1, 1, 29, 29, 113, '', '53', '-289.65517241379314', 'Poor'),
(5, 3, 1, 29, 29, 3, '', '20', '89.65517241379311', 'Good'),
(6, 4, 1, 29, 29, 0, '', '23', '100', 'Excellent'),
(7, 1, 1, 30, 30, 2, '', '16', '93.33333333333333', 'Excellent'),
(8, 6, 1, 30, 30, 0, '', '13', '100', 'Excellent'),
(9, 12, 1, 30, 29, 6, '', '0', '76.66666666666666', ''),
(10, 12, 1, 30, 30, 3, '', '13', '90', 'Good'),
(11, 13, 3, 147, 47, 7, '', '0', '27.2108843537415', '');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
