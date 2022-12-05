-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Dec 05, 2022 at 02:42 AM
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
('FIVE SENSORY BOX', 'FVSB01', 109000, 10, 0, 'Toko Komputer Masa Depan'),
('VACATION ON BOARD', 'VCOB1', 129000, 50, 0, 'Vacation Onboard'),
('MENGENAL PEKERJAAN', 'MEPK01', 99000, 20, 0, 'Mengenal pekerjaan');

-- --------------------------------------------------------

--
-- Table structure for table `bonding_reminder`
--

CREATE TABLE `bonding_reminder` (
  `kode_pelanggan` int NOT NULL,
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
-- Table structure for table `keranjang_belanja`
--

CREATE TABLE `keranjang_belanja` (
  `kode_barang` varchar(255) NOT NULL,
  `kode_pelanggan` int NOT NULL,
  `pengiriman` varchar(255) NOT NULL,
  `jumlah` int NOT NULL
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
  `hashing_sandi` varchar(255) NOT NULL,
  `nama_pelanggan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `kode_pelanggan` int NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_teleponn` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`hashing_sandi`, `nama_pelanggan`, `kode_pelanggan`, `alamat`, `no_teleponn`, `email`) VALUES
('$5$rounds=535000$wWSIUArtXFKfysc3$CyHvmPdCTpx2XZrQUz7hPvucNCD/sHYrkKzPINH8KJ3', 'tes', 1, 'tes', '081', 'tes@contoh.id');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `kode_transaksi` varchar(255) NOT NULL,
  `kode_pelanggan` int NOT NULL,
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
  `kode_pelanggan` int NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `jumlah_pembayaran` int NOT NULL,
  `dibayar` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ulasan`
--

CREATE TABLE `ulasan` (
  `kode_pelanggan` int NOT NULL,
  `kode_barang` varchar(255) NOT NULL,
  `nilai_ulasan` int NOT NULL,
  `keterangan` varchar(4096) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
