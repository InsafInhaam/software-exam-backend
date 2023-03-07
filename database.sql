-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2023 at 07:03 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `software_db`
--
CREATE DATABASE IF NOT EXISTS `software_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `software_db`;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `postId` int(11) DEFAULT NULL,
  `commentedBy` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment`, `postId`, `commentedBy`, `createdAt`, `updatedAt`) VALUES
(6, 'hello', 20, 8, '2023-03-07 18:00:51', '2023-03-07 18:00:51'),
(7, 'hi', 19, 8, '2023-03-07 18:01:00', '2023-03-07 18:01:00'),
(8, '👍👍👍', 24, 8, '2023-03-07 18:01:10', '2023-03-07 18:01:10'),
(9, 'hello', 19, 2, '2023-03-07 18:01:49', '2023-03-07 18:01:49'),
(10, '😎😎', 21, 2, '2023-03-07 18:02:06', '2023-03-07 18:02:06'),
(11, '🤣🤣', 25, 2, '2023-03-07 18:02:15', '2023-03-07 18:02:15');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `approved` tinyint(1) DEFAULT 0,
  `postedBy` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `name`, `description`, `approved`, `postedBy`, `createdAt`, `updatedAt`) VALUES
(19, 'test1', 'test1', 1, 2, '2023-03-07 17:54:52', '2023-03-07 17:54:52'),
(20, 'test2', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Autem voluptatum rerum repellat expedita fugiat explicabo unde dolore culpa officia tempore?', 1, 2, '2023-03-07 17:56:20', '2023-03-07 17:56:20'),
(21, 'test3', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Autem voluptatum rerum repellat expedita fugiat explicabo unde dolore culpa officia tempore?', 1, 2, '2023-03-07 17:56:26', '2023-03-07 17:56:26'),
(22, 'user1', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Autem voluptatum rerum repellat expedita fugiat explicabo unde dolore culpa officia tempore?', 0, 7, '2023-03-07 17:57:47', '2023-03-07 17:57:47'),
(23, 'user2', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Autem voluptatum rerum repellat expedita fugiat explicabo unde dolore culpa officia tempore?', 0, 7, '2023-03-07 17:57:56', '2023-03-07 17:57:56'),
(24, 'admin1', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Autem voluptatum rerum repellat expedita fugiat explicabo unde dolore culpa officia tempore?', 1, 8, '2023-03-07 18:00:37', '2023-03-07 18:00:37'),
(25, 'admin2', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Autem voluptatum rerum repellat expedita fugiat explicabo unde dolore culpa officia tempore?', 1, 8, '2023-03-07 18:00:46', '2023-03-07 18:00:46');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `userType` int(11) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `userType`, `createdAt`, `updatedAt`) VALUES
(2, 'insaf', 'insafinhaam732@gmail.com', '$2b$10$rdX.m06B5/x19rzh5OwGOOBxbrnkFik.57v2uDO1.k7fkYO582OF.', 1, '2023-03-03 05:23:48', '2023-03-03 05:23:48'),
(7, 'user', 'user@user.com', '$2b$10$3BczA4u6YKkzmPuq4NosJ.RDlgz4CNo9f8kxvCabHQoZ4/a/2ITKq', 0, '2023-03-07 17:57:30', '2023-03-07 17:57:30'),
(8, 'admin', 'admin@admin.com', '$2b$10$/ELLv2dJXX4qU75mvRygmu4VXUvhuM/MoJoa6Ie8F8k7rcKoEiGaW', 1, '2023-03-07 17:59:13', '2023-03-07 17:59:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postId` (`postId`),
  ADD KEY `commentedBy` (`commentedBy`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postedBy` (`postedBy`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`commentedBy`) REFERENCES `users` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`postedBy`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
