-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2023 at 01:41 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28
CREATE DATABASE IF NOT EXISTS db_ba3102;
USE db_ba3102;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `libraryinventorysystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `bookID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`bookID`, `title`, `description`, `quantity`) VALUES
(1, 'Book 1', 'Description of Book 1', 61),
(2, 'Book 2', 'Description of Book 2', 10),
(3, 'Book 3', 'Description of Book 3', 5),
(4, 'Book 4', 'Description of Book 4', 20),
(5, 'Book 5', 'Description of Book 5', 0);

-- --------------------------------------------------------

--
-- Table structure for table `book_transactions`
--

CREATE TABLE `book_transactions` (
  `transactionID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `bookID` int(11) NOT NULL,
  `inQuantity` int(11) NOT NULL,
  `outQuantity` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_transactions`
--

INSERT INTO `book_transactions` (`transactionID`, `userID`, `bookID`, `inQuantity`, `outQuantity`, `date`) VALUES
(23, 3, 1, 2, 0, '2023-10-22 09:20:17'),
(24, 3, 2, 0, 1, '2023-10-22 09:20:23'),
(25, 3, 3, 1, 0, '2023-10-22 09:20:29'),
(26, 3, 4, 0, 3, '2023-10-23 04:20:00'),
(27, 2, 5, 2, 0, '2023-10-23 06:05:00'),
(28, 3, 1, 4, 0, '2023-10-23 03:14:51'),
(29, 2, 1, 0, 5, '2023-10-23 03:20:58'),
(30, 3, 2, 0, 5, '2023-10-23 04:53:56'),
(31, 3, 1, 1, 0, '2023-10-23 05:08:34'),
(32, 3, 1, 0, 1, '2023-10-23 05:08:45'),
(33, 3, 1, 1, 0, '2023-10-23 05:10:03'),
(34, 3, 1, 0, 1, '2023-10-23 05:12:50'),
(35, 3, 1, 1, 0, '2023-10-23 05:18:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Admin','Client','Librarian') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `fullname`, `email`, `password`, `role`) VALUES
(1, 'Admin User', 'admin@g', '$2y$10$7WBXttrmFnqyZgP/w3hQCuj1UFGktv.zrkE7vVALTOhiOQa.LSSFq', 'Admin'),
(2, 'Client User', 'client@g', '$2y$10$7WBXttrmFnqyZgP/w3hQCuj1UFGktv.zrkE7vVALTOhiOQa.LSSFq', 'Client'),
(3, 'Librarian User', 'librarian@g', '$2y$10$7WBXttrmFnqyZgP/w3hQCuj1UFGktv.zrkE7vVALTOhiOQa.LSSFq', 'Librarian');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bookID`);

--
-- Indexes for table `book_transactions`
--
ALTER TABLE `book_transactions`
  ADD PRIMARY KEY (`transactionID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `bookID` (`bookID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `bookID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `book_transactions`
--
ALTER TABLE `book_transactions`
  MODIFY `transactionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_transactions`
--
ALTER TABLE `book_transactions`
  ADD CONSTRAINT `book_transactions_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`),
  ADD CONSTRAINT `book_transactions_ibfk_2` FOREIGN KEY (`bookID`) REFERENCES `books` (`bookID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
