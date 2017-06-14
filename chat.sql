-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2017 at 12:38 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `chat`
--

-- --------------------------------------------------------

--
-- Table structure for table `log_file`
--

CREATE TABLE IF NOT EXISTS `log_file` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `main_chat`
--

CREATE TABLE IF NOT EXISTS `main_chat` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message_body` text NOT NULL,
  `msg_lang_code` text NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL,
  `m_sent` text NOT NULL,
  `m_received` text NOT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=80 ;

--
-- Dumping data for table `main_chat`
--

INSERT INTO `main_chat` (`message_id`, `sender_id`, `receiver_id`, `message_body`, `msg_lang_code`, `time`, `date`, `m_sent`, `m_received`) VALUES
(1, 2, 1, 'hello', 'ar', '11:49:41', '2017-05-21', '1', '0'),
(2, 2, 1, 'how are you ? ', 'ar', '11:49:50', '2017-05-21', '1', '0'),
(3, 1, 2, 'hello ', 'en', '11:52:29', '2017-05-21', '1', '0'),
(4, 1, 2, 'how are you ? ', 'en', '11:52:36', '2017-05-21', '1', '0'),
(5, 1, 2, 'hello ', 'en', '12:11:09', '2017-05-21', '1', '0'),
(6, 1, 2, 'i hope you are in good health', 'en', '12:11:18', '2017-05-21', '1', '0'),
(7, 4, 3, 'hello', 'en', '13:05:44', '2017-05-21', '1', '0'),
(8, 4, 3, 'how are you ? ', 'en', '13:05:50', '2017-05-21', '1', '0'),
(9, 4, 3, ' i miss you ', 'en', '13:05:56', '2017-05-21', '1', '0'),
(10, 3, 4, 'Ø§Ù†Ø§ Ø¨Ø®ÙŠØ± ', 'ar', '13:11:34', '2017-05-21', '1', '0'),
(11, 3, 4, 'Ø§Ù†Ø§ ÙÙŠ Ù…Ù†ØªØµÙ Ø§Ù„Ø§Ù…ØªØ­Ù†Ø§Øª Ø­Ø§Ù„ÙŠØ§', 'ar', '13:11:56', '2017-05-21', '1', '0'),
(12, 3, 4, 'Ø§Ù†Ø§ Ø§ÙØªÙ‚Ø¯Ùƒ Ø§ÙŠØ¶Ø§', 'ar', '13:12:26', '2017-05-21', '1', '0'),
(13, 4, 3, 'what is this that you wrote ? ', 'en', '13:30:23', '2017-05-21', '1', '0'),
(14, 4, 3, 'hello  ? ', 'en', '13:35:07', '2017-05-21', '1', '0'),
(15, 4, 3, 'hello ?', 'en', '13:37:16', '2017-05-21', '1', '0'),
(16, 4, 3, ' are you here ?', 'en', '13:37:31', '2017-05-21', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `user_token` text NOT NULL,
  `state` text NOT NULL,
  `admin` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `password`, `user_token`, `state`, `admin`) VALUES
(1, 'Nour', '577a1cf3fc036759366379bbc2c8387650ae32f9', 'e7E27cvSmwI:APA91bHsDzqq5C8cCR2fujmrww6z0_eMYo9_B7hZs8iFr17XupiyEup-Q9E9jOXAFAznxWUKC0YrHTtZ_ncrEOqq0K-FR4MIU54V2F8KEjt2Q6zwxGPGn-68eni_cylqDCs0U0wVZYfM', 'active', '0'),
(2, 'Pharos', '6674a303bb6261bdb78471fd9a923f9aed11258c', 'e7E27cvSmwI:APA91bHsDzqq5C8cCR2fujmrww6z0_eMYo9_B7hZs8iFr17XupiyEup-Q9E9jOXAFAznxWUKC0YrHTtZ_ncrEOqq0K-FR4MIU54V2F8KEjt2Q6zwxGPGn-68eni_cylqDCs0U0wVZYfM', 'active', '0'),
(3, 'Blue', 'ad16a67e273d65ac0704d3b8ebf2a1b87eead6d9', 'd8J2n_pGoN4:APA91bHkZ3cviAJbeRjU7RDONd1KUd7NYQCtCXKubM01yXQD-VQMukcEgjZ-IpFzvj4Pt64vv7UHHMBbXk3L_T5iowAQDw6tEJGoS6cMFuRLkQkjcdbfVisMJBAa-QG7TKobkSqs_7oN', 'active', '0'),
(4, 'Nblue', '40ef64954af0c761316291454aa2fcd897703c9f', 'd8J2n_pGoN4:APA91bHkZ3cviAJbeRjU7RDONd1KUd7NYQCtCXKubM01yXQD-VQMukcEgjZ-IpFzvj4Pt64vv7UHHMBbXk3L_T5iowAQDw6tEJGoS6cMFuRLkQkjcdbfVisMJBAa-QG7TKobkSqs_7oN', 'active', '0');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE IF NOT EXISTS `user_info` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `native_language` text NOT NULL,
  `gender` text NOT NULL,
  `has_image` text NOT NULL,
  `status` text NOT NULL,
  `phone_number` text NOT NULL,
  `date_of_birth` text NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `native_language`, `gender`, `has_image`, `status`, `phone_number`, `date_of_birth`) VALUES
(1, 'English', 'Male', '0', 'this is my status', 'Empty', 'Empty'),
(2, 'Arabic', 'Male', '0', 'this is my status', 'Empty', 'Empty'),
(3, 'English', 'Male', '0', '', '', ''),
(4, 'English', 'Male', '0', 'this is my status', 'Empty', 'Empty');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
