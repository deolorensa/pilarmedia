-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 23 Jul 2023 pada 17.11
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pilarmedia`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `guests`
--

CREATE TABLE `guests` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `card` varchar(255) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `guests`
--

INSERT INTO `guests` (`id`, `name`, `email`, `card`, `birth`, `createdAt`, `updatedAt`) VALUES
(22, 'dinra', 'dinra@gmail.com', '123', '2023-07-14', '2023-07-23 15:07:29', '2023-07-23 15:07:29'),
(24, 'kita', 'kita@gmail.com', '99', '2023-07-07', '2023-07-23 15:08:01', '2023-07-23 15:08:01'),
(26, 'welp', 'welp@gmail.com', '33', '2023-07-13', '2023-07-23 15:08:56', '2023-07-23 15:08:56'),
(27, 'humo', 'humo@mail.com', '444', '2023-07-19', '2023-07-23 15:09:23', '2023-07-23 15:09:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id_order` int(100) NOT NULL,
  `id_pengirim` int(10) NOT NULL,
  `id_penerima` int(10) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `priority` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id_order`, `id_pengirim`, `id_penerima`, `alamat`, `priority`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Surabaya - osowilangon', 4, '2023-07-23 13:31:09', '2023-07-23 21:09:26'),
(2, 2, 2, 'Surabaya - pasarturi', 3, '2023-07-23 13:31:09', '2023-07-23 21:09:29'),
(3, 3, 3, 'Gresik - Kebomas', 5, '2023-07-23 13:31:09', '2023-07-23 21:09:31'),
(4, 4, 4, 'Sidoarjo - Aloha', 1, '2023-07-23 13:31:09', '2023-07-23 21:09:33'),
(5, 5, 5, 'Surabaya - Rungkut', 2, '2023-07-23 13:31:09', '2023-07-23 21:09:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `refresh_token` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `roles` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `refresh_token`, `createdAt`, `updatedAt`, `roles`) VALUES
(1, 'test', 'test@mail.com', '$2b$10$zY79GgQP3Mqcoo5wQKBbl.ACV9.zP0qOknEtaYXVBBRcESmcwo0Uq', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsIm5hbWUiOiJ0ZXN0IiwiZW1haWwiOiJ0ZXN0QG1haWwuY29tIiwiaWF0IjoxNjkwMDk3MzM3LCJleHAiOjE2OTAxODM3Mzd9.uMKNkLgwsFQhZ5DW6SiWn_OmBjbcLRdBIJQwQB2l1l4', '2022-07-20 17:43:44', '2023-07-23 07:28:57', 1),
(2, 'test2', 'test2@mail.com', '$2b$10$Qbt9UATIZ6ulu9GejJp9W.gtj00Jr2pq6FOM4KSaKL7UTPwE2M57G', NULL, '2022-07-20 18:12:23', '2022-07-20 18:12:23', 0),
(3, 'test3', 'test3@mail.com', '$2b$10$SJzOQlZEI3hQrfJVJRTPo.b3DLbI2C/WvvfKsHSOr8TSsOy4lK8NO', NULL, '2022-07-20 18:31:43', '2022-07-20 18:31:43', 0),
(4, 'test4', 'test4@mail.com', '$2b$10$xpXAmUVXW54b0kswVaG2neCXlkJG0W9bodTJsk3rT/zXestM.vRsW', NULL, '2022-07-20 19:58:57', '2022-07-20 19:58:57', 0),
(5, 'test5', 'test5@mail.com', '$2b$10$ak4R9C3duDOtC4kE2f66tOHRQbuinq4Z9CypNiSS3kuVLEquKp286', NULL, '2022-07-20 20:03:22', '2022-07-20 20:03:22', 0),
(6, 'deo21', 'deo@mail.com', '$2b$10$03YQfu/V53Llwezq7OLGOOL5G/ccPjR9R4.yKKLKsqJUDZ4QmgVLG', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjYsIm5hbWUiOiJkZW8yMSIsImVtYWlsIjoiZGVvQG1haWwuY29tIiwiaWF0IjoxNjkwMTI0ODE4LCJleHAiOjE2OTAyMTEyMTh9.gZzNAjxHv9WCdBBJoSahn874726Coh2yAdJZQhA1M_w', '2023-07-23 05:13:40', '2023-07-23 15:06:58', 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `guests`
--
ALTER TABLE `guests`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `guests`
--
ALTER TABLE `guests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
