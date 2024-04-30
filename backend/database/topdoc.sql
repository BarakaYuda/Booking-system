-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2024 at 04:55 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `topdoc`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password_hash` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` varchar(100) NOT NULL,
  `doctor_id` varchar(100) DEFAULT NULL,
  `patient_id` varchar(100) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `department_id` varchar(100) NOT NULL,
  `created_at` double NOT NULL,
  `appointment_at` double NOT NULL,
  `assigned` tinyint(1) NOT NULL,
  `appointment_number` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `header_id` varchar(100) NOT NULL,
  `decription` mediumtext NOT NULL DEFAULT 'created',
  `created_at` double NOT NULL,
  `updated_at` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department_doctors`
--

CREATE TABLE `department_doctors` (
  `department_id` varchar(100) NOT NULL,
  `doctors_id` varchar(100) NOT NULL,
  `created_at` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password_hash` varchar(500) NOT NULL,
  `created_at` double NOT NULL,
  `updated_at` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `name`, `email`, `password_hash`, `created_at`, `updated_at`) VALUES
('u6QxB5QtmabjKTvAT4X9GESgnDzAxB', 'saka', 'saka77@gmail.com', '', 1714406954604, 0);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password_hash` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `appointment_at` (`appointment_at`),
  ADD KEY `assigned` (`assigned`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `header_id` (`header_id`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `updated_at` (`updated_at`);

--
-- Indexes for table `department_doctors`
--
ALTER TABLE `department_doctors`
  ADD KEY `department_id` (`department_id`),
  ADD KEY `doctors_id` (`doctors_id`),
  ADD KEY `created_at` (`created_at`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `updated_at` (`updated_at`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `email` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
