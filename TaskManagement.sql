-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 14, 2024 at 11:46 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `TaskManagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `SequelizeMeta`
--

CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `SequelizeMeta`
--

INSERT INTO `SequelizeMeta` (`name`) VALUES
('20240410124818-create-user.js'),
('20240410134318-add-phone-to-user.js'),
('20240410144428-add-password-to-users.js'),
('20240410221207-create-task.js');

-- --------------------------------------------------------

--
-- Table structure for table `Tasks`
--

CREATE TABLE `Tasks` (
  `id` int(11) NOT NULL,
  `taskname` varchar(255) NOT NULL,
  `taskdescription` varchar(255) NOT NULL,
  `priority` varchar(255) NOT NULL,
  `duedate` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Tasks`
--

INSERT INTO `Tasks` (`id`, `taskname`, `taskdescription`, `priority`, `duedate`, `createdAt`, `updatedAt`) VALUES
(40, 'lol', 'reddy', 'high', '30/09/2009', '2024-04-14 10:56:02', '2024-04-14 13:07:37'),
(41, 'sweety', 'test', 'test2', '09/09/1984999', '2024-04-14 10:56:49', '2024-04-14 10:56:49'),
(42, 'manju', 'test', 'test2', '09/09/1984999', '2024-04-14 10:58:27', '2024-04-14 10:58:27'),
(43, 'sweety', 'sweety', 'sweety', '09/09/1984999', '2024-04-14 11:01:32', '2024-04-14 11:01:32'),
(44, 'manju', 'reddy', 'reddy', '09/09/1984999', '2024-04-14 11:32:48', '2024-04-14 11:32:48'),
(45, 'jjj', 'test', 'reddyyy', 'reddy', '2024-04-14 12:09:47', '2024-04-14 12:09:47'),
(46, 'mmasajdd', 'greem', 'greem', '09/09/1984999', '2024-04-14 13:08:18', '2024-04-14 13:08:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `phone`, `createdAt`, `updatedAt`) VALUES
(58, 'ma', '$2a$10$gJuaCbonKgjpyIXTeUClBuw434mHJ7xALyCmxweuAzTSc1k4Q4iC.', 'manjure@gmail.com', NULL, '2024-04-10 20:00:05', '2024-04-10 20:00:05'),
(59, 'bunnu', '$2a$10$BXKU8vLngIJS4vHMSLAlVuhSKY/9djv9w6A0Zv95BvfNJeAC6XeZm', 'bunnu@gmail.com', NULL, '2024-04-10 20:12:30', '2024-04-10 20:12:30'),
(60, 'bebo', '$2a$10$C7TKMaR7ENtm8YSiRtFda.s53bT11OGmUoa4D8uZu6CO3jPxxjOtK', 'bebo@gmail.com', NULL, '2024-04-10 20:38:49', '2024-04-10 20:38:49'),
(61, 'manjusha', '$2a$10$eSeRW0Veh6kAwZcJ2Q359u8GGgxMNnzBjecnx1gjfy7DDQa9EM7eO', 'manju@gmail.com', NULL, '2024-04-14 14:27:16', '2024-04-14 14:27:16'),
(62, 'mmmm', '$2a$10$wcHlbWPWft4cji3yF6PnyuUT006tWaXTRmXxMNqYjE3dDENHX8RWa', 'red@gmail.com', NULL, '2024-04-14 14:40:19', '2024-04-14 14:40:19'),
(65, 'beboooo', '$2a$10$jbgKB3Iyo9EKE0PwlEXL7u1k9zGaVqEPR6L6KhroY2eAXN3aARKwS', 'chinnu100@gmail.com', NULL, '2024-04-14 14:50:05', '2024-04-14 14:50:05'),
(67, 'www', '$2a$10$.F9v2H7mRjRNaW3GC697wOt3TWHEc8yDginxL941hr4MhcK65UhUO', 'chinnu100@gmail.com', NULL, '2024-04-14 14:51:20', '2024-04-14 14:51:20'),
(68, 'www888', '$2a$10$SoeugNo0KbXTp6DQPX3YgODqerFCLmHeFbTKU31bsIq3Tvuip0tnO', 'chinnu100@gmail.com', NULL, '2024-04-14 14:52:17', '2024-04-14 14:52:17'),
(70, 't7676768', '$2a$10$epcns9Mt84uImVGM3jYIb.2RcyQ/t4V4PVSd1yBHYXdacWDLAwqdy', 'chinnu100@gmail.com', NULL, '2024-04-14 14:53:37', '2024-04-14 14:53:37'),
(71, 'manjusha.ramireddy@consultant.mannai.com.qa', '$2a$10$/YoAQEm.VhVa1srXfBkXaOHdzZE9cKilSxrL9cyS4RK8mR8fNOir2', 'manjusha84r2020@gmail.com', NULL, '2024-04-14 15:10:34', '2024-04-14 15:10:34'),
(72, 'manjusha.ramireda', '$2a$10$8dcZYbQgueATuu1HXolLwuD87YB0dCAGNC.m/ds5ZSeART1waagkK', 'manjusha84r992020@gmail.com', NULL, '2024-04-14 15:25:11', '2024-04-14 15:25:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `SequelizeMeta`
--
ALTER TABLE `SequelizeMeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `Tasks`
--
ALTER TABLE `Tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Tasks`
--
ALTER TABLE `Tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
