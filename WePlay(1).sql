-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Dec 01, 2022 at 01:38 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `WePlay`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang_dijual`
--

CREATE TABLE `barang_dijual` (
  `nama_barang` varchar(255) NOT NULL,
  `kode_barang` varchar(255) NOT NULL,
  `harga` int NOT NULL,
  `stok` int NOT NULL,
  `diskon_harga` int NOT NULL,
  `deskripsi` varchar(4096) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barang_dijual`
--

INSERT INTO `barang_dijual` (`nama_barang`, `kode_barang`, `harga`, `stok`, `diskon_harga`, `deskripsi`) VALUES
('FIVE SENSORY BOX', 'FVSB01', 109000, 10, 0, 'Toko Komputer Masa Depan');

-- --------------------------------------------------------

--
-- Table structure for table `bonding_reminder`
--

CREATE TABLE `bonding_reminder` (
  `kode_pelanggan` varchar(255) NOT NULL,
  `kode_bonding_reminder` varchar(255) NOT NULL,
  `waktu` timestamp NOT NULL,
  `keterangan` varchar(4096) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gambar_barang`
--

CREATE TABLE `gambar_barang` (
  `gambar` mediumblob NOT NULL,
  `kode_barang` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `link_video_barang`
--

CREATE TABLE `link_video_barang` (
  `kode_barang` varchar(255) NOT NULL,
  `link_video` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `kode_pelanggan` varchar(255) NOT NULL,
  `nama_pelanggan` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_teleponn` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `HashingSandi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `kode_transaksi` varchar(255) NOT NULL,
  `kode_pelanggan` varchar(255) NOT NULL,
  `kode_metode` int NOT NULL,
  `tanggal_bayar` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengiriman`
--

CREATE TABLE `pengiriman` (
  `kode_transaksi` varchar(255) NOT NULL,
  `kode_ekspedisi` varchar(255) NOT NULL,
  `no_resi` varchar(255) NOT NULL,
  `status_paket` varchar(255) NOT NULL,
  `selesai` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `kode_transaksi` varchar(255) NOT NULL,
  `kode_barang` varchar(255) NOT NULL,
  `kode_pelanggan` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `jumlah_pembayaran` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`kode_transaksi`, `kode_barang`, `kode_pelanggan`, `keterangan`, `jumlah_pembayaran`) VALUES
('abcde12345', 'paket1', 'abc12345', 'tes', 100000),
('tes12345', 'mainan1', 'orang123', 'tes', 200000),
('tes12345', 'mainan1', 'orang123', 'tes', 200000),
('12345', '123', 'a123', 'drop table transaksi', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `ulasan`
--

CREATE TABLE `ulasan` (
  `kode_pelanggan` varchar(255) NOT NULL,
  `kode_barang` varchar(255) NOT NULL,
  `nilai_ulasan` int NOT NULL,
  `keterangan` varchar(4096) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
